<template>
  <div id="app">
    <h1>Sequensual</h1>
    <Control />
  </div>
</template>

<script>
import Control from "./components/Control.vue";
import "./assets/css/main.css";

export default {
  name: "app",
  components: {
    Control
  }
};
</script>
