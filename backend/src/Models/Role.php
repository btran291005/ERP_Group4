<?php

namespace App\Models;

class Role extends BaseModel
{
    protected static string $table = "Role";
    protected static string $primaryKey = "RoleID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
