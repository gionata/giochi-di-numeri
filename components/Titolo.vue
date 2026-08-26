<script setup lang="ts">
export interface TitoloProps {
  titolo?: string
}

const props = withDefaults(defineProps<TitoloProps>(), {
  titolo: 'Giochi di Numeri',
})
</script>

<template>
  <div h-full text-center flex select-none all:transition-400>
    <div ma class="arancio-itadinfo">
      <!--div text-5xl fw500 animate-bounce-alt animate-count-3 animate-duration-1s class="arancio-itadinfo line1"-->
      <div text-5xl fw500 class="arancio-itadinfo line1">
        {{ props.titolo }}
      </div>
    </div>
  </div>
</template>

<style lang="css" scoped>
.arancio-itadinfo {
  color: rgb(242, 102, 17);
}

.line1 {
  padding: 0.5rem 0;
}
</style>

