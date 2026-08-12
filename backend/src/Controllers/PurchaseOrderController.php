<?php

namespace App\Controllers;

use App\Core\Request;
use App\Core\Response;

/**
 * Screens 2.4 Convert to PO, 3.1 PO Approval Detail (+ PO_Approval_History)
 */
class PurchaseOrderController
{
    public function index(Request $request): void
    {
        Response::json(["message" => "PurchaseOrderController::index not implemented yet"]);
    }

    public function show(Request $request, string $id): void
    {
        Response::json(["message" => "PurchaseOrderController::show not implemented yet", "id" => $id]);
    }

    public function store(Request $request): void
    {
        Response::json(["message" => "PurchaseOrderController::store not implemented yet"], 201);
    }

    public function update(Request $request, string $id): void
    {
        Response::json(["message" => "PurchaseOrderController::update not implemented yet", "id" => $id]);
    }

    public function destroy(Request $request, string $id): void
    {
        Response::json(["message" => "PurchaseOrderController::destroy not implemented yet", "id" => $id]);
    }
}
