<template>
  <div class="cards">
    <div class="left-column">
      <slot></slot>
      <div style="text-align: left; font-weight: 600;line-height: 2;font-size:12px;" v-for="(item, index) in keys">
        {{ item }}:
        <span v-if="values[index]" class="data">{{ values[index] }}</span>
        <span v-else>Loading...</span>
      </div>

    </div>
    <div class="right-column">
      <img class="logo-image" :src="`/src/assets/${logo}`"/>
    </div>
  </div>
</template>

<script setup>
defineProps({
  keys: Array,
  values: Array,
  logo: String
})

</script>


<style scoped>
.cards {
  height: 140px;
  /* width: 260px; */
  border: 1px solid black;
  border-radius: 20px;
  /* background-color: rgb(248, 248, 239); */
  display: flex;
  flex: 1;
  /* justify-content: center; */
  align-items: center;
  flex-direction: row;
  padding: 20px;
}

.left-column {
  flex: 4;
  text-align: left;
  align-items: center;
  font-size: small;
}

.right-column {
  flex: 1;
  text-align: center;
  font-size: 10px;
  /* align-items:flex-start */
}

.data {
  color: blue;
  font-weight: 600
}

.logo-image {
  width: 50px;
  height: 50px;
}
</style>