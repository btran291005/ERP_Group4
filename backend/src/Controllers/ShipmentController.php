<?php

namespace App\Controllers;

use App\Core\Request;
use App\Core\Response;

/**
 * Screens 4.2/4.3 Vendor PO Portal & Deliveries, 5.1 Incoming Deliveries
 */
class ShipmentController
{
    public function index(Request $request): void
    {
        Response::json(["message" => "ShipmentController::index not implemented yet"]);
    }

    public function show(Request $request, string $id): void
    {
        Response::json(["message" => "ShipmentController::show not implemented yet", "id" => $id]);
    }

    public function store(Request $request): void
    {
        Response::json(["message" => "ShipmentController::store not implemented yet"], 201);
    }

    public function update(Request $request, string $id): void
    {
        Response::json(["message" => "ShipmentController::update not implemented yet", "id" => $id]);
    }

    public function destroy(Request $request, string $id): void
    {
        Response::json(["message" => "ShipmentController::destroy not implemented yet", "id" => $id]);
    }
}
