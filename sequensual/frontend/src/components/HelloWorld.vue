<template>
  <div class="container">
    <h1>Sequensual</h1>
    <a @click="play">Play</a>
    <a @click="stop">Stop</a>
    <div class="steps">
      <button
        v-for="step in steps"
        :key="step.Number"
        v-html="`step: ${step.Number}`"
        :class="['steps__step', { 'steps__step--active-trig': step.Trig.Active }]"
        />
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      steps: this.getSteps()
    }
  },
  methods: {
    getSteps() {
      window.backend.Sequencer.GetSteps().then(result => {
        this.steps = result
      });
    },
    play() {
      window.backend.Sequencer.Start();
    },
    stop() {
      window.backend.Sequencer.Stop();
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

.steps__step--active-trig {
  background: red;
  color: white;
}
</style>
