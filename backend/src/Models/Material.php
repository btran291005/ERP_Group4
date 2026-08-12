<?php

namespace App\Models;

class Material extends BaseModel
{
    protected static string $table = "Material";
    protected static string $primaryKey = "MaterialID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
