<script setup lang="ts">
import { computed } from 'vue'

export interface AutoreProps {
  nome?: string
  affiliazione?: string
  citta?: string
  presentatore?: boolean | string
}

const props = withDefaults(defineProps<AutoreProps>(), {
  nome: 'Gionata Massi',
  affiliazione: 'IIS "Savoia Benincasa"',
  citta: 'Ancona',
  presentatore: false,
})

const isPresenter = computed(() => {
  return props.presentatore === true || props.presentatore === 'yes' || props.presentatore === 'true'
})

const affiliationInfo = computed(() => {
  return [props.affiliazione, props.citta].filter(Boolean).join(', ')
})
</script>

<template>
  <div class="autore">
    <b class="autore-nome">{{ props.nome }}</b><span v-if="isPresenter" class="autore-presentatore"><sup>*</sup></span><br v-if="affiliationInfo">
    <i v-if="affiliationInfo" class="autore-affiliazione">{{ affiliationInfo }}</i>
  </div>
</template>

<style lang="css" scoped>
.autore {
  margin: 6px auto;
  text-align: center;
  color: rgb(101, 102, 92);
  font-size: 1.1rem;
  line-height: 1.3;
}

.autore-nome {
  font-weight: bold;
}
</style>
