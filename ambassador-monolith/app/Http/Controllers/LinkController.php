<?php

namespace App\Http\Controllers;

use App\Http\Resources\LinkResource;
use App\Models\Link;
use App\Models\LinkProduct;
use App\Services\UserService;
use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Support\Str;

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

        foreach ($request->input('products') as $product_id) {
            LinkProduct::create([
                'link_id' => $link->id,
                'product_id' => $product_id
            ]);
        }

        return $link;
    }

    /**
     * Show the link method
     *
     * @param string $code
     * @return object|array
     * @throws Exception
     */
    public function show(string $code): object|array
    {
        $link = Link::with('products')->where('code', $code)->first();
        $user = $this->service->user($link->user_id);
        $link['user'] = $user;

        return $link;
    }
}
