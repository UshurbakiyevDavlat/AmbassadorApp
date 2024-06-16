<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Order
 * @method static create(array $array)
 * @method static where(string $string, mixed $id)
 * @property mixed $total
 */
class Order extends Model
{
    use HasFactory;

    protected $guarded = [];
}
