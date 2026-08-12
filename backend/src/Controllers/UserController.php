<?php

namespace App\Controllers;

use App\Core\Request;
use App\Core\Response;

/**
 * Screen 7.1 User & Role Management
 */
class UserController
{
    public function index(Request $request): void
    {
        Response::json(["message" => "UserController::index not implemented yet"]);
    }

    public function show(Request $request, string $id): void
    {
        Response::json(["message" => "UserController::show not implemented yet", "id" => $id]);
    }

    public function store(Request $request): void
    {
        Response::json(["message" => "UserController::store not implemented yet"], 201);
    }

    public function update(Request $request, string $id): void
    {
        Response::json(["message" => "UserController::update not implemented yet", "id" => $id]);
    }

    public function destroy(Request $request, string $id): void
    {
        Response::json(["message" => "UserController::destroy not implemented yet", "id" => $id]);
    }
}
