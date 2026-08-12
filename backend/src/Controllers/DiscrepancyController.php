<?php

namespace App\Controllers;

use App\Core\Request;
use App\Core\Response;

/**
 * Screen 5.3 Discrepancy Logs
 */
class DiscrepancyController
{
    public function index(Request $request): void
    {
        Response::json(["message" => "DiscrepancyController::index not implemented yet"]);
    }

    public function show(Request $request, string $id): void
    {
        Response::json(["message" => "DiscrepancyController::show not implemented yet", "id" => $id]);
    }

    public function store(Request $request): void
    {
        Response::json(["message" => "DiscrepancyController::store not implemented yet"], 201);
    }

    public function update(Request $request, string $id): void
    {
        Response::json(["message" => "DiscrepancyController::update not implemented yet", "id" => $id]);
    }

    public function destroy(Request $request, string $id): void
    {
        Response::json(["message" => "DiscrepancyController::destroy not implemented yet", "id" => $id]);
    }
}
