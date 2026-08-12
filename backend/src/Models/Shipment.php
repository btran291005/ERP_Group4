<?php

namespace App\Models;

class Shipment extends BaseModel
{
    protected static string $table = "Shipment";
    protected static string $primaryKey = "ShipmentID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
