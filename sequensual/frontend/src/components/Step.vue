<template>
    <div :class="['step', { 'step--active-trig': step.Trig.Active }]">
        <div :class="[ 'step-indicator', { 'step-indicator--set': step.Trig.Active }]" @click="toggleStep()" />
        {{ step.Number + 1 }}
    </div>
</template>

<script>
export default {
    props: {
        step: {
            type: Object
        },
        callback: {
            type: Function
        }
    },
    methods: {
        toggleStep() {
            const stepNumber = this.step.Number;
            let trigStatus = this.step.Trig.Active;
            trigStatus ? trigStatus = false : trigStatus = true;
            window.backend.Sequencer.SetStep(stepNumber, trigStatus).then(this.callback());
        }
    }
}
</script>

<style scoped>
.step {
    display: flex;
    flex-direction: column;
    align-items: center;
}
.step-indicator {
    height: 20px;
    width: 20px;
    background: crimson;
    border-radius: 50%;
    margin-bottom: 10px;
    cursor: pointer;
}

.step-indicator--set {
    background: yellowgreen;
}
</style>