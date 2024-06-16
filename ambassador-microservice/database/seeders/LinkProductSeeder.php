<?php

namespace Database\Seeders;

use App\Models\LinkProduct;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LinkProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        $items = DB::connection('monolith_mysql')->table('link_products')->get();

        foreach ($items as $item) {
            LinkProduct::create(collect($item)->toArray());
        }
    }
}
