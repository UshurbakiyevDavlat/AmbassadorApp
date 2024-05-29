<?php

namespace App\Http\Controllers;

use App\Events\ProductUpdatedEvent;
use App\Jobs\ProductCreatedJob;
use App\Jobs\ProductDeletedJob;
use App\Jobs\ProductUpdatedJob;
use App\Models\Product;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Str;
use Psr\SimpleCache\InvalidArgumentException;
use Symfony\Component\HttpFoundation\Response;

class ProductController extends Controller
{
    /**
     * Index products method
     *
     * @return \Illuminate\Database\Eloquent\Collection|array
     */
    public function index(): \Illuminate\Database\Eloquent\Collection|array
    {
        return Product::all();
    }

    /**
     * Store product method
     *
     * @param Request $request
     * @return \Illuminate\Http\Response|Application|ResponseFactory
     */
    public function store(Request $request): \Illuminate\Http\Response|Application|ResponseFactory
    {
        $product = Product::create($request->only('title', 'description', 'image', 'price'));

        ProductCreatedJob::dispatch($product->toArray())->onQueue('checkout_topic');

        return response($product, Response::HTTP_CREATED);
    }

    /**
     * Show product method
     *
     * @param Product $product
     * @return Product
     */
    public function show(Product $product): Product
    {
        return $product;
    }

    /**
     * Update product method
     *
     * @param Request $request
     * @param Product $product
     * @return \Illuminate\Http\Response|Application|ResponseFactory
     */
    public function update(Request $request, Product $product): \Illuminate\Http\Response|Application|ResponseFactory
    {
        $product->update($request->only('title', 'description', 'image', 'price'));

        ProductUpdatedJob::dispatch($product->toArray())->onQueue('checkout_topic');

        return response($product, Response::HTTP_ACCEPTED);
    }

    /**
     * Destroy product method
     *
     * @param Product $product
     * @return \Illuminate\Http\Response|Application|ResponseFactory
     */
    public function destroy(Product $product): \Illuminate\Http\Response|Application|ResponseFactory
    {
        $product->delete();

        ProductDeletedJob::dispatch(['id' => $product['id']])->onQueue('checkout_topic');

        return response(null, Response::HTTP_NO_CONTENT);
    }

    /**
     * Get products for frontend method
     *
     * @return mixed
     * @throws InvalidArgumentException
     */
    public function frontend(): mixed
    {
        if ($products = \Cache::get('products_frontend')) {
            return $products;
        }

        $products = Product::all();

        \Cache::set('products_frontend', $products, 30 * 60); //30 min

        return $products;
    }

    /**
     * Get products for backend method
     *
     * @param Request $request
     * @return array
     */
    public function backend(Request $request): array
    {
        $page = $request->input('page', 1);

        /** @var Collection $products */
        $products = \Cache::remember('products_backend', 30 * 60, fn() => Product::all());

        if ($s = $request->input('s')) {
            $products = $products
                ->filter(
                    fn(Product $product) => Str::contains($product->title, $s) || Str::contains($product->description, $s)
                );
        }

        $total = $products->count();

        if ($sort = $request->input('sort')) {
            if ($sort === 'asc') {
                $products = $products->sortBy([
                    fn($a, $b) => $a['price'] <=> $b['price']
                ]);
            } else if ($sort === 'desc') {
                $products = $products->sortBy([
                    fn($a, $b) => $b['price'] <=> $a['price']
                ]);
            }
        }

        return [
            'data' => $products->forPage($page, 9)->values(),
            'meta' => [
                'total' => $total,
                'page' => $page,
                'last_page' => ceil($total / 9)
            ]
        ];
    }
}
