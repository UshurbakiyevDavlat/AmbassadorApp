<?php

declare(strict_types=1);

namespace App\Services;

class UserService extends ApiService
{

    /**
     * Register user method
     *
     * @param array $data
     * @return array|mixed
     */
    public function register(array $data): mixed
    {
        $this->endpoint = config('services.internal.users.address') . '/api';
        return $this->post('register', $data);
    }
}
