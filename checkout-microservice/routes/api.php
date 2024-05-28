<?php

use App\Http\Controllers\LinkController;
use App\Http\Controllers\OrderController;
use Illuminate\Support\Facades\Route;

Route::get('links/{code}', [LinkController::class, 'show']);
Route::post('orders', [OrderController::class, 'store']);
Route::post('orders/confirm', [OrderController::class, 'confirm']);
