<?php

namespace App\Http\Controllers;

use App\Http\Resources\OrderResource;
use App\Jobs\OrderCompletedJob;
use App\Models\Link;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Services\UserService;
use Cartalyst\Stripe\Stripe;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Http\Response;
use Throwable;

class OrderController extends Controller
{
    public function __construct(private readonly UserService $service)
    {

    }

    /**
     * Index orders method
     *
     * @return AnonymousResourceCollection
     */
    public function index(): AnonymousResourceCollection
    {
        return OrderResource::collection(Order::with('orderItems')->get());
    }

    /**
     * Store order method
     *
     * @param Request $request
     * @return Application|ResponseFactory|Response
     * @throws Throwable
     */
    public function store(Request $request): Response|Application|ResponseFactory
    {
        if (!$link = Link::where('code', $request->input('code'))->first()) {
            abort(400, 'Invalid code');
        }

        $user = $this->service->user($link->user_id);

        try {
            \DB::beginTransaction();

            $order = new Order();

            $order->code = $link->code;
            $order->user_id = $link->user_id;
            $order->ambassador_email = $user['email'];
            $order->first_name = $request->input('first_name');
            $order->last_name = $request->input('last_name');
            $order->email = $request->input('email');
            $order->address = $request->input('address');
            $order->country = $request->input('country');
            $order->city = $request->input('city');
            $order->zip = $request->input('zip');

            $order->save();

            $lineItems = [];

            foreach ($request->input('products') as $item) {
                $product = Product::find($item['product_id']);

                $orderItem = new OrderItem();
                $orderItem->order_id = $order->id;
                $orderItem->product_title = $product->title;
                $orderItem->price = $product->price;
                $orderItem->quantity = $item['quantity'];
                $orderItem->ambassador_revenue = 0.1 * $product->price * $item['quantity'];
                $orderItem->admin_revenue = 0.9 * $product->price * $item['quantity'];

                $orderItem->save();

                $lineItems[] = [
                    'name' => $product->title,
                    'description' => $product->description,
                    'images' => [
                        $product->image
                    ],
                    'amount' => 100 * $product->price,
                    'currency' => 'usd',
                    'quantity' => $item['quantity']
                ];
            }

            $stripe = Stripe::make(env('STRIPE_SECRET'));

            $source = $stripe->checkout()->sessions()->create([
                'payment_method_types' => ['card'],
                'line_items' => $lineItems,
                'success_url' => env('CHECKOUT_URL') . '/success?source={CHECKOUT_SESSION_ID}',
                'cancel_url' => env('CHECKOUT_URL') . '/error'
            ]);

            $order->transaction_id = $source['id'];
            $order->save();

            \DB::commit();

            OrderCompletedJob::dispatch($order->toArray())->onQueue('email_topic');

            return $source;
        } catch (Throwable $e) {
            \DB::rollBack();

            return response([
                'error' => $e->getMessage()
            ], 400);
        }
    }

    /**
     * Confirm order method
     *
     * @param Request $request
     * @return array|Response|Application|ResponseFactory
     */
    public function confirm(Request $request): array|Response|Application|ResponseFactory
    {
        if (!$order = Order::where('transaction_id', $request->input('source'))->first()) {
            return response([
                'error' => 'Order not found!'
            ], 404);
        }

        $order->complete = 1;
        $order->save();

        return [
            'message' => 'success'
        ];
    }
}
