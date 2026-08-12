import { authStore } from '../../store/auth.js';

// exposed to the template below

// Nav items per role — keep in sync with router/index.js and the sitemap.
const NAV_BY_ROLE = {
  R01: [
    { label: 'Demand & Forecast', to: '/forecast' },
    { label: 'Create PR', to: '/pr/create' },
    { label: 'My PR History', to: '/pr/history' },
  ],
  R02: [
    { label: 'PR Queue', to: '/pr/queue' },
    { label: 'Vendor Master', to: '/vendors' },
    { label: 'RFQ & Quotations', to: '/rfq' },
    { label: 'Convert to PO', to: '/po/convert' },
  ],
  R03: [
    { label: 'Executive Dashboard', to: '/dashboard' },
  ],
  R04: [
    { label: 'RFQ Inbox', to: '/portal/rfq-inbox' },
    { label: 'PO & Deliveries', to: '/portal/deliveries' },
    { label: 'Submit Invoice', to: '/portal/invoice' },
  ],
  R05: [
    { label: 'Incoming Deliveries', to: '/warehouse/incoming' },
    { label: 'Goods Receipt', to: '/warehouse/goods-receipt' },
    { label: 'Discrepancy Logs', to: '/warehouse/discrepancies' },
  ],
  R06: [
    { label: '3-Way Match', to: '/accounting/3-way-match' },
    { label: 'Payments', to: '/accounting/payments' },
  ],
  R07: [
    { label: 'User & Role Management', to: '/admin/users' },
    { label: 'Audit Log', to: '/admin/audit-log' },
  ],
};

export default {
  name: 'Sidebar',
  computed: {
    items() {
      return NAV_BY_ROLE[authStore.employee?.roleId] || [];
    },
    employeeName() {
      return authStore.employee?.name || '';
    },
  },
  methods: {
    logout() {
      authStore.logout();
      this.$router.push('/login');
    },
  },
  template: `
    <div class="d-flex flex-column bg-dark text-white p-3" style="width: 240px; min-height: 100vh;">
      <h6 class="text-uppercase text-secondary mb-3">Adidas VN Procurement</h6>
      <router-link v-for="item in items" :key="item.to" :to="item.to"
                   class="nav-link text-white mb-1">
        {{ item.label }}
      </router-link>
      <div class="mt-auto">
        <div class="small text-secondary mb-2">{{ employeeName }}</div>
        <button class="btn btn-outline-light btn-sm w-100" @click="logout">Đăng xuất</button>
      </div>
    </div>
  `,
};
