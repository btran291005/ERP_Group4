<?php

namespace App\Controllers;

use App\Core\Request;
use App\Core\Response;

/**
 * Screen 6.2 Payments
 */
class PaymentController
{
    public function index(Request $request): void
    {
        Response::json(["message" => "PaymentController::index not implemented yet"]);
    }

    public function show(Request $request, string $id): void
    {
        Response::json(["message" => "PaymentController::show not implemented yet", "id" => $id]);
    }

    public function store(Request $request): void
    {
        Response::json(["message" => "PaymentController::store not implemented yet"], 201);
    }

    public function update(Request $request, string $id): void
    {
        Response::json(["message" => "PaymentController::update not implemented yet", "id" => $id]);
    }

    public function destroy(Request $request, string $id): void
    {
        Response::json(["message" => "PaymentController::destroy not implemented yet", "id" => $id]);
    }
}
