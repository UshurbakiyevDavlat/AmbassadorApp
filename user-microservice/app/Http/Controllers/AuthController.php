<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Foundation\Application;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
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
    public function register(Request $request): Application|\Illuminate\Http\Response|\Illuminate\Contracts\Foundation\Application|ResponseFactory
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

    /**
     * Login method
     *
     * @param Request $request
     * @return Application|\Illuminate\Http\Response|array|\Illuminate\Contracts\Foundation\Application|ResponseFactory
     */
    public function login(Request $request): Application|\Illuminate\Http\Response|array|\Illuminate\Contracts\Foundation\Application|ResponseFactory
    {
        if (!Auth::attempt($request->only('email', 'password'))) {
            return response([
                'error' => 'invalid credentials'
            ], Response::HTTP_UNAUTHORIZED);
        }
        $user = Auth::user();

        if ($request->scope == 'admin' && !$user->is_admin) {
            return response([
                'error' => 'Access Denied!'
            ], Response::HTTP_UNAUTHORIZED);
        }

        $jwt = $user->createToken('token', [$request->scope])->plainTextToken;

        return compact('jwt');
    }

    /**
     * Get authenticated user method
     *
     * @param Request $request
     * @return mixed
     */
    public function user(Request $request): mixed
    {
        return $request->user();
    }

    /**
     * Logout method
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function logout(Request $request): JsonResponse
    {
        $request->user()->tokens()->delete();

        return response()->json(['message' => 'success']);
    }

    /**
     * Update info method
     *
     * @param Request $request
     * @return \Illuminate\Http\Response|\Illuminate\Contracts\Foundation\Application|ResponseFactory
     */
    public function updateInfo(Request $request): \Illuminate\Http\Response|Application|ResponseFactory
    {
        $user = $request->user();
        $user->update($request->only('first_name', 'last_name', 'email'));

        return response($user);
    }

    /**
     * Update password method
     *
     * @param Request $request
     * @return \Illuminate\Http\Response|\Illuminate\Contracts\Foundation\Application|ResponseFactory
     */
    public function updatePassword(Request $request): \Illuminate\Http\Response|Application|ResponseFactory
    {
        $user = $request->user();
        $user->update([
            'password' => Hash::make($request->input('password'))
        ]);

        return response($user);
    }

    /**
     * Check either scope authorized to do actions.
     *
     * @param $scope
     * @param Request $request
     * @return string
     */
    public function scopeCan($scope, Request $request): string
    {
        if (!$request->user()->tokenCan($scope)) {
            abort(401, 'unauthorized');
        }

        return 'ok';
    }
}
