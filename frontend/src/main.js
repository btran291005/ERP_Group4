import { createApp } from 'https://unpkg.com/vue@3/dist/vue.esm-browser.js';
import { router } from './router/index.js';
import AppShell from './components/layout/AppShell.js';

createApp(AppShell).use(router).mount('#app');
