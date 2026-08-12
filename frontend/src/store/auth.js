import { reactive } from 'https://unpkg.com/vue@3/dist/vue.esm-browser.js';

export const authStore = reactive({
  token: localStorage.getItem('token') || null,
  employee: JSON.parse(localStorage.getItem('employee') || 'null'),

  isLoggedIn() {
    return !!this.token;
  },

  login(token, employee) {
    this.token = token;
    this.employee = employee;
    localStorage.setItem('token', token);
    localStorage.setItem('employee', JSON.stringify(employee));
  },

  logout() {
    this.token = null;
    this.employee = null;
    localStorage.removeItem('token');
    localStorage.removeItem('employee');
  },
});
