<?php

namespace Database\Seeders;

use App\Models\Order;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class OrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        $items = DB::connection('monolith_mysql')
            ->table('orders')
            ->get();

        foreach ($items as $item) {
            $orderItems = DB::connection('monolith_mysql')
                ->table('order_items')
                ->where('order_id', $item->id)
                ->get();

            Order::create([
                'id' => $item->id,
                'code' => $item->code,
                'user_id' => $item->user_id,
                'total' => $orderItems->sum(fn($item) => $item->ambassador_revenue),
                'created_at' => $item->created_at,
                'updated_at' => $item->updated_at,
            ]);
        }
    }
}
