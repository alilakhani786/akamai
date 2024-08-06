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
    margin: 10px;
    display: flex;
    /* border: 1px solid black; */
    width: 100%
}
.title {
    margin: 0 0 10px 0;
    font-size: 2em;
    font-family: 'Arial';
    font-weight: bold;
}
.content {
    flex-direction: row;
    display: flex;
    gap: 15px;

}
</style>