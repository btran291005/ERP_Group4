<?php

namespace App\Services;

use App\Core\Database;

/**
 * Business rule: "Every Create, Update, or Delete action performed on
 * procurement-related entities must generate a corresponding Audit_Log
 * record." Call this from controllers (or a model-level hook) after every
 * write.
 */
class AuditLogService
{
    public function log(string $employeeId, string $actionType, string $targetTable, string $targetId, ?array $old = null, ?array $new = null): void
    {
        $stmt = Database::connection()->prepare(
            'INSERT INTO Audit_Log (AuditID, EmployeeID, ActionType, TargetTable, TargetID, OldValue, NewValue, Timestamp)
             VALUES (?, ?, ?, ?, ?, ?, ?, NOW())'
        );

        $stmt->execute([
            'AL' . uniqid(),
            $employeeId,
            $actionType, // Create | Update | Delete
            $targetTable,
            $targetId,
            $old ? json_encode($old) : null,
            $new ? json_encode($new) : null,
        ]);
    }
}
