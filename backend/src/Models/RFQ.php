<?php

namespace App\Models;

class RFQ extends BaseModel
{
    protected static string $table = "RFQ";
    protected static string $primaryKey = "RFQID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
