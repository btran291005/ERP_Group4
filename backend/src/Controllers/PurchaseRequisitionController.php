<?php

namespace App\Controllers;

use App\Core\Request;
use App\Core\Response;

/**
 * Screens 1.2 Create PR, 1.3 My PR History, 2.1 PR Queue
 */
class PurchaseRequisitionController
{
    public function index(Request $request): void
    {
        Response::json(["message" => "PurchaseRequisitionController::index not implemented yet"]);
    }

    public function show(Request $request, string $id): void
    {
        Response::json(["message" => "PurchaseRequisitionController::show not implemented yet", "id" => $id]);
    }

    public function store(Request $request): void
    {
        Response::json(["message" => "PurchaseRequisitionController::store not implemented yet"], 201);
    }

    public function update(Request $request, string $id): void
    {
        Response::json(["message" => "PurchaseRequisitionController::update not implemented yet", "id" => $id]);
    }

    public function destroy(Request $request, string $id): void
    {
        Response::json(["message" => "PurchaseRequisitionController::destroy not implemented yet", "id" => $id]);
    }
}
