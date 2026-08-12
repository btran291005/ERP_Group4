<?php

namespace App\Controllers;

use App\Core\Request;
use App\Core\Response;

/**
 * Screen 2.3 RFQ, Quotation intake, comparison matrix, evaluation scoring
 */
class RFQController
{
    public function index(Request $request): void
    {
        Response::json(["message" => "RFQController::index not implemented yet"]);
    }

    public function show(Request $request, string $id): void
    {
        Response::json(["message" => "RFQController::show not implemented yet", "id" => $id]);
    }

    public function store(Request $request): void
    {
        Response::json(["message" => "RFQController::store not implemented yet"], 201);
    }

    public function update(Request $request, string $id): void
    {
        Response::json(["message" => "RFQController::update not implemented yet", "id" => $id]);
    }

    public function destroy(Request $request, string $id): void
    {
        Response::json(["message" => "RFQController::destroy not implemented yet", "id" => $id]);
    }
}
