<template>
    <CRow :md="{ cols: 3 }">
        <CCol>
            <CCard>
                <CCardImage orientation="top" src="https://images.app.goo.gl/XUFLpHG8fHQP7Bow5" />
                <CCardBody>
                    <CCardTitle>Card title</CCardTitle>
                    <CCardText>This is a wider card with supporting text below as a natural lead-in to additional
                        content.
                        This content is a little bit longer.</CCardText>
                    <CCardText><small class="text-body-secondary">Last updated 3 mins ago</small></CCardText>
                </CCardBody>
            </CCard>
        </CCol>
        <CCol>
            <CCard>
                <CCardImage orientation="top" src="https://images.app.goo.gl/XUFLpHG8fHQP7Bow5" />
                <CCardBody>
                    <CCardTitle>Card title</CCardTitle>
                    <CCardText>This is a wider card with supporting text below as a natural lead-in to additional
                        content.
                        This content is a little bit longer.</CCardText>
                    <CCardText><small class="text-body-secondary">Last updated 3 mins ago</small></CCardText>
                </CCardBody>
            </CCard>
        </CCol>
        <CCol>
            <CCard>
                <CCardImage orientation="top" src="https://images.app.goo.gl/XUFLpHG8fHQP7Bow5" />
                <CCardBody>
                    <CCardTitle>Card title</CCardTitle>
                    <CCardText>This is a wider card with supporting text below as a natural lead-in to additional
                        content.
                        This content is a little bit longer.</CCardText>
                    <CCardText><small class="text-body-secondary">Last updated 3 mins ago</small></CCardText>
                </CCardBody>
            </CCard>
        </CCol>
        <CCol>
            <CCard>
            <CCardImage orientation="top" src="https://images.app.goo.gl/XUFLpHG8fHQP7Bow5" />
            <CCardBody>
                <CCardTitle>Card title</CCardTitle>
                <CCardText>This is a wider card with supporting text below as a natural lead-in to additional content.
                    This content is a little bit longer.</CCardText>
                <CCardText><small class="text-body-secondary">Last updated 3 mins ago</small></CCardText>
            </CCardBody>
        </CCard>
        </CCol>
        <CCol>
            <CCard>
            <CCardImage orientation="top" src="https://images.app.goo.gl/XUFLpHG8fHQP7Bow5" />
            <CCardBody>
                <CCardTitle>Card title</CCardTitle>
                <CCardText>This is a wider card with supporting text below as a natural lead-in to additional content.
                    This content is a little bit longer.</CCardText>
                <CCardText><small class="text-body-secondary">Last updated 3 mins ago</small></CCardText>
            </CCardBody>
        </CCard>
        </CCol>
        <CCol>
            <CCard>
            <CCardImage orientation="top" src="https://images.app.goo.gl/XUFLpHG8fHQP7Bow5" />
            <CCardBody>
                <CCardTitle>Card title</CCardTitle>
                <CCardText>This is a wider card with supporting text below as a natural lead-in to additional content.
                    This content is a little bit longer.</CCardText>
                <CCardText><small class="text-body-secondary">Last updated 3 mins ago</small></CCardText>
            </CCardBody>
        </CCard>
        </CCol>
    </CRow>
</template>




<script>
import { CCard, CCardGroup, CCardText, CCardBody, CCardTitle, CRow, CCol } from '@coreui/vue';
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
        CRow
    },
};
</script>
