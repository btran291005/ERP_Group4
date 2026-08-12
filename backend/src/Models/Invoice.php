<?php

namespace App\Models;

class Invoice extends BaseModel
{
    protected static string $table = "Invoice";
    protected static string $primaryKey = "InvoiceID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
