<template>
    <div class="cards">
        <div class="left-column">
        <slot></slot>
        </div>
        <div class="right-column">
        Some logo here
        </div>
    </div>
</template>

<script setup>
defineProps({
  context: String
})
</script>
 
<style scoped>
.cards {
    height: 160px;
    width: 340px;
    border: 1px solid black;
    border-radius: 10px;
    /* background-color: rgb(248, 248, 239); */
    display: flex;
    /* justify-content: center; */
    align-items: center;
    flex-direction: row;
    padding: 20px;
}
.left-column {
  flex:2;
  text-align: center;
  align-items: center
}
.right-column {
  flex:1;
  text-align: center;
  /* align-items:flex-start */
}
</style>