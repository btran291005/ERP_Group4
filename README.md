# Adidas Vietnam — Procurement Management System

Stack chosen for a ~1 week build, prioritizing zero build-tooling overhead and reuse of
skills from prior team projects (plain PHP + MySQL):

- **Backend**: PHP 8, plain PDO (no framework), custom router, JWT auth, REST JSON API.
  RBAC enforced at the route level against `Role_Permission` (screen 7.1's permission
  matrix, not just hardcoded role checks).
- **Frontend**: Vue 3 + Vue Router, loaded as native ES modules straight from CDN — no
  npm/webpack/Vite step. Bootstrap 5 for styling. Open `frontend/index.html` through any
  static server and it runs.
- **Database**: MySQL, schema in `backend/database/schema.sql` (24 entities, matches
  section 4.2 exactly, FK-safe creation order).

## Project structure

```
adidas-procurement-erp/
├── backend/
│   ├── config/            # database.php, constants.php
│   ├── public/             # index.php (front controller), .htaccess
│   ├── src/
│   │   ├── Core/            # Router, Request, Response, Database, Auth, Middleware/
│   │   ├── Models/          # 24 stub classes, one per ERD entity, extend BaseModel
│   │   ├── Controllers/     # 14 controllers, one per functional-spec screen group
│   │   └── Services/        # ThreeWayMatchService, LowStockService, AuditLogService, EvaluationScoreService
│   ├── routes/api.php       # full route table, grouped by role (screens 1.x .. 7.x)
│   ├── database/
│   │   ├── schema.sql       # CREATE TABLE for all 24 entities
│   │   └── seeders/seed_core.sql
│   ├── uploads/invoices/    # Invoice.AttachmentURL files land here
│   ├── composer.json
│   └── .env.example
├── frontend/
│   ├── index.html
│   └── src/
│       ├── api/client.js    # fetch wrapper, attaches JWT
│       ├── router/index.js  # route table, role-guarded
│       ├── store/auth.js    # logged-in user/role state
│       ├── components/      # Sidebar, AppShell, DataGrid
│       └── views/           # one file per screen, grouped by role folder
├── docs/
└── README.md
```

## Setup

**Backend**
```bash
cd backend
cp .env.example .env        # fill in DB credentials + JWT_SECRET
composer install            # pulls phpdotenv + firebase/php-jwt
mysql -u root -p < database/schema.sql
mysql -u root -p < database/seeders/seed_core.sql
php -S localhost:8000 -t public
```

**Frontend** — any static file server works, e.g.:
```bash
cd frontend
python3 -m http.server 5500
# open http://localhost:5500
```

## Suggested 1-week sprint plan

| Day | Focus | Controllers / Views |
|---|---|---|
| 1 | Schema + auth + RBAC skeleton | `schema.sql`, `AuthController`, `RoleMiddleware`, Login screen |
| 2 | Master data + PR flow | `VendorController`, `PurchaseRequisitionController`; Demand & Forecast, Create PR, My PR History |
| 3 | Sourcing flow | `RFQController`, `PurchaseOrderController` (convert); PR Queue, Vendor Master, RFQ & Quotations, Convert to PO |
| 4 | Approval + warehouse | `PurchaseOrderController` (approve), `GoodsReceiptController`, `DiscrepancyController`; PO Approval Detail, Goods Receipt, Discrepancy Logs |
| 5 | Finance | `InvoiceController` (+ `ThreeWayMatchService`), `PaymentController`; 3-Way Match, Payments, Submit Invoice (vendor portal) |
| 6 | Admin + dashboard | `UserController`, `AuditLogController`, `DashboardController`; User & Role Management, Audit Log Viewer, Executive Dashboard |
| 7 | Integration, demo data, bugfixing | End-to-end walkthrough of one PR → PO → GR → Invoice → Payment chain |

Every controller currently returns a `"not implemented yet"` stub JSON response — replace
the method bodies using the corresponding Model classes in `src/Models/` (generic CRUD is
already wired via `BaseModel`) and the business-rule Services already scaffolded.
