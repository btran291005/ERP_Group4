<?php

namespace App\Models;

class Quotation extends BaseModel
{
    protected static string $table = "Quotation";
    protected static string $primaryKey = "QuotationID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
