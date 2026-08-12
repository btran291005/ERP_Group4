import { createRouter, createWebHashHistory } from 'https://unpkg.com/vue-router@4/dist/vue-router.esm-browser.js';
import { authStore } from '../store/auth.js';

import Login from '../views/auth/Login.js';
import DemandForecast from '../views/planner/DemandForecast.js';
import CreatePR from '../views/planner/CreatePR.js';
import MyPRHistory from '../views/planner/MyPRHistory.js';
import PRQueue from '../views/sourcing/PRQueue.js';
import VendorMasterForm from '../views/sourcing/VendorMasterForm.js';
import RFQQuotations from '../views/sourcing/RFQQuotations.js';
import ConvertToPO from '../views/sourcing/ConvertToPO.js';
import POApprovalDetail from '../views/manager/POApprovalDetail.js';
import ExecutiveDashboard from '../views/manager/ExecutiveDashboard.js';
import IncomingDeliveries from '../views/warehouse/IncomingDeliveries.js';
import GoodsReceiptExecution from '../views/warehouse/GoodsReceiptExecution.js';
import DiscrepancyLogs from '../views/warehouse/DiscrepancyLogs.js';
import ThreeWayMatch from '../views/accountant/ThreeWayMatch.js';
import Payments from '../views/accountant/Payments.js';
import UserRoleManagement from '../views/admin/UserRoleManagement.js';
import AuditLogViewer from '../views/admin/AuditLogViewer.js';
import RFQInbox from '../views/vendor-portal/RFQInbox.js';
import PODeliveries from '../views/vendor-portal/PODeliveries.js';
import SubmitInvoice from '../views/vendor-portal/SubmitInvoice.js';

// RoleID reference (seeded in backend/database/seeders/seed_core.sql):
// R01 Supply Chain Planner · R02 Sourcing Specialist · R03 Procurement Manager
// R04 Vendor · R05 Warehouse Clerk · R06 Accountant · R07 System Admin

const routes = [
  { path: '/login', component: Login, meta: { public: true } },

  { path: '/', redirect: '/forecast' },

  { path: '/forecast', component: DemandForecast, meta: { roles: ['R01'] } },
  { path: '/pr/create', component: CreatePR, meta: { roles: ['R01'] } },
  { path: '/pr/history', component: MyPRHistory, meta: { roles: ['R01'] } },

  { path: '/pr/queue', component: PRQueue, meta: { roles: ['R02'] } },
  { path: '/vendors', component: VendorMasterForm, meta: { roles: ['R02'] } },
  { path: '/rfq', component: RFQQuotations, meta: { roles: ['R02'] } },
  { path: '/po/convert', component: ConvertToPO, meta: { roles: ['R02'] } },

  { path: '/po/:id/approve', component: POApprovalDetail, meta: { roles: ['R03'] } },
  { path: '/dashboard', component: ExecutiveDashboard, meta: { roles: ['R03'] } },

  { path: '/warehouse/incoming', component: IncomingDeliveries, meta: { roles: ['R05'] } },
  { path: '/warehouse/goods-receipt', component: GoodsReceiptExecution, meta: { roles: ['R05'] } },
  { path: '/warehouse/discrepancies', component: DiscrepancyLogs, meta: { roles: ['R05'] } },

  { path: '/accounting/3-way-match', component: ThreeWayMatch, meta: { roles: ['R06'] } },
  { path: '/accounting/payments', component: Payments, meta: { roles: ['R06'] } },

  { path: '/admin/users', component: UserRoleManagement, meta: { roles: ['R07'] } },
  { path: '/admin/audit-log', component: AuditLogViewer, meta: { roles: ['R07'] } },

  { path: '/portal/rfq-inbox', component: RFQInbox, meta: { roles: ['R04'] } },
  { path: '/portal/deliveries', component: PODeliveries, meta: { roles: ['R04'] } },
  { path: '/portal/invoice', component: SubmitInvoice, meta: { roles: ['R04'] } },
];

export const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

router.beforeEach((to) => {
  if (to.meta.public) return true;

  if (!authStore.isLoggedIn()) {
    return '/login';
  }

  if (to.meta.roles && !to.meta.roles.includes(authStore.employee?.roleId)) {
    return '/'; // logged in but wrong role — TODO: route to a proper "403" view
  }

  return true;
});
