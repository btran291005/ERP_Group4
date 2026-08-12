<?php

namespace App\Models;

class Payment extends BaseModel
{
    protected static string $table = "Payment";
    protected static string $primaryKey = "PaymentID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
