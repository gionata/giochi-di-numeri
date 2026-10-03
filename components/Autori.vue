<script setup lang="ts">
import Autore, { type AutoreProps } from './Autore.vue'

export type AutoreItem = AutoreProps

export interface AutoriProps {
  autori?: AutoreItem[]
}

const props = withDefaults(defineProps<AutoriProps>(), {
  autori: () => [],
})
</script>

<template>
  <div class="autori-container">
    <slot>
      <Autore
        v-for="(autore, index) in props.autori"
        :key="index"
        :nome="autore.nome"
        :affiliazione="autore.affiliazione"
        :citta="autore.citta"
        :presentatore="autore.presentatore"
      />
    </slot>
  </div>
</template>

<style lang="css" scoped>
.autori-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin: 10px auto;
}
</style>
