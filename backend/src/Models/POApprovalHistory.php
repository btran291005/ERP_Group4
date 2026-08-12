<?php

namespace App\Models;

class POApprovalHistory extends BaseModel
{
    protected static string $table = "PO_Approval_History";
    protected static string $primaryKey = "ApprovalID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
