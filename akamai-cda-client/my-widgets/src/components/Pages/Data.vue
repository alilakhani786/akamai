<template>
    <div id="app">
      <div>
      <Panel title="Title 1">
        <Cards/>
      </Panel>
    </div>
  <div>
      <Panel title="Title 2">
        <Cards/>
      </Panel>
    </div>
  </div>
  </template>
  
  <script>
  import Cards from '../Cards.vue';
  import Panel from '../Panel.vue';
  
  export default {
    name: 'App',
    components: {
      Cards,
      Panel
    },
  };
  </script>
  
  <!-- <style>
  #app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    text-align: center;
    justify-content: center;
    display: flex;
    color: #2c3e50;
    margin: 30px;
    margin-top: 30px;
    height: 150vh;
    flex-direction: column;
  }
  </style> -->