<?php

use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/register', [AuthController::class, 'register'])
    ->name('auth.register');

Route::post('/login', [AuthController::class, 'login'])
    ->name('auth.login');

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', [AuthController::class, 'user'])->name('auth.user');
    Route::post('/logout', [AuthController::class, 'logout'])->name('auth.logout');
    Route::put('/users/info', [AuthController::class, 'updateInfo'])->name('auth.update.info');
    Route::put('/users/password', [AuthController::class, 'updatePassword'])->name('auth.update.password');
});
