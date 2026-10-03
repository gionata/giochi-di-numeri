<script setup lang="ts">
import { computed } from 'vue'
import { renderSVG } from 'uqr'

export interface QRProps {
  url: string
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
  blackColor: 'currentColor',
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
    <a
      class="qr-link"
      :href="props.url"
      :aria-label="`Apri il sito del progetto: ${props.url}`"
      target="_blank"
      rel="noopener noreferrer"
    >
      <div
        class="qr"
        :aria-label="props.alt"
        role="img"
        v-html="svgContent"
      />
    </a>
  </div>
</template>

<style lang="css" scoped>
.qr-link {
  display: inline-block;
  color: inherit;
  cursor: default;
  text-decoration: none;
  outline: none;
  border: 0;
  box-shadow: none;
}

.qr-link:hover,
.qr-link:visited,
.qr-link:active,
.qr-link:focus,
.qr-link:focus-visible {
  color: inherit;
  text-decoration: none;
  outline: none;
  border: 0;
  box-shadow: none;
}

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
