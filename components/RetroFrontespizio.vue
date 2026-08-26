<script setup lang="ts">
import Autori, { type AutoreItem } from './Autori.vue';
import Piede from './Piede.vue';
import Titolo from './Titolo.vue';

export interface RetroFrontespizioProps {
  titolo?: string
  autori?: AutoreItem[]
}

const props = withDefaults(defineProps<RetroFrontespizioProps>(), {
  titolo: 'Giochi di Numeri',
})
</script>

<template>
  <div class="slidev-layout cover">
    <div class="my-auto w-full">
      <Titolo :titolo="props.titolo" />
      <Autori :autori="props.autori" />
      <!-- Aggiungere automazione zoom in e poi out -->
      <div text-center text-5xl>Grazie per l'attenzione!</div>
      <!-- Aggiungere automazione zoom out e poi in -->
      <div text-center text-4xl>Domande?</div>
    </div>
  </div>
  <Piede />
</template>

<style lang="css" scoped></style>

