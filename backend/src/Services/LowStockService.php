<?php

namespace App\Services;

use App\Core\Database;

class LowStockService
{
    /**
     * Materials where CurrentStockQty has fallen below SafetyStockQty —
     * feeds the [Create PR for Low Stock] button on Screen 1.1.
     */
    public function belowSafetyStock(): array
    {
        $stmt = Database::connection()->query(
            "SELECT MaterialID, MaterialName, UnitOfMeasure, CurrentStockQty, SafetyStockQty
             FROM Material
             WHERE CurrentStockQty < SafetyStockQty AND Status = 'Active'"
        );

        return $stmt->fetchAll();
    }
}
