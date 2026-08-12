<?php

namespace App\Controllers;

use App\Core\Request;
use App\Core\Response;

/**
 * Screens 4.4 Submit Invoice, 6.1 3-Way Match Verification
 */
class InvoiceController
{
    public function index(Request $request): void
    {
        Response::json(["message" => "InvoiceController::index not implemented yet"]);
    }

    public function show(Request $request, string $id): void
    {
        Response::json(["message" => "InvoiceController::show not implemented yet", "id" => $id]);
    }

    public function store(Request $request): void
    {
        Response::json(["message" => "InvoiceController::store not implemented yet"], 201);
    }

    public function update(Request $request, string $id): void
    {
        Response::json(["message" => "InvoiceController::update not implemented yet", "id" => $id]);
    }

    public function destroy(Request $request, string $id): void
    {
        Response::json(["message" => "InvoiceController::destroy not implemented yet", "id" => $id]);
    }
}
