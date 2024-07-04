import { createRouter, createWebHistory } from 'vue-router'
import Data from '../components/Pages/Data.vue'
import Home from '../components/Pages/Home.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Akamai CDA Portal',
      component: Home
    },
    {
      path: '/data',
      name: 'Customer Data',
      component: Data
    },

  ]
})

export default router
