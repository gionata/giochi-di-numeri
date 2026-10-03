<script setup lang="ts">
export interface SottotitoloProps {
  sottotitolo?: string
}

const props = withDefaults(defineProps<SottotitoloProps>(), {
  sottotitolo: "Dall'aritmetica al pensiero ricorsivo",
})
</script>

<template>
  <div h-full text-center flex select-none all:transition-400>
    <div ma class="complementare background-itadinfo">
      <div text-3xl fw500 class="complementare line1">
        {{ props.sottotitolo }}
      </div>
    </div>
  </div>
</template>

<style lang="css" scoped>
.complementare {
  color: rgb(17, 237, 242);
}

.background-itadinfo {
  background-color: rgb(242, 102, 17);
  border-radius: 5rem;
  padding: 1rem;
}


.line1 {
  padding: 0.5rem 0;
}
</style>

