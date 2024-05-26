<?php

namespace App\Http\Controllers;

use App\Models\Link;
use App\Models\Order;
use App\Services\UserService;
use Exception;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;

class StatsController extends Controller
{
    public function __construct(private readonly UserService $service)
    {

    }

    /**
     * Index stats method
     *
     * @param Request $request
     * @return Link[]|Builder[]|Collection|\Illuminate\Support\Collection
     * @throws Exception
     */
    public function index(Request $request): Collection|\Illuminate\Support\Collection|array
    {
        $user = $this->service->profile();

        $links = Link::where('user_id', $user['id'])->get();

        return $links->map(function (Link $link) {
            $orders = Order::where('code', $link->code)->where('complete', 1)->get();

            return [
                'code' => $link->code,
                'count' => $orders->count(),
                'revenue' => $orders->sum(fn(Order $order) => $order->ambassador_revenue)
            ];
        });
    }

    /**
     * Get ranking stats method
     *
     * @return mixed
     */
    public function rankings(): mixed
    {
        return Redis::zrevrange('rankings', 0, -1, 'WITHSCORES');
    }
}
