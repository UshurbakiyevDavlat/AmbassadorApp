<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Support\Collection;
use Services\UserService;

class AmbassadorController extends Controller
{
    public function __construct(private readonly UserService $service)
    {

    }

    /**
     * Get all users
     *
     * @return Collection
     * @throws Exception
     */
    public function index(): Collection
    {
        $users = collect($this->service->users());
        return $users->filter(fn($user) => $user['is_admin'] === 0)->values();
    }
}
