<?php

namespace App\Controllers;

use App\Core\Request;
use App\Core\Response;

/**
 * Screen 3.2 Executive Dashboard (KPIs, OTIF, top vendors)
 */
class DashboardController
{
    public function index(Request $request): void
    {
        Response::json(["message" => "DashboardController::index not implemented yet"]);
    }

    public function show(Request $request, string $id): void
    {
        Response::json(["message" => "DashboardController::show not implemented yet", "id" => $id]);
    }

    public function store(Request $request): void
    {
        Response::json(["message" => "DashboardController::store not implemented yet"], 201);
    }

    public function update(Request $request, string $id): void
    {
        Response::json(["message" => "DashboardController::update not implemented yet", "id" => $id]);
    }

    public function destroy(Request $request, string $id): void
    {
        Response::json(["message" => "DashboardController::destroy not implemented yet", "id" => $id]);
    }
}
