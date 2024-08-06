<template>
  <div id="app">
    <div>
      <Tabs></Tabs>
      <br>
      <p class="switchkey_text">Switchkey: <b>{{ id }}</b></p>
      <Modal :visibleScrollableDemo="visible" @close="closeModal">
        <CModalBody>
          <CTable hover>
            <CTableHead>
              <CTableRow>
                <CTableHeaderCell scope="col">#</CTableHeaderCell>
                <CTableHeaderCell scope="col">Property Name</CTableHeaderCell>
                <CTableHeaderCell scope="col">Contract ID</CTableHeaderCell>
                <CTableHeaderCell scope="col">Group ID</CTableHeaderCell>
                <CTableHeaderCell scope="col">Hostname</CTableHeaderCell>
              </CTableRow>
            </CTableHead>
            <CTableBody>
              <CTableRow v-for="(item, index) in propertyList" :key="index">
                <CTableHeaderCell scope="row">{{ index + 1 }}</CTableHeaderCell>
                <CTableDataCell>{{ item["Property Name"] }}</CTableDataCell>
                <CTableDataCell>{{ item["Contract ID"] }}</CTableDataCell>
                <CTableDataCell>{{ item["Group ID"] }}</CTableDataCell>
                <CTableDataCell>{{ item["Property Hostname"] }}</CTableDataCell>
              </CTableRow>
            </CTableBody>
          </CTable>
        </CModalBody>
      </Modal>
      <Panel title="Administration">
        <CRow :md="{ cols: 3 }">
          <CCol>
            <Card></Card>
          </CCol>
          <CCol>
            <Card></Card>
          </CCol>
          <CCol>
            <Card></Card>
          </CCol>
        </CRow>
      </Panel>
    </div>
    <div>
      <Panel title="Property Statistics">
        <CRow :md="{ cols: 3 }">
          <CCol>
            <CCard text-color="info" class="mb-3 border-top-3 card" :class="'border-' + 'info'">
              <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
              <CCardHeader style="text-align: center;"><b>Property Statistics</b></CCardHeader>
              <!-- <img src='@/assets/WAF.png' /> -->
              <CCardBody>
                <div class="row">
                  <div class="column">
                    <CSpinner v-if="loading" color="info"></CSpinner>
                    <p v-else style="font-size: 60px; color: black;">{{ propertyCount }}</p>
                    <p style="font-size: 18px;">Hostnames</p>
                  </div>
                  <div class="column">
                    <CSpinner v-if="loading" color="info"></CSpinner>
                    <p v-else style="font-size: 60px; color: black"> {{ WAFCount }}</p>
                    <p style="font-size: 18px;">WAF Protected Hostnames</p>
                  </div>
                </div>
                <!-- <div style="height: 10%;"><img src='@/assets/WAF.png' /></div> -->
                <CListGroup flush>
                  <CListGroupItem style="text-align: center; font-size: 14px;">
                    
                  </CListGroupItem>
                  <CListGroupItem style="text-align: center; font-size: 14px;  margin-top: 17px;">
                    This card displays the counts of total hostnames and hostnames that are with WAF protected under this account
                  </CListGroupItem>
                  <!-- <CCardTitle style="font-family: 'Lucida Console'"class="mb-2 text-body-secondary">CP Code Reporting Group</CCardTitle> -->
                </CListGroup>
                <div class="link_container">
                  <button class="link" @click="goDetail">Learn More ></button>
                </div>
              </CCardBody>
            </CCard>
          </CCol>
          <CCol>
            <Card>
              <div style="text-align: left; font-weight: 600;line-height: 2;">
              All Hostnames: 
              <span class="data">{{ propertyCount }}</span> <br>
              <!-- <CSpinner v-if="loading" color="info"></CSpinner>
              <p v-else style="color: black;">{{ propertyCount }}</p> <br> -->
              WAF Protected: 
              <span class="data">{{ WAFCount }}</span> <br>
              All Properties: 
              <span class="data">{{ propertyCount }}</span>
            </div>
            </Card>
          </CCol>
          <CCol>
            <Card></Card>
          </CCol>
        </CRow>
      </Panel>
    </div>
  </div>
</template>

<script>
// import Cards from '../Cards.vue';
import {
  CCard, CCardGroup, CCardText, CCardBody, CCardTitle, CRow, CCol,
  CCardImage, CCardLink, CCardHeader, CCardFooter, CModalBody,
  CTable, CTableHead, CTableBody, CTableHeaderCell, CTableRow, CTableDataCell,
  CListGroupItem, CNav, CNavItem,
  CListGroup, CSpinner
} from '@coreui/vue';
import '@coreui/coreui/dist/css/coreui.min.css';
import axios from 'axios';
import Panel from '../Panel.vue';
import Tabs from '../Tabs.vue';
import Modal from '../Modal.vue';
import akamaiImage from '@/assets/Akamai.png';
import Card from '../Card.vue';


export default {
  name: 'App',
  components: {
    CListGroupItem,
    CModalBody,
    Tabs,
    Modal,
    Panel,
    CNav,
    CNavItem,
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
    CCardFooter,
    CListGroup
  },
  // defineProps({
  //   id: String
  // }),
  data() {
    return {
      info: [],
      visible: false,
      loading: true
    }
  },
  mounted() {
    console.log('Fetching ID: ', this.id)
    axios
      .get(`http://localhost:3000/akamai?id=${this.id}`)
      .then(response => {
        this.info = response.data
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      })
      .finally(() => {
        this.loading = false
      });
  },

  methods: {
    goDetail() {
      console.log("clicked")
      this.visible = true
      console.log("visibleScrollableDemo:", this.visible);
    },
    closeModal() {
      this.visible = false
      console.log("visibleScrollableDemo:", this.visible);
    }
  },
  computed: {
    propertyList() {
      return this.info["Property List"]
    },
    propertyCount() {
      return this.info["Property Count"]
    },
    WAFCount() {
      return this.info["WAF Protected Hostnames Count"]
    }
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
  font-family: Tahoma, Verdana, sans-serif;
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
  width: 350px;
  /* Fixed width */
  height: 400px;
  /* Fixed height */
  margin: 5px
}

.content-text {
  color: black
}

.row {
  display: flex;
  height: 50%;
  /* align-items: center; */
  color: black;
}

.column {
  flex:50%;
  text-align: center;
  align-items: center
}
.data {
  color: blue;
  font-weight: 600
}
</style>