<?php

namespace App\Models;

class PurchaseOrder extends BaseModel
{
    protected static string $table = "Purchase_Order";
    protected static string $primaryKey = "POID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
