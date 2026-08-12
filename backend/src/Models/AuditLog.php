<?php

namespace App\Models;

class AuditLog extends BaseModel
{
    protected static string $table = "Audit_Log";
    protected static string $primaryKey = "AuditID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
