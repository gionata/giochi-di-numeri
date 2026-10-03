<script setup lang="ts">
const props = defineProps<{
  class?: string
  layoutClass?: string
}>()
</script>

<template>
  <div class="itadinfo-wrapper relative h-full">
    <div
      class="slidev-layout two-columns w-full h-full grid grid-cols-2"
      :class="props.layoutClass"
    >
      <div class="col-left" :class="props.class">
        <slot />
        <slot name="left" />
      </div>
      <div class="col-right" :class="props.class">
        <slot name="right" />
      </div>
    </div>
    <Piede position="center" />
  </div>
</template>
