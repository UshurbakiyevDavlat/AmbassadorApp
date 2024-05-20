<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Foundation\Application;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Symfony\Component\HttpFoundation\Response;

class AuthController extends Controller
{
    /**
     * Register user method
     *
     * @param Request $request
     * @return Application|\Illuminate\Http\Response|\Illuminate\Contracts\Foundation\Application|ResponseFactory
     */
    public function register(Request $request): Application|\Illuminate\Http\Response|\Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory
    {
        // what about unique field violation errors??
        $user = User::create(
            $request->only('first_name', 'last_name', 'email', 'is_admin')
            + [
                'password' => Hash::make($request->input('password')),
            ]
        );

        return response($user, Response::HTTP_CREATED);
    }
}
