<?php

namespace App\Controllers;

use App\Core\Request;
use App\Core\Response;

/**
 * Screen 1.1 Demand & Forecast, low-stock flagging
 */
class ForecastController
{
    public function index(Request $request): void
    {
        Response::json(["message" => "ForecastController::index not implemented yet"]);
    }

    public function show(Request $request, string $id): void
    {
        Response::json(["message" => "ForecastController::show not implemented yet", "id" => $id]);
    }

    public function store(Request $request): void
    {
        Response::json(["message" => "ForecastController::store not implemented yet"], 201);
    }

    public function update(Request $request, string $id): void
    {
        Response::json(["message" => "ForecastController::update not implemented yet", "id" => $id]);
    }

    public function destroy(Request $request, string $id): void
    {
        Response::json(["message" => "ForecastController::destroy not implemented yet", "id" => $id]);
    }
}
