<template>
    <CModal size="lg" scrollable :visible="visibleScrollableDemo" @close="closeModal"
        aria-labelledby="ScrollingLongContentExampleLabel2">
        <CModalHeader>
            <!-- <CModalTitle id="ScrollingLongContentExampleLabel2">Modal title</CModalTitle> -->
        </CModalHeader>
        <slot></slot>
    </CModal>
</template>

<script>
import { CModal, CModalBody, CModalHeader, CModalTitle } from '@coreui/vue'

export default {
    props: {
        visibleScrollableDemo: {
            type: Boolean,
            default: false
        },
        text: {
            type: String,
            default: "No Data"
        }
    },
    components: {
        CModal,
        CModalBody,
        CModalHeader,
        CModalTitle
    },
    methods: {
        closeModal() {
            this.$emit('close');
        }
    },
}
</script>