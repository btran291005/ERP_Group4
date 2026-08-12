<?php

use App\Core\Middleware\AuthMiddleware;
use App\Core\Middleware\RoleMiddleware;
use App\Controllers\AuthController;
use App\Controllers\ForecastController;
use App\Controllers\PurchaseRequisitionController;
use App\Controllers\VendorController;
use App\Controllers\RFQController;
use App\Controllers\PurchaseOrderController;
use App\Controllers\DashboardController;
use App\Controllers\ShipmentController;
use App\Controllers\GoodsReceiptController;
use App\Controllers\DiscrepancyController;
use App\Controllers\InvoiceController;
use App\Controllers\PaymentController;
use App\Controllers\UserController;
use App\Controllers\AuditLogController;

/** @var \App\Core\Router $router */

$auth = new AuthMiddleware();

// ---- Auth (public) ----
$router->post('/auth/login', [new AuthController(), 'login']);

// ---- 1. Supply Chain Planner ----
$router->get('/forecast', [new ForecastController(), 'index'], [$auth]);                       // 1.1
$router->get('/forecast/low-stock', [new ForecastController(), 'lowStock'], [$auth]);            // 1.1 [Create PR for Low Stock]
$router->get('/purchase-requisitions', [new PurchaseRequisitionController(), 'index'], [$auth]); // 1.3
$router->post('/purchase-requisitions', [new PurchaseRequisitionController(), 'store'], [$auth,
    new RoleMiddleware('Purchase Requisition', 'CanCreate')]);                                   // 1.2
$router->put('/purchase-requisitions/{id}', [new PurchaseRequisitionController(), 'update'], [$auth,
    new RoleMiddleware('Purchase Requisition', 'CanUpdate')]);
$router->delete('/purchase-requisitions/{id}', [new PurchaseRequisitionController(), 'destroy'], [$auth,
    new RoleMiddleware('Purchase Requisition', 'CanDelete')]);

// ---- 2. Sourcing / Purchasing Specialist ----
$router->get('/purchase-requisitions/queue', [new PurchaseRequisitionController(), 'queue'], [$auth]); // 2.1
$router->post('/rfq/group-from-pr', [new PurchaseRequisitionController(), 'groupToRfq'], [$auth]);     // 2.1 [Group PRs to RFQ]
$router->get('/vendors', [new VendorController(), 'index'], [$auth]);                                   // 2.2
$router->post('/vendors', [new VendorController(), 'store'], [$auth,
    new RoleMiddleware('Vendor Master', 'CanCreate')]);
$router->put('/vendors/{id}', [new VendorController(), 'update'], [$auth,
    new RoleMiddleware('Vendor Master', 'CanUpdate')]);
$router->get('/rfq', [new RFQController(), 'index'], [$auth]);                                          // 2.3
$router->post('/rfq', [new RFQController(), 'store'], [$auth, new RoleMiddleware('RFQ', 'CanCreate')]);
$router->post('/rfq/{id}/publish', [new RFQController(), 'publish'], [$auth]);                          // [Publish to Portal]
$router->post('/quotations/{id}/select-winner', [new RFQController(), 'selectWinner'], [$auth]);        // [Select Winning Quotation]
$router->post('/purchase-orders/from-quotation/{quotationId}', [new PurchaseOrderController(), 'convertFromQuotation'], [$auth,
    new RoleMiddleware('Purchase Order', 'CanCreate')]);                                                // 2.4

// ---- 3. Procurement Manager ----
$router->get('/purchase-orders/{id}', [new PurchaseOrderController(), 'show'], [$auth]);                // 3.1
$router->post('/purchase-orders/{id}/approve', [new PurchaseOrderController(), 'approve'], [$auth,
    new RoleMiddleware('Purchase Order', 'CanUpdate')]);
$router->post('/purchase-orders/{id}/reject', [new PurchaseOrderController(), 'reject'], [$auth,
    new RoleMiddleware('Purchase Order', 'CanUpdate')]);
$router->get('/dashboard/kpis', [new DashboardController(), 'index'], [$auth]);                         // 3.2

// ---- 4. Vendor Portal (external) ----
$router->get('/portal/rfq-inbox', [new RFQController(), 'inbox'], [$auth]);                             // 4.1
$router->post('/portal/quotations', [new RFQController(), 'submitQuotation'], [$auth]);                 // 4.1 [Submit Quotation]
$router->get('/portal/purchase-orders', [new PurchaseOrderController(), 'index'], [$auth]);              // 4.2
$router->post('/portal/purchase-orders/{id}/accept', [new PurchaseOrderController(), 'accept'], [$auth]); // [Accept PO]
$router->post('/portal/shipments', [new ShipmentController(), 'store'], [$auth]);                        // 4.3
$router->post('/portal/invoices', [new InvoiceController(), 'store'], [$auth]);                          // 4.4 [Submit Invoice]

// ---- 5. Warehouse Clerk ----
$router->get('/shipments/incoming', [new ShipmentController(), 'incoming'], [$auth]);                    // 5.1
$router->get('/purchase-orders/{id}/fetch-for-gr', [new GoodsReceiptController(), 'fetchPoData'], [$auth]); // 5.2 [Fetch PO Data]
$router->post('/goods-receipts', [new GoodsReceiptController(), 'store'], [$auth,
    new RoleMiddleware('Goods Receipt', 'CanCreate')]);                                                  // 5.2 [Post Goods Receipt]
$router->get('/discrepancy-tickets', [new DiscrepancyController(), 'index'], [$auth]);                   // 5.3
$router->put('/discrepancy-tickets/{id}', [new DiscrepancyController(), 'update'], [$auth]);

// ---- 6. Accountant ----
$router->get('/invoices/{id}/match', [new InvoiceController(), 'threeWayMatch'], [$auth]);               // 6.1
$router->post('/invoices/{id}/verify', [new InvoiceController(), 'verify'], [$auth,
    new RoleMiddleware('Invoice', 'CanUpdate')]);
$router->post('/discrepancy-tickets/raise', [new DiscrepancyController(), 'store'], [$auth]);            // [Raise Discrepancy Ticket]
$router->post('/payments', [new PaymentController(), 'store'], [$auth,
    new RoleMiddleware('Payment', 'CanCreate')]);                                                        // 6.2 [Execute Payment]

// ---- 7. System Admin ----
$router->get('/users', [new UserController(), 'index'], [$auth,
    new RoleMiddleware('User Management', 'CanRead')]);                                                  // 7.1
$router->post('/users', [new UserController(), 'store'], [$auth,
    new RoleMiddleware('User Management', 'CanCreate')]);
$router->put('/users/{id}', [new UserController(), 'update'], [$auth,
    new RoleMiddleware('User Management', 'CanUpdate')]);
$router->get('/audit-log', [new AuditLogController(), 'index'], [$auth,
    new RoleMiddleware('Audit Log', 'CanRead')]);                                                        // 7.2 (read-only)
