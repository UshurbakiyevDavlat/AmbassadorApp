<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        $items = DB::connection('monolith_mysql')->table('products')->get();

        foreach ($items as $item) {
            Product::create(collect($item)->toArray());
        }
    }
}
