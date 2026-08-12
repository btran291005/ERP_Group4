<?php

namespace App\Models;

class Vendor extends BaseModel
{
    protected static string $table = "Vendor";
    protected static string $primaryKey = "VendorID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
