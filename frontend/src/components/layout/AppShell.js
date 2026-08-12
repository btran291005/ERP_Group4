import { authStore } from '../../store/auth.js';
import Sidebar from './Sidebar.js';

export default {
  name: 'AppShell',
  components: { Sidebar },
  computed: {
    isLoggedIn() {
      return authStore.isLoggedIn();
    },
  },
  template: `
    <router-view v-if="!isLoggedIn" />
    <div v-else class="d-flex">
      <Sidebar />
      <div class="flex-grow-1">
        <router-view />
      </div>
    </div>
  `,
};
