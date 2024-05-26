<?php

namespace Database\Factories;

use App\Models\Link;
use Illuminate\Database\Eloquent\Factories\Factory;
use Random\RandomException;

class LinkFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Link::class;

    /**
     * Define the model's default state.
     *
     * @return array
     * @throws RandomException
     */
    public function definition(): array
    {
        return [
            'code' => $this->faker->slug,
            'user_id' => random_int(1, 30)
        ];
    }
}
