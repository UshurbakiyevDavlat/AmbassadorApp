<?php

namespace Database\Seeders;

use App\Models\Link;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LinkSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        $items = DB::connection('monolith_mysql')->table('links')->get();

        foreach ($items as $item) {
            Link::create(collect($item)->toArray());
        }
    }
}
