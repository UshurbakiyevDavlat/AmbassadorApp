<?php

namespace App\Http\Controllers;

use App\Http\Resources\LinkResource;
use App\Jobs\LinkCreatedJob;
use App\Models\Link;
use App\Models\LinkProduct;
use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Support\Str;
use Services\UserService;

class LinkController extends Controller
{
    public function __construct(private readonly UserService $service)
    {

    }

    /**
     * Index links method
     *
     * @param $id
     * @return AnonymousResourceCollection
     */
    public function index($id): AnonymousResourceCollection
    {
        $links = Link::with('orders')->where('user_id', $id)->get();

        return LinkResource::collection($links);
    }

    /**
     * Store links method
     *
     * @param Request $request
     * @return Model|Link
     * @throws Exception
     */
    public function store(Request $request): Model|Link
    {
        $user = $this->service->profile();

        $link = Link::create([
            'user_id' => $user['id'],
            'code' => Str::random(6)
        ]);

        $linkProducts = [];

        foreach ($request->input('products') as $product_id) {
            $linkProduct = LinkProduct::create([
                'link_id' => $link->id,
                'product_id' => $product_id
            ]);

            $linkProducts[] = $linkProduct->toArray();
        }

        LinkCreatedJob::dispatch([
            'link' => $link->toArray(),
            'linkProducts' => $linkProducts,
        ])
            ->onQueue('checkout_topic');

        LinkCreatedJob::dispatch([
            'link' => $link->toArray(),
            'linkProducts' => $linkProducts,
        ])
            ->onQueue('admin_topic');

        return $link;
    }
}
