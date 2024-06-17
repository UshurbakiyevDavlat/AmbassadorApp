<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Services\UserService;

class ScopeAmbassadorMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param Request $request
     * @param Closure $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next): mixed
    {
        $response = app(UserService::class)->setRequest('get', 'scope/ambassador');

        if (!$response->ok()) {
            abort(401, 'unauthorized');
        }

        return $next($request);
    }
}
