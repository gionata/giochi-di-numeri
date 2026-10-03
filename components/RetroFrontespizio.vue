<script setup lang="ts">
import { ref, onMounted } from 'vue';
import Autori, { type AutoreItem } from './Autori.vue';
import Piede from './Piede.vue';
import Titolo from './Titolo.vue';
import Sottotitolo from './Sottotitolo.vue';

export interface FrontespizioProps {
  titolo?: string
  sottotitolo?: string
  autori?: AutoreItem[]
}

const props = withDefaults(defineProps<FrontespizioProps>(), {
  titolo: '',
  sottotitolo: '',
  autori: () => [],
});

const showTitle = ref(true);

onMounted(() => {
  // Aspetta qualche secondo, poi scambia titolo e sottotitolo
  setInterval(() => {
    showTitle.value = !showTitle.value;
  }, 3500);
});
</script>

<template>
  <div class="slidev-layout cover print-upper">
    <div class="my-auto w-full">
      <div class="title-container">
        <Transition name="rotate" mode="out-in">
          <div v-if="showTitle" key="title" class="rotate-panel">
            <Titolo :titolo="props.titolo" />
          </div>
          <div v-else key="subtitle" class="subtitle-text rotate-panel">
            <Sottotitolo :sottotitolo="props.sottotitolo" />
          </div>
        </Transition>
      </div>
      <Autori :autori="props.autori" />
    </div>
    <div text-center text-5xl>Grazie per l'attenzione!</div>
    <!-- Aggiungere automazione zoom out e poi in -->
    <div text-center text-4xl>Domande?</div>
  </div>
  <div class="print-restore-margin">
    <Piede />
  </div>
</template>

<style lang="css" scoped>
.print-upper {
  @media print {
    margin-top: -2.5cm;
  }
}

.title-container {
  height: 110px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0;
  padding: 0;
  isolation: isolate;
  /* Crea un nuovo stacking context per evitare effetti su altri elementi */
}

.arancio-itadinfo {
  color: rgb(242, 102, 17);
}

.rotate-panel {
  backface-visibility: hidden;
  transform-style: preserve-3d;
}

.rotate-enter-active,
.rotate-leave-active {
  transition: transform 0.8s cubic-bezier(.2, .8, .2, 1), opacity 0.6s ease;
  transform-style: preserve-3d;
}

.rotate-enter-from {
  transform: rotateY(90deg) translateZ(0);
  opacity: 0;
}

.rotate-enter-to {
  transform: rotateY(0deg) translateZ(0);
  opacity: 1;
}

.rotate-leave-from {
  transform: rotateY(0deg) translateZ(0);
  opacity: 1;
}

.rotate-leave-to {
  transform: rotateY(-90deg) translateZ(0);
  opacity: 0;
}

.no-print {
  @media print {
    display: none;
  }
}

.print-restore-margin {
  @media print {
    margin-top: 1.5cm;
  }
}
</style>
