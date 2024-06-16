<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            LinkSeeder::class,
            ProductSeeder::class,
            OrderSeeder::class,
            LinkProductSeeder::class,
        ]);
    }
}
