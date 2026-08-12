<?php

namespace App\Models;

class RolePermission extends BaseModel
{
    protected static string $table = "Role_Permission";
    protected static string $primaryKey = "PermissionID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
