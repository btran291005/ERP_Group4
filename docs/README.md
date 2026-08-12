# Docs

Full references live in the project report, not duplicated here:
- **ERD / Database Design** — section 4.2 (24 entities) → mirrored as executable SQL in
  `backend/database/schema.sql`
- **Functional — Detailed Screen spec** → mirrored 1:1 as controllers
  (`backend/src/Controllers/`) and views (`frontend/src/views/`)

## Sitemap (for quick reference while wiring routes)

```
📁 ADIDAS PROCUREMENT OS
├── 0. Landing Page
├── MASTER DATA — Material Master, Supplier Master
├── INTERNAL PORTAL (6 roles)
│   ├── 1. Supply Chain Planner — 1.1 Demand & Forecast · 1.2 Create PR · 1.3 My PR History
│   ├── 2. Sourcing Specialist — 2.1 PR Queue · 2.2 Vendor Master · 2.3 RFQ & Quotations · 2.4 Convert to PO
│   ├── 3. Procurement Manager — 3.1 PO Approval Detail · 3.2 Executive Dashboard
│   ├── 4. Warehouse Clerk       — 4.1 Incoming Deliveries · 4.2 Goods Receipt Execution · 4.3 Discrepancy Logs
│   ├── 5. Accountant            — 5.1 3-Way Match Verification · 5.2 Payments
│   └── 6. System Admin          — 6.1 User & Role Management · 6.2 Audit Log Viewer
└── EXTERNAL PORTAL (1 role)
    └── 7. Vendor — 7.1 RFQ Inbox · 7.2/7.3 PO Portal & Deliveries · 7.4 Submit Invoice
```

Note: the numbering above follows the original sitemap doc, which labels Warehouse Clerk
as role 4 there while the DB/functional spec calls it role 5 — the route/controller
naming in this codebase follows the DB & functional spec numbering (RoleID R05 = Warehouse
Clerk, R06 = Accountant, R07 = Admin). Reconcile the numbering before the report's final pass.
