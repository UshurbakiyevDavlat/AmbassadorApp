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
        $items = DB::connection('monolith_mysql')->table('orders')->get();

        foreach ($items as $item) {
            Order::create(collect($item)->toArray());
        }
    }
}
