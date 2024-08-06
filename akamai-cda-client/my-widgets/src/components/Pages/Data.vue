<template>
  <div style="flex-direction: column; width: 100%; display: flex;">
    <div class="top-panel">
      <div style="text-align: left;flex: 1;">
        Switchkey: <b>{{ id }}</b>
      </div>
      <div style="text-align: right;flex: 1;">
        Name 
      </div>
    </div>
    <Panel>
      <Card :keys="card1key" :values="card1value"/>
      <Card :keys="card1key" :values="card1value"/>
      <Card :keys="card3key" :values="card3value"/>
      <Card :keys="card1key" :values="card1value"/>
    </Panel>
    <Panel>
      <div class="chart" style="height:350px; flex: 3; border: 1px solid black; border-radius: 20px; padding: 10px;">
        <p>Sales Performance</p>
        <img src="@/assets/sales.png">
      </div>
      <div class="chart"
        style="height:350px; flex: 2; border: 1px solid black; border-radius: 20px; padding: 10px; align-items: center; display: flex">
        <!-- <p>Popular Categories</p> -->
        <img src="@/assets/piechart.png">
      </div>
    </Panel>
  </div>
</template>

<script>
// import Cards from '../Cards.vue';
import { CNav, CNavItem, CSpinner } from '@coreui/vue';
import '@coreui/coreui/dist/css/coreui.min.css';
import axios from 'axios';
import Panel from '../Panel.vue';
import Tabs from '../Tabs.vue';
import akamaiImage from '@/assets/Akamai.png';
import Card from '../Card.vue';


export default {
  name: 'App',
  components: {
    Tabs, Panel, CNav, CNavItem,
    akamaiImage,
  },
  // defineProps({
  //   id: String
  // }),
  data() {
    return {
      info: [],
      visible: false,
      loading: true,
      card1key:['All Hostnames', 'WAF Protected', 'No. of Properties', 'No. of Custom Rules'],
      card3key:['Configs', 'Policies', 'Custom Rules']
    }
  },
  mounted() {
    console.log('Fetching ID: ', this.id)
    axios
      .get(`http://localhost:3000/akamai?id=${this.id}`)
      .then(response => {
        this.info = response.data
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      })
      .finally(() => {
        this.loading = false
      });
  },

  computed: {
    propertyList() {
      return this.info["Property List"]
    },
    propertyCount() {
      return this.info["Property Count"]
    },
    WAFCount() {
      return this.info["WAF Protected Hostnames Count"]
    },
    card1value() {
      return [this.propertyCount, this.WAFCount, '?', "?"]
    },
    card2value() {
      return ['?', '?', '?', "?"]
    },
    card3value() {
      return ['?', '?', '?']
    },
    card4value() {
      return ['?', '?', '?', "?"]
    }
  }
};

</script>
<script setup>
defineProps({
  id: String
})
</script>


<style scoped>
.title {
  font-family: Tahoma, Verdana, sans-serif;
  font-size: 25px;
  color: #000;
  text-align: center;
}

.chart img {
  width: 98%;
  height: 80%;
}

.top-panel {
  margin: 10px;
  font-size: 13px;
  display: flex;
}
</style>