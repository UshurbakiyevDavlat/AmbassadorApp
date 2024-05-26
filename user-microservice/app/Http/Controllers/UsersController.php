<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Database\Eloquent\Collection;

class UsersController extends Controller
{
    /**
     * Get all users
     *
     * @return Collection
     */
    public function index(): Collection
    {
        return User::all();
    }

    /**
     * Get concrete user by id
     *
     * @param User $user
     * @return User
     */
    public function show(User $user): User
    {
        return $user;
    }
}
