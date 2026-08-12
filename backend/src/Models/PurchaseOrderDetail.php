<?php

namespace App\Models;

class PurchaseOrderDetail extends BaseModel
{
    protected static string $table = "Purchase_Order_Detail";
    protected static string $primaryKey = "PODetailID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
