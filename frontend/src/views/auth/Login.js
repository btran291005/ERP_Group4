import { api } from '../../api/client.js';
import { authStore } from '../../store/auth.js';

export default {
  name: 'Login',
  data() {
    return { email: '', password: '', error: null, loading: false };
  },
  methods: {
    async submit() {
      this.loading = true;
      this.error = null;
      try {
        const data = await api.post('/auth/login', { email: this.email, password: this.password });
        authStore.login(data.token, data.employee);
        this.$router.push('/');
      } catch (e) {
        this.error = e.message;
      } finally {
        this.loading = false;
      }
    },
  },
  template: `
    <div class="d-flex align-items-center justify-content-center vh-100 bg-light">
      <form class="card p-4 shadow-sm" style="width: 360px" @submit.prevent="submit">
        <h5 class="mb-3">Adidas VN — Procurement System</h5>
        <div class="mb-2">
          <label class="form-label">Email</label>
          <input v-model="email" type="email" class="form-control" required />
        </div>
        <div class="mb-3">
          <label class="form-label">Password</label>
          <input v-model="password" type="password" class="form-control" required />
        </div>
        <div v-if="error" class="alert alert-danger py-1">{{ error }}</div>
        <button class="btn btn-dark w-100" :disabled="loading">
          {{ loading ? 'Đang đăng nhập...' : 'Đăng nhập' }}
        </button>
      </form>
    </div>
  `,
};
