<?php

// Keep these in sync with ModuleName values seeded into Role_Permission
// and used by RoleMiddleware — this is what Screen 7.1's permission
// matrix checkboxes actually control.
return [
    'MODULES' => [
        'PURCHASE_REQUISITION' => 'Purchase Requisition',
        'VENDOR_MASTER'        => 'Vendor Master',
        'RFQ'                  => 'RFQ',
        'PURCHASE_ORDER'       => 'Purchase Order',
        'GOODS_RECEIPT'        => 'Goods Receipt',
        'INVOICE'              => 'Invoice',
        'PAYMENT'              => 'Payment',
        'USER_MANAGEMENT'      => 'User Management',
        'AUDIT_LOG'            => 'Audit Log',
    ],
];
