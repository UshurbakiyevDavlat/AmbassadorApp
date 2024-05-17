<?php

namespace App\Console\Commands;

use App\Jobs\OrderCompletedJob;
use App\Models\Order;
use Illuminate\Console\Command;

class ProducerCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'broker:produce';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Message broker producer command';

    /**
     * Execute the console command.
     *
     * @return void
     */
    public function handle(): void
    {
        $order = Order::find(1);

        $order['ambassador_revenue'] = $order->ambassador_revenue;
        $order['admin_revenue'] = $order->admin_revenue;

        OrderCompletedJob::dispatch($order->toArray())->onQueue('email_topic');
    }
}
