<?php

namespace Database\Factories;

use App\Models\Link;
use App\Models\Order;
use Illuminate\Database\Eloquent\Factories\Factory;
use Random\RandomException;

class OrderFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Order::class;

    /**
     * Define the model's default state.
     *
     * @return array
     * @throws RandomException
     */
    public function definition(): array
    {
        /** @var Link $link */
        $link = Link::inRandomOrder()->first();

        return [
            'code' => $link->code,
            'user_id' => random_int(1,30),
            'ambassador_email' => $this->faker->email,
            'first_name' => $this->faker->firstName,
            'last_name' => $this->faker->lastName,
            'email' => $this->faker->email,
            'complete' => 1
        ];
    }
}
