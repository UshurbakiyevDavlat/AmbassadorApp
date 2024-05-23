<?php

namespace App\Http\Controllers;

use App\Http\Requests\RegisterRequest;
use App\Http\Requests\UpdateInfoRequest;
use App\Http\Requests\UpdatePasswordRequest;
use App\Http\Resources\UserResource;
use App\Services\UserService;
use Auth;
use Exception;
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

    /**
     * Login method
     *
     * @param Request $request
     * @return Application|ResponseFactory|\Illuminate\Http\Response
     * @throws Exception
     */
    public function login(Request $request): \Illuminate\Http\Response|Application|ResponseFactory
    {

        $scope = $request->path() === 'api/admin/login' ? 'admin' : 'ambassador';
        $data = $request->only('email', 'password') + compact('scope');
        $response = $this->service->login($data);

        if (!$response['jwt'] ?? true) {
            throw new Exception("Jwt token wasn't been generated");
        }

        $cookie = cookie('jwt', $response['jwt'], 60 * 24); // 1 day

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
