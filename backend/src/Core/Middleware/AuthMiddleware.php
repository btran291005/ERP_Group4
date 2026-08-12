<?php

namespace App\Core\Middleware;

use App\Core\Auth;
use App\Core\Request;
use App\Core\Response;

class AuthMiddleware
{
    public function __invoke(Request $request): void
    {
        $claims = Auth::verifyToken($request->bearerToken());

        if (!$claims) {
            Response::error('Unauthorized', 401);
        }

        // Stash on the request for controllers/RoleMiddleware to read
        $request->body['_auth'] = $claims;
    }
}
