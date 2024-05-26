<?php

namespace App\Console\Commands;

use App\Models\Order;
use App\Services\UserService;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Redis;

class UpdateRankingsCommand extends Command
{
    protected $signature = 'update:rankings';

    /**
     * Handle method for update ranking command
     *
     * @return void
     */
    public function handle(): void
    {
        $ambassadors = collect(app(UserService::class)->users());

        $bar = $this->output->createProgressBar($ambassadors->count());

        $bar->start();

        $ambassadors->each(function ($user) use ($bar) {
            $orders = Order::where('user_id', $user['id'])->get();
            $revenue = $orders->sum(fn(Order $order) => $order->ambassador_revenue);

            Redis::zadd('rankings', $revenue, $user['first_name'] . $user['last_name']);

            $bar->advance();
        });

        $bar->finish();
    }
}
