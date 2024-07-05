<template>
  <div id="app">
    <div>
      <Panel title="Title 1">
        <Cards />
      </Panel>
    </div>
    <div>
      <Panel title="Title 2">
        <Cards />
      </Panel>
    </div>
  </div>
</template>

<script>
import Cards from '../Cards.vue';
import Panel from '../Panel.vue';
import akamaiImage from '@/assets/Akamai.png';

export default {
  name: 'App',
  components: {
    Cards,
    Panel,
    akamaiImage
  },
};
</script>