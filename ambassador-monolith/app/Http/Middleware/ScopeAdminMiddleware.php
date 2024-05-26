<?php

namespace App\Http\Middleware;

use App\Services\UserService;
use Closure;
use Illuminate\Http\Request;

class ScopeAdminMiddleware
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
        $response = app(UserService::class)->setRequest('get', 'scope/admin');

        if (!$response->ok()) {
            abort(401, 'unauthorized');
        }

        return $next($request);
    }
}
