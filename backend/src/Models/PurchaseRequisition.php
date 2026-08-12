<?php

namespace App\Models;

class PurchaseRequisition extends BaseModel
{
    protected static string $table = "Purchase_Requisition";
    protected static string $primaryKey = "PRID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
