<?php

namespace App\Controllers;

use App\Core\Request;
use App\Core\Response;

/**
 * Screen 7.2 Audit Log Viewer
 */
class AuditLogController
{
    public function index(Request $request): void
    {
        Response::json(["message" => "AuditLogController::index not implemented yet"]);
    }

    public function show(Request $request, string $id): void
    {
        Response::json(["message" => "AuditLogController::show not implemented yet", "id" => $id]);
    }

    public function store(Request $request): void
    {
        Response::json(["message" => "AuditLogController::store not implemented yet"], 201);
    }

    public function update(Request $request, string $id): void
    {
        Response::json(["message" => "AuditLogController::update not implemented yet", "id" => $id]);
    }

    public function destroy(Request $request, string $id): void
    {
        Response::json(["message" => "AuditLogController::destroy not implemented yet", "id" => $id]);
    }
}
