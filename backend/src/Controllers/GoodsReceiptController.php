<?php

namespace App\Controllers;

use App\Core\Request;
use App\Core\Response;

/**
 * Screen 5.2 Goods Receipt Execution
 */
class GoodsReceiptController
{
    public function index(Request $request): void
    {
        Response::json(["message" => "GoodsReceiptController::index not implemented yet"]);
    }

    public function show(Request $request, string $id): void
    {
        Response::json(["message" => "GoodsReceiptController::show not implemented yet", "id" => $id]);
    }

    public function store(Request $request): void
    {
        Response::json(["message" => "GoodsReceiptController::store not implemented yet"], 201);
    }

    public function update(Request $request, string $id): void
    {
        Response::json(["message" => "GoodsReceiptController::update not implemented yet", "id" => $id]);
    }

    public function destroy(Request $request, string $id): void
    {
        Response::json(["message" => "GoodsReceiptController::destroy not implemented yet", "id" => $id]);
    }
}
