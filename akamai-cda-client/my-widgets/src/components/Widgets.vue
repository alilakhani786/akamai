<template>
    <CCol :xl=10>
      <CWidgetStatsA class="mb-3" color="primary" height="25px">
        <template #value>
          26d
        </template>
        <template #title>
          Users
        </template>
      </CWidgetStatsA>
    </CCol>
    <CCol :xl=10>
      <CWidgetStatsA class="mb-3" color="warning">
        <template #value>
          26d
        </template>
        <template #title>
          Users
        </template>
      </CWidgetStatsA>
    </CCol>
    <CCol :xl=10>
      <CWidgetStatsA class="mb-3" color="primary">
        <template #value>
          26d
        </template>
        <template #title>
          Users
        </template>
      </CWidgetStatsA>
    </CCol>

</template>

<script>
import { CRow, CCol, CWidgetStatsA } from '@coreui/vue';
import '@coreui/coreui/dist/css/coreui.min.css'

export default {
  name: 'Widgets',
  components: {
    CRow,
    CCol,
    CWidgetStatsA,
  },
};
</script>

<style scoped>
.widget-panel {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh; /* Set full viewport height */
}

.widget-row {
  display: flex;
  justify-content: space-around;
  width: 80%;
  max-width: 1200px;
}

.widget {
  flex: 1; /* Distribute widgets evenly */
  padding: 20px;
  box-sizing: border-box;
}
</style>