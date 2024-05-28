<?php

namespace App\Http\Controllers;

use App\Models\Link;
use App\Models\LinkProduct;
use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Services\UserService;

class LinkController extends Controller
{
    public function __construct(private readonly UserService $service)
    {

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
