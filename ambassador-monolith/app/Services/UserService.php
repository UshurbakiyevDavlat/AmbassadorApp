<?php

declare(strict_types=1);

namespace App\Services;

class UserService extends ApiService
{

    public function __construct()
    {
        $this->endpoint = config('services.internal.users.address') . '/api';
    }

    /**
     * Register user method
     *
     * @param array $data
     * @return array|mixed
     */
    public function register(array $data): mixed
    {
        return $this->post('register', $data);
    }

    /**
     * Register user method
     *
     * @param array $data
     * @return array|mixed
     */
    public function login(array $data): mixed
    {
        return $this->post('login', $data);
    }

    /**
     * Get authenticated user method
     *
     * @return array|mixed
     */
    public function user(): mixed
    {
        return $this->get('user');
    }
}
