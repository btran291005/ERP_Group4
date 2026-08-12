<?php

namespace App\Models;

class InvoiceDetail extends BaseModel
{
    protected static string $table = "Invoice_Detail";
    protected static string $primaryKey = "InvoiceDetailID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
