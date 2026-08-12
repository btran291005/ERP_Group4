<?php

namespace App\Models;

class Employee extends BaseModel
{
    protected static string $table = "Employee";
    protected static string $primaryKey = "EmployeeID";

    // Add entity-specific query methods here (e.g. findByStatus, findByVendor)
}
