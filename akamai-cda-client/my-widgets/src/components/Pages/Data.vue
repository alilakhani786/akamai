<template>
  <div style="flex-direction: row; display: flex;height: 100vh; width: 100vw;">
    <div style="margin-left: 5px; display: flex; flex: 1;">
      <Tabs></Tabs>
    </div>
    <div style="flex-direction: column; width: 90vw; display: flex;">
      <div class="top-panel">
        <div style="text-align: left;flex: 1;">
          Switchkey: <b>{{ id }}</b>
        </div>
        <div style="text-align: right;flex: 1;">
          Name
        </div>
      </div>
      <Panel>
        <Card :keys="card1key" :values="card1value" logo="WAF.png" />
        <Card logo="hits.png">
          <div>
            <b>Total Offload</b><br><br>
            <div style="flex-direction: row; display: flex; font-size: 12px; gap: 7px;">
              <div>
                <b>26.2B+</b><br>
                <b>Edge Hits</b>
              </div>
              <div>
                <b>449.5TB</b><br>
                <b>Bandwidth Offload</b>
              </div>
            </div>
          </div>
        </Card>
        <Card :keys="card3key" :values="card3value" logo="MSC.png">
          <div style="margin-bottom: 7px;">
            <b>MSCs</b><br>
          </div>
        </Card>
        <Card logo="billing.png">
          <div style="margin-bottom: 7px;">
            <b>Billing</b><br>
          </div>
          <div>
            <b>6,77604.000 GB</b><br>
            <span style="font-size: 10px;"><b>Monthly usage summary details for all CP Codes</b></span>
          </div>

        </Card>
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
// import Tabs from '../Tabs.vue'


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
      card1key: ['All Hostnames', 'WAF Protected', 'No. of Properties', 'No. of Custom Rules'],
      card3key: ['Configs', 'Policies', 'Custom Rules']
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
      return [this.propertyCount, this.WAFCount, 57, 15]
    },
    card2value() {
      return ['?', '?', '?', "?"]
    },
    card3value() {
      return [57, 48, 57]
    },
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