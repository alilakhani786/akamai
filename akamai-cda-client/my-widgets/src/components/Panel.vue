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
    /* padding: 20px; */
    flex-direction: row;
    margin-top: 20px;
    display: flex;
    /* margin: 10px */
    /* background-color: rgb(66, 51, 51); */
}
.title {
    margin: 0 0 10px 0;
    font-size: 1.5em;
    font-family: 'Lucida Console'
}
.content {
    margin-top: 10px
}
</style>