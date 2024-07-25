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
            <CCard text-color="info" class="mb-3 border-top-3 card" :class="'border-' + 'info'">
              <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
              <CCardHeader><b>Property Statistics</b></CCardHeader>
              <img src='@/assets/Akamai.png' />
              <CCardBody>
                <!-- <CCardText class='content-text'>hi</CCardText> -->
                <div class="link_container">
                  <button class="link" @click="goDetail">Learn More ></button>
                </div>
              </CCardBody>
            </CCard>
          </CCol>
          <CCol>
            <CCard text-color="warning" class="mb-3 border-top-3 card" :class="'border-' + 'warning'">
              <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
              <CCardHeader><b>CP Code Reporting Group</b></CCardHeader>
              <img src='@/assets/Akamai.png' />
              <CCardBody>
                <!-- <CCardText class='content-text' v-for="item in info" :key="item.id">{{ item.id }} - {{ item.name }}</CCardText> -->
                <div class="link_container">
                  <button class="link" @click="goDetail">Learn More ></button>
                </div>
              </CCardBody>
            </CCard>
          </CCol>
          <CCol>
            <CCard text-color="info" class="mb-3 border-top-3 card" :class="'border-' + 'info'">
              <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
              <CCardHeader><b>CP Code Reporting Group</b></CCardHeader>
              <img src='@/assets/Akamai.png' />
              <CCardBody>
                <CCardTitle class="mb-2 text-body-secondary">CP Code Reporting Group</CCardTitle>
                <!-- <CCardText v-for="item in info" :key="item.id">{{ item.id }} - {{ item.name }}</CCardText> -->
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
      <Panel title="Property Statistics">
        <CRow :md="{ cols: 3 }">
          <CCol>
            <CCard text-color="info" class="mb-3 border-top-3 card" :class="'border-' + 'info'">
              <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
              <CCardHeader><b>Property Statistics</b></CCardHeader>
              <img src='@/assets/Akamai.png' />
              <CCardBody>
                <CListGroup flush>
                  <CListGroupItem>
                    Description
                  </CListGroupItem>
                  <!-- <CCardTitle style="font-family: 'Lucida Console'"class="mb-2 text-body-secondary">CP Code Reporting Group</CCardTitle> -->
                  <CListGroupItem v-if="info">
                    Property Count: {{ propertyCount }}<br>
                    WAF Protected Hostnames Count: {{ WAFCount }}
                  </CListGroupItem>
                  <CListGroupItem class='content-text' v-else>Loading...</CListGroupItem>
                </CListGroup>
                <div class="link_container">
                  <button class="link" @click="goDetail">Learn More ></button>
                </div>
              </CCardBody>
            </CCard>
          </CCol>
          <CCol>
            <CCard text-color="warning" class="mb-3 border-top-3 card" :class="'border-' + 'warning'">
              <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
              <CCardHeader><b>CP Code Reporting Group</b></CCardHeader>
              <img src='@/assets/Akamai.png' />
              <CCardBody>
                <!-- <CCardText class='content-text' v-for="item in info" :key="item.id">{{ item.id }} - {{ item.name }}</CCardText> -->
                <div class="link_container">
                  <button class="link" @click="goDetail">Learn More ></button>
                </div>
              </CCardBody>
            </CCard>
          </CCol>
          <CCol>
            <CCard text-color="info" class="mb-3 border-top-3 card" :class="'border-' + 'info'">
              <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
              <CCardHeader><b>CP Code Reporting Group</b></CCardHeader>
              <img src='@/assets/Akamai.png' />
              <CCardBody>
                <CCardTitle class="mb-2 text-body-secondary">CP Code Reporting Group</CCardTitle>
                <!-- <CCardText v-for="item in info" :key="item.id">{{ item.id }} - {{ item.name }}</CCardText> -->
                <div class="link_container">
                  <button class="link" @click="goDetail">Learn More ></button>
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
import {
  CCard, CCardGroup, CCardText, CCardBody, CCardTitle, CRow, CCol,
  CCardImage, CCardLink, CCardHeader, CCardFooter, CModalBody,
  CTable, CTableHead, CTableBody, CTableHeaderCell, CTableRow, CTableDataCell,
  CListGroupItem, CNav, CNavItem,
  CListGroup
} from '@coreui/vue';
import '@coreui/coreui/dist/css/coreui.min.css';
import axios from 'axios';
import Panel from '../Panel.vue';
import Tabs from '../Tabs.vue';
import Modal from '../Modal.vue';
import akamaiImage from '@/assets/Akamai.png';

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
</style>