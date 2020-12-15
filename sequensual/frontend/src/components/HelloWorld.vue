<template>
  <div class="container">
    <h1>Sequensual</h1>
    <a @click="play">Play</a>
    <a @click="stop">Stop</a>
    {{ seqLength }}
  </div>
</template>

<script>
export default {
  data() {
    return {
      seqLength: null
    }
  },
  setup() {
    this.length()
  },
  methods: {
    length() {
      window.backend.s.GetLength().then(result => {
        this.seqLength = result
      });
    },
    play() {
      window.backend.s.Start();
    },
    stop() {
      window.backend.s.Stop();
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1 {
  margin-top: 2em;
  position: relative;
  min-height: 5rem;
  width: 100%;
}
a:hover {
  font-size: 1.7em;
  border-color: blue;
  background-color: blue;
  color: white;
  border: 3px solid white;
  border-radius: 10px;
  padding: 9px;
  cursor: pointer;
  transition: 500ms;
}
a {
  font-size: 1.7em;
  border-color: white;
  background-color: #121212;
  color: white;
  border: 3px solid white;
  border-radius: 10px;
  padding: 9px;
  cursor: pointer;
}
</style>
