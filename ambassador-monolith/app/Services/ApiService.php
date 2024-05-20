<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

abstract class ApiService
{
    public string $endpoint;

    /**
     * Post method for api call
     *
     * @param $path
     * @param $data
     * @return array|mixed
     */
    public function post($path, $data): mixed
    {
        return Http::post("{$this->endpoint}/$path", $data)->json();
    }
}
