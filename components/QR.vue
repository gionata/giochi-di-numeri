<script setup lang="ts">
import { computed } from 'vue'
import { renderSVG } from 'uqr'

export interface QRProps {
  url?: string
  alt?: string
  ecc?: 'L' | 'M' | 'Q' | 'H'
  border?: number
  whiteColor?: string
  blackColor?: string
}

const props = withDefaults(defineProps<QRProps>(), {
  url: 'https://gionata.github.io/giochi-di-numeri/',
  alt: 'QR Code',
  ecc: 'M',
  border: 1,
  whiteColor: 'transparent',
  blackColor: '#000000',
})

const svgContent = computed(() => {
  return renderSVG(props.url, {
    ecc: props.ecc,
    border: props.border,
    whiteColor: props.whiteColor,
    blackColor: props.blackColor,
  })
})
</script>

<template>
  <div class="text-center">
    <div
      class="qr"
      :aria-label="props.alt"
      role="img"
      v-html="svgContent"
    />
  </div>
</template>

<style lang="css" scoped>
.qr {
  display: inline-block;
  height: 7em;
  width: 7em;
  transform: translateY(-12mm) !important;
}

.qr :deep(svg) {
  width: 100%;
  height: 100%;
  display: block;
}

@media print {
  .qr {
    /* sposta il codice QR verso l'alto di 2 cm nella stampa */
    transform: translateY(-48mm) !important;
  }
}
</style>

