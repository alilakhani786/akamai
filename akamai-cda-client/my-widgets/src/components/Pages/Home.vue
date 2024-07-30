<template>
    <div id="app" >
        <img src="@/assets/Akamai_white.png" width="40%" /><br><br>
        <input placeholder=" Enter Switchkey" v-model="inputId" @keyup.enter="sendSwitchkey" size="50">
    </div>
</template>

<script>

export default {
    data() {
        return {
            inputId: ''
        };
    },
    methods: {
        sendSwitchkey() {
          if(this.inputId) {
            this.$router.push(`/data/${this.inputId}`);
          } else {
            console.error('Switchkey cannot be empty')
          }
        }
    }
}
</script>