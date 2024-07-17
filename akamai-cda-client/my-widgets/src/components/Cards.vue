<template>
    <CRow :md="{ cols: 2 }">
        <CCol>
            <CCard text-color="info" class="mb-3 border-top-3"  :class="'border-' + 'info'">
                <!-- <CCardImage orientation="top" src="akamaiImage" /> -->
                <img src='@/assets/Akamai.png'/>
                <CCardBody>
                    <CCardTitle>CP Code Reporting Group</CCardTitle>
                    <CCardText v-for="item in info" :key="item.id">{{ item.id }} - {{ item.name }}</CCardText>
                    <CCardText><small class="text-body-secondary">Last updated 3 mins ago</small></CCardText>
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
        <!-- <CCol>
            <CCard color="info">
                <CCardImage orientation="top" src="../src/assets/Akamai.png" /> -->
                <!-- <img src='@/assets/Akamai.png'/>
                <CCardBody>
                    <CCardTitle>Card title</CCardTitle>
                    <CCardText>The company offers cloud security, mobile and web performance, carrier, and media delivery solutions.</CCardText>
                    <CCardText><small class="text-body-secondary">Last updated 3 mins ago</small></CCardText>
                </CCardBody>
            </CCard>
        </CCol> -->
    </CRow>
</template>




<script>
import { CCard, CCardGroup, CCardText, CCardBody, CCardTitle, CRow, CCol, CCardImage } from '@coreui/vue';
import '@coreui/coreui/dist/css/coreui.min.css';
import axios from 'axios';

export default {
    name: 'cards',
    components: {
        CCard,
        CCardGroup,
        CCardText,
        CCardBody,
        CCardTitle,
        CCol,
        CRow,
        CCardImage,
    },
    data() {
        return {
            info: []
        }
    },
    mounted () {
        axios
        .get('http://localhost:3000/akamai')
        .then(response => (this.info = response.data))
        .catch(error => {
            console.error('Error fetching data:', error);
            });
  }
};
</script>
