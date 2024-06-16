<?php

namespace App\Http\Controllers;

use App\Http\Resources\LinkResource;
use App\Jobs\LinkCreatedJob;
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
}
