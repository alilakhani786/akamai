<template>
  <div id="app">
    <div>
      <Panel title="Title 1">
        <CRow :md="{ cols: 3 }">
        <CCol>
            <CCard text-color="info" class="mb-3 border-top-3"  :class="'border-' + 'info'">
                <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
                <CCardHeader>{{ id }}</CCardHeader>
                <img src='@/assets/Akamai.png'/>
                <CCardBody>
                    <CCardTitle class="mb-2 text-body-secondary">CP Code Reporting Group</CCardTitle>
                    <CCardText v-for="item in info" :key="item.id">{{ item.id }} - {{ item.name }}</CCardText>
                    <div class="link">
                      <CCardLink href="#">LEARN MORE ></CCardLink>
                    </div>
                </CCardBody>
            </CCard>
        </CCol>
        <CCol>
            <CCard text-color="warning" class="mb-3 border-top-3" :class="'border-' + 'warning'" >
                <!-- <CCardImage orientation="top" src="@/assets/Akamai.png" /> -->
                <img src='@/assets/Akamai.png'/>
                <CCardBody>
                    <CCardTitle>Card title</CCardTitle>
                    <CCardText>The company of cloud security, mobile and web performance, carrier, and media delivery solutions.</CCardText>
                    <CCardText><small class="text-body-secondary">Last updated 3 mins ago</small></CCardText>
                </CCardBody>
            </CCard>
        </CCol>
        <CCol>
            <CCard color="info">
                <CCardImage orientation="top" src="../src/assets/Akamai.png" /> 
                <CCardBody>
                    <CCardTitle>Card title</CCardTitle>
                    <CCardText>The company offers cloud security, mobile and web performance, carrier, and media delivery solutions.</CCardText>
                    <CCardText><small class="text-body-secondary">Last updated 3 mins ago</small></CCardText>
                </CCardBody>
            </CCard>
        </CCol>
    </CRow>
      </Panel>
    </div>
    <div>
      <Panel title="Title 2">
        <CRow :md="{ cols: 3 }">
        <CCol>
            <CCard text-color="info" class="mb-3 border-top-3"  :class="'border-' + 'info'">
                <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
                <CCardHeader>Header</CCardHeader>
                <img src='@/assets/Akamai.png'/>
                <CCardBody align-items="center" >
                    <CCardTitle class="title">CP Code Reporting Group</CCardTitle>
                    <CCardText v-for="item in info" :key="item.id">{{ item.id }} - {{ item.name }}</CCardText>
                    <CButton color="info" variant="outline" href="#">Go somewhere</CButton>
                </CCardBody>
            </CCard>
        </CCol>
        <CCol>
            <CCard text-color="warning" class="mb-3 border-top-3" :class="'border-' + 'warning'" >
                <!-- <CCardImage orientation="top" src="@/assets/Akamai.png" /> -->
                <img src='@/assets/Akamai.png'/>
                <CCardBody>
                    <CCardTitle>Card title</CCardTitle>
                    <CCardText>The company of cloud security, mobile and web performance, carrier, and media delivery solutions.</CCardText>
                    <CCardText><small class="text-body-secondary">Last updated 3 mins ago</small></CCardText>
                </CCardBody>
            </CCard>
        </CCol>
        <CCol>
            <CCard color="info">
                <CCardImage orientation="top" src="../src/assets/Akamai.png" /> 
                <CCardBody>
                    <CCardTitle>Card title</CCardTitle>
                    <CCardText>The company offers cloud security, mobile and web performance, carrier, and media delivery solutions.</CCardText>
                    <CCardText><small class="text-body-secondary">Last updated 3 mins ago</small></CCardText>
                </CCardBody>
            </CCard>
        </CCol>
    </CRow>
      </Panel>
    </div>
  </div>
</template>

<script>
// import Cards from '../Cards.vue';
import { CCard, CCardGroup, CCardText, CCardBody, CCardTitle, CRow, CCol, CCardImage, CCardLink, CCardHeader } from '@coreui/vue';
import '@coreui/coreui/dist/css/coreui.min.css';
import axios from 'axios';
import Panel from '../Panel.vue';
import akamaiImage from '@/assets/Akamai.png';

export default {
  name: 'App',
  components: {
    Panel,
    akamaiImage,
    CCard,
    CCardGroup,
    CCardText,
    CCardBody,
    CCardTitle,
    CCol,
    CRow,
    CCardImage,
    CCardLink,
    CCardHeader
  },
  // defineProps({
  //   id: String
  // }),
  data() {
      return {
          info: []
      }
  },
  mounted () {
    console.log('Fetching ID: ', this.id)
      axios
      .get(`http://localhost:3000/akamai?id=${this.id}`)
      .then(response => (this.info = response.data))
      .catch(error => {
          console.error('Error fetching data:', error);
      });
  }
};
</script>
<script setup>
defineProps({
  id: String
})
</script>


<style scoped>
 .title {
    font-family:Tahoma, Verdana, sans-serif;
    font-size: 25px;
    color: #000;
    text-align: center;
}
 .button {
    background-color:"info"; /* Green */
    align-items: center;
 }
  .link {
    justify-content: center;
    /* border-style: solid; */
    display: flex;
    margin-top: 50px
}
</style>