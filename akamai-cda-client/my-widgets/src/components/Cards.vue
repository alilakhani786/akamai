<template>
    <CRow :md="{ cols: 3 }">
        <CCol>
            <CCard color="info">
                <CCardImage orientation="top" src="../src/assets/Akamai.png" />
                <CCardBody>
                    <CCardTitle>Card title</CCardTitle>
                    <CCardText>The company offers cloud security, mobile and web performance, carrier, and media delivery solutions. </CCardText>
                    <CCardText><small class="text-body-secondary">Last updated 3 mins ago</small></CCardText>
                </CCardBody>
            </CCard>
        </CCol>
        <CCol>
            <CCard color="warning">
                <CCardImage orientation="top" src="../src/assets/Akamai.png" />
                <CCardBody>
                    <CCardTitle>Card title</CCardTitle>
                    <CCardText>The company offers cloud security, mobile and web performance, carrier, and media delivery solutions.</CCardText>
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
</template>




<script>
import { CCard, CCardGroup, CCardText, CCardBody, CCardTitle, CRow, CCol, CCardImage } from '@coreui/vue';
import '@coreui/coreui/dist/css/coreui.min.css'

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
        CCardImage
    },
};
</script>
