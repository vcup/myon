import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router';
import Articles from '../pages/Articles.vue';

const routes: Array<RouteRecordRaw> = [
  {
    path: '/Articles',
    name: 'Articles',
    component: Articles
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
