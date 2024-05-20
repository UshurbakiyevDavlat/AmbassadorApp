<?php

namespace App\Http\Controllers;

use App\Http\Requests\RegisterRequest;
use App\Http\Requests\UpdateInfoRequest;
use App\Http\Requests\UpdatePasswordRequest;
use App\Http\Resources\UserResource;
use App\Services\UserService;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AuthController extends Controller
{
    public function __construct(private readonly UserService $service)
    {
    }

    /**
     * Register method
     *
     * @param RegisterRequest $request
     * @return \Illuminate\Http\Response|Application|ResponseFactory
     */
    public function register(RegisterRequest $request): \Illuminate\Http\Response|Application|ResponseFactory
    {
        // what about validation errors??
        $user = $request->only('first_name', 'last_name', 'email', 'password')
            + [
                'is_admin' => $request->path() === 'api/admin/register' ? 1 : 0
            ];

        $this->service->register($user);

        return response($user, Response::HTTP_CREATED);
    }

    public function login(Request $request)
    {
        if (!\Auth::attempt($request->only('email', 'password'))) {
            return response([
                'error' => 'invalid credentials'
            ], Response::HTTP_UNAUTHORIZED);
        }

        $user = \Auth::user();

        $adminLogin = $request->path() === 'api/admin/login';

        if ($adminLogin && !$user->is_admin) {
            return response([
                'error' => 'Access Denied!'
            ], Response::HTTP_UNAUTHORIZED);
        }

        $scope = $adminLogin ? 'admin' : 'ambassador';
        $jwt = $user->createToken('token', [$scope])->plainTextToken;

        $cookie = cookie('jwt', $jwt, 60 * 24); // 1 day

        return response([
            'message' => 'success'
        ])->withCookie($cookie);
    }

    public function user(Request $request)
    {
        $user = $request->user();

        return new UserResource($user);
    }

    public function logout()
    {
        $cookie = \Cookie::forget('jwt');

        return response([
            'message' => 'success'
        ])->withCookie($cookie);
    }

    public function updateInfo(UpdateInfoRequest $request)
    {
        $user = $request->user();

        $user->update($request->only('first_name', 'last_name', 'email'));

        return response($user, Response::HTTP_ACCEPTED);
    }

    public function updatePassword(UpdatePasswordRequest $request)
    {
        $user = $request->user();

        $user->update([
            'password' => \Hash::make($request->input('password'))
        ]);

        return response($user, Response::HTTP_ACCEPTED);
    }
}
