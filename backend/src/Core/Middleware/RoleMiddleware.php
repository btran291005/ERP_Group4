<?php

namespace App\Core\Middleware;

use App\Core\Database;
use App\Core\Request;
use App\Core\Response;

/**
 * Enforces the Role_Permission matrix configured on Screen 7.1
 * (User & Role Management). Use like:
 *   $router->post('/vendors', [VendorController::class, 'store'],
 *       [new AuthMiddleware(), new RoleMiddleware('Vendor Master', 'CanCreate')]);
 */
class RoleMiddleware
{
    public function __construct(
        private string $moduleName,
        private string $action // CanCreate | CanRead | CanUpdate | CanDelete
    ) {
    }

    public function __invoke(Request $request): void
    {
        $claims = $request->body['_auth'] ?? null;

        if (!$claims) {
            Response::error('Unauthorized', 401);
        }

        $stmt = Database::connection()->prepare(
            "SELECT {$this->action} FROM Role_Permission WHERE RoleID = ? AND ModuleName = ?"
        );
        $stmt->execute([$claims['role'], $this->moduleName]);
        $allowed = $stmt->fetchColumn();

        if (!$allowed) {
            Response::error('Forbidden — insufficient permissions', 403);
        }
    }
}
