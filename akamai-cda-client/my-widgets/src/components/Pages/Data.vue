<template>
  <div id="app">
    <div>
      <p class="switchkey_text">Switchkey: <b>{{ id }}</b></p>
      <Panel title="Title 1">
        <CRow :md="{ cols: 3 }">
        <CCol>
            <CCard text-color="info" class="mb-3 border-top-3 card"  :class="'border-' + 'info'">
                <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
                <CCardHeader><b>CP Code Reporting Group</b></CCardHeader>
                <img src='@/assets/Akamai.png'/>
                <CCardBody>
                    <!-- <CCardTitle style="font-family: 'Lucida Console'"class="mb-2 text-body-secondary">CP Code Reporting Group</CCardTitle> -->
                    <CCardText class='content-text' v-for="item in info" :key="item.id">{{ item.id }} - {{ item.name }}</CCardText>
                    <div class="link_container">
                      <button class="link" @click="goDetail">Learn More ></button>
                    </div>
                </CCardBody>
            </CCard>
        </CCol>
        <CCol>
          <CCard text-color="warning" class="mb-3 border-top-3 card"  :class="'border-' + 'warning'">
                <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
                <CCardHeader>CP Code Reporting Group</CCardHeader>
                <img src='@/assets/Akamai.png'/>
                <CCardBody>
                    <CCardText class='content-text' v-for="item in info" :key="item.id">{{ item.id }} - {{ item.name }}</CCardText>
                    <div class="link_container">
                      <button class="link" @click="goDetail">Learn More ></button>
                    </div>
                </CCardBody>
            </CCard>
        </CCol>
        <CCol>
          <CCard text-color="info" class="mb-3 border-top-3 card"  :class="'border-' + 'info'">
                <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
                <CCardHeader>CP Code Reporting Group</CCardHeader>
                <img src='@/assets/Akamai.png'/>
                <CCardBody>
                    <CCardTitle class="mb-2 text-body-secondary">CP Code Reporting Group</CCardTitle>
                    <CCardText v-for="item in info" :key="item.id">{{ item.id }} - {{ item.name }}</CCardText>
                    <div class="link_container">
                      <button class="link" @click="goDetail">Learn More ></button>
                    </div>
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
          <CCard text-color="info" class="mb-3 border-top-3 card"  :class="'border-' + 'info'">
                <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
                <CCardHeader>CP Code Reporting Group</CCardHeader>
                <img src='@/assets/Akamai.png'/>
                <CCardBody>
                    <CCardTitle class="mb-2 text-body-secondary">CP Code Reporting Group</CCardTitle>
                    <CCardText v-for="item in info" :key="item.id">{{ item.id }} - {{ item.name }}</CCardText>
                    <div class="link_container">
                      <button class="link" @click="goDetail">LEARN MORE ></button>
                    </div>
                </CCardBody>
            </CCard>
        </CCol>
        <CCol>
          <CCard text-color="info" class="mb-3 border-top-3 card"  :class="'border-' + 'info'">
                <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
                <CCardHeader>CP Code Reporting Group</CCardHeader>
                <img src='@/assets/Akamai.png'/>
                <CCardBody>
                    <CCardTitle class="mb-2 text-body-secondary">CP Code Reporting Group</CCardTitle>
                    <CCardText v-for="item in info" :key="item.id">{{ item.id }} - {{ item.name }}</CCardText>
                    <div class="link_container">
                      <button class="link" @click="goDetail">LEARN MORE ></button>
                    </div>
                </CCardBody>
            </CCard>
        </CCol>
        <CCol>
          <CCard text-color="info" class="mb-3 border-top-3 card"  :class="'border-' + 'info'">
                <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
                <CCardHeader>CP Code Reporting Group</CCardHeader>
                <img src='@/assets/Akamai.png'/>
                <CCardBody>
                    <CCardTitle class="mb-2 text-body-secondary">CP Code Reporting Group</CCardTitle>
                    <CCardText v-for="item in info" :key="item.id">{{ item.id }} - {{ item.name }}</CCardText>
                    <div class="link_container">
                      <button class="link" @click="goDetail">LEARN MORE ></button>
                    </div>
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
import { CCard, CCardGroup, CCardText, CCardBody, CCardTitle, CRow, CCol, CCardImage, CCardLink, CCardHeader, CCardFooter } from '@coreui/vue';
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
    CCardHeader,
    CCardFooter
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
      .then(response => {
        this.info = response.data 
      })
      .catch(error => {
          console.error('Error fetching data:', error);
      });
    },
  
  methods: {
    goDetail() {
      console.log("clicked")
      this.$router.push(`/data/${this.id}/detail`)
    },
  }
};

</script>
<script setup>
defineProps({
  id: String
})
</script>


<style scoped>
  .switchkey_text {
    text-align: right;
  }
 .title {
    font-family:Tahoma, Verdana, sans-serif;
    font-size: 25px;
    color: #000;
    text-align: center;
}
 .link_container {
    display: flex;
    justify-content: center;
 }
  .link {
    align-items: center;
    display: flex;
    /* margin-bottom: 5px; */
    text-decoration: underline;
    background: none;
    color: blue;
    position: absolute;
    justify-content: center;
    bottom: 15px;
    border: none;
    font-size: 15px
}
  .link:hover {
    color: blueviolet
  }
  .card {
    width: 350px;   /* Fixed width */
    height: 400px;  /* Fixed height */
    margin: 5px
  }
  .content-text {
    color: black
  }
</style>