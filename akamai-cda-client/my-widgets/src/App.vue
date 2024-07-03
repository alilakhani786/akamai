<template>
  <div id="app">
    <Cards />
  </div>
</template>

<script>
import Cards from './components/Cards.vue';

export default {
  name: 'App',
  components: {
    Cards,
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  text-align: center;
  justify-content: center;
  display: flex;
  color: #2c3e50;
  margin-top: 60px;
  height: 100vh
}
</style>
