import { createRouter, createWebHistory } from 'vue-router'
import Data from '../components/Pages/Data.vue'
import Home from '../components/Pages/Home.vue'
import Detail from '../components/Pages/Detail.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Akamai CDA Portal',
      component: Home
    },
    {
      path: '/data/:id',
      name: 'Customer Data',
      component: Data,
      props: true
    },
    {
      path: '/data/:id/detail',
      name: 'Customer Data Detail',
      component: Detail,
    }

  ]
})

export default router
