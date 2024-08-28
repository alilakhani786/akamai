<template>
  <CSidebar unfoldable color-scheme="">
    <CSidebarHeader class="border-bottom">
      <CSidebarBrand>CDA</CSidebarBrand>
    </CSidebarHeader>
    <CSidebarNav>
      <CNavTitle>Routes</CNavTitle>
      <CNavItem href="#">
        <CIcon customClassName="nav-icon" :icon="cilBarChart" /> Dashboard
      </CNavItem>
      <CNavItem href="#">
        <CIcon customClassName="nav-icon" :icon="cilBan" /> With badge
        <CBadge class="ms-auto" color="primary">NEW</CBadge>
      </CNavItem>
      <CNavGroup>
        <template #togglerContent>
          <CIcon customClassName="nav-icon" :icon="cilBan" /> Nav dropdown
        </template>
        <CNavItem href="#">
          <span class="nav-icon"><span class="nav-icon-bullet"></span></span> Nav dropdown item
        </CNavItem>
        <CNavItem href="#">
          <span class="nav-icon"><span class="nav-icon-bullet"></span></span> Nav dropdown item
        </CNavItem>
      </CNavGroup>
      <CNavItem href="https://jenkins.io">
        <CIcon customClassName="nav-icon" :icon="cibJenkins" /> Automation
      </CNavItem>
      <CNavItem>
        <router-link to="/" class="nav-link">
          <CIcon customClassName="nav-icon" :icon="cilAccountLogout" /> Logout
      </router-link>
      </CNavItem>
    </CSidebarNav>
    
  </CSidebar>
</template>
<script>
import {
  CNav, CNavItem, CNavLink, CSidebar, CSidebarNav, CNavGroup, CSidebarBrand, CSidebarHeader,
  CNavTitle, CBadge
} from '@coreui/vue'
import { CIcon } from '@coreui/icons-vue';

import {
  cilBarChart,
  cilAccountLogout,
  cibJenkins,
  cilBan
} from '@coreui/icons'
//  const vars = {
//   'sidebar-width': 10
//  }

export default {
  components: {
    CNav,
    CNavItem,
    CNavLink,
    CSidebarNav, CNavGroup, CSidebar, CSidebarBrand, CSidebarHeader,
    CNavTitle, CIcon
  },
  setup() {
    return {
      cilBan,
      cilBarChart,
      cilAccountLogout,
      cibJenkins
    }
  }
}
</script>

