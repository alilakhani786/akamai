<!-- Row.vue -->
<template>
    <div class="row">
        <h2 class="title">{{title}}</h2>
        <div class="content">
            <slot></slot>
        </div>
    </div>
</template>

<script setup>
defineProps(['title'])
</script>

<style scoped>
.row {
    border: 1px solid #000;
    padding: 20px;
    flex-direction: row;
}
.title {
    margin: 0 0 10px 0;
    font-size: 1.5em;
}
.content {
    margin-top: 10px
}
</style>