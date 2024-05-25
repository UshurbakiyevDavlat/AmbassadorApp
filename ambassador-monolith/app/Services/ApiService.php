<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

abstract class ApiService
{
    public string $endpoint;

    /**
     * Post method for api call
     *
     * @param string $path
     * @param array $data
     * @return array|mixed
     */
    protected function post(string $path, array $data): mixed
    {
        return Http::post("{$this->endpoint}/$path", $data)->json();
    }

    /**
     * Get method for api call
     *
     * @param string $path
     * @return array|mixed
     */
    protected function get(string $path): mixed
    {
        return Http::acceptJson()->withHeaders([
            'Authorization' => 'Bearer ' . request()->cookie('jwt')
        ])
            ->get("{$this->endpoint}/$path")
            ->json();
    }
}
