<script setup lang="ts">
import { computed, ref, watch } from 'vue'

const props = withDefaults(
  defineProps<{
    click?: number
  }>(),
  {
    click: 0,
  },
)

const manualStep = ref<number | null>(null)

watch(
  () => props.click,
  () => {
    manualStep.value = null
  },
)

// Sequenza di valutazione dettagliata (0 -> 7)
const steps = [
  { title: 'Albero sintattico dell’espressione', code: '(+ 1 (· 2 3))', type: 'init' },
  { title: '1. Valutazione operatore principale', code: '+', type: 'atom' },
  { title: '2. Valutazione primo operando', code: '1', type: 'atom' },
  { title: '3. Valutazione operatore sotto-espressione', code: '·', type: 'sub-atom' },
  { title: '4. Valutazione primo operando sotto-espressione', code: '2', type: 'sub-atom' },
  { title: '5. Valutazione secondo operando sotto-espressione', code: '3', type: 'sub-atom' },
  { title: '6. Riduzione sotto-espressione: (· 2 3) → 6', code: '6', type: 'reduce' },
  { title: '7. Riduzione finale: (+ 1 6) → 7', code: '7', type: 'reduce-final' },
]

const currentStep = computed(() => {
  if (manualStep.value !== null)
    return manualStep.value
  return Math.min(Math.max(props.click ?? 0, 0), steps.length - 1)
})

function setStep(idx: number) {
  manualStep.value = idx
}
</script>

<template>
  <div class="flex flex-col items-center w-full select-none">
    <!-- Header dei controlli e dello step attuale -->
    <div class="w-full flex items-center justify-between mb-2 px-2">
      <div class="flex items-center gap-2 min-w-0">
        <span class="text-xs font-semibold text-slate-700 dark:text-slate-300">
          {{ steps[currentStep].title }}
        </span>
        <span class="text-xs px-2 py-0.5 rounded bg-slate-200/80 dark:bg-slate-800 text-slate-700 dark:text-slate-300 font-mono">
          {{ steps[currentStep].code }}
        </span>
      </div>

      <div class="flex items-center gap-1 bg-slate-200/60 dark:bg-slate-800/80 p-1 rounded-lg border border-slate-300/60 dark:border-slate-700">
        <button
          v-for="(step, idx) in steps"
          :key="idx"
          type="button"
          :aria-label="`Passo ${idx}: ${step.title}`"
          class="w-6 h-6 rounded flex items-center justify-center text-xs font-mono font-bold transition-all"
          :class="
            currentStep === idx
              ? 'bg-amber-500 text-white shadow-sm scale-105'
              : 'text-slate-600 dark:text-slate-400 hover:bg-slate-300/60 dark:hover:bg-slate-700'
          "
          @click="setStep(idx)"
        >
          {{ idx }}
        </button>
      </div>
    </div>

    <!-- Canvas SVG dell'Albero -->
    <div class="relative w-full h-[250px] rounded-xl bg-slate-100/70 dark:bg-slate-800/40 border border-slate-200 dark:border-slate-700/60 p-2 shadow-md overflow-hidden flex items-center justify-center">
      <svg
        viewBox="0 0 920 390"
        class="w-full h-full"
        preserveAspectRatio="xMidYMid meet"
        role="img"
        :aria-label="`Valutazione di (+ 1 (· 2 3)): ${steps[currentStep].title}`"
      >
        <defs>
          <filter id="glow" x="-20%" y="-20%" width="140%" height="140%">
            <feDropShadow dx="0" dy="2" stdDeviation="4" flood-color="#f59e0b" flood-opacity="0.4" />
          </filter>
        </defs>

        <!-- 1. CORNICE SOTTO-ESPRESSIONE -->
        <rect
          v-if="currentStep >= 3 && currentStep <= 5"
          x="420"
          y="260"
          width="320"
          height="110"
          rx="16"
          fill="rgba(245, 158, 11, 0.05)"
          stroke="#f59e0b"
          stroke-width="2"
          stroke-dasharray="6 4"
          class="transition-all duration-300"
        />

        <!-- 2. RAMI DELL'ALBERO -->
        <g
          :style="{ opacity: currentStep < 6 ? 1 : 0, transition: 'opacity 0.3s ease' }"
          stroke="#94a3b8"
          stroke-width="2.5"
          stroke-linecap="round"
        >
          <line x1="360" y1="85" x2="230" y2="195" />
          <line x1="360" y1="85" x2="360" y2="195" />
          <line x1="360" y1="85" x2="580" y2="195" />
          <line x1="580" y1="195" x2="470" y2="315" />
          <line x1="580" y1="195" x2="580" y2="315" />
          <line x1="580" y1="195" x2="690" y2="315" />
        </g>

        <g
          :style="{ opacity: currentStep === 6 ? 1 : 0, transition: 'opacity 0.3s ease' }"
          stroke="#94a3b8"
          stroke-width="2.5"
          stroke-linecap="round"
        >
          <line x1="360" y1="85" x2="230" y2="195" />
          <line x1="360" y1="85" x2="360" y2="195" />
          <line x1="360" y1="85" x2="580" y2="195" />
        </g>

        <!-- 3. NODI STRUTTURALI (PUNTINI RADICE) -->
        <circle v-if="currentStep < 7" cx="360" cy="85" r="7" fill="#64748b" />
        <circle v-if="currentStep < 6" cx="580" cy="195" r="7" fill="#64748b" />

        <!-- 4. EVIDENZIATORI DI VALUTAZIONE IN CORSO -->
        <!-- Passo 1: '+' -->
        <rect
          v-if="currentStep === 1"
          x="205"
          y="170"
          width="50"
          height="50"
          rx="12"
          fill="#f59e0b"
          filter="url(#glow)"
        />
        <!-- Passo 2: '1' -->
        <rect
          v-if="currentStep === 2"
          x="332"
          y="160"
          width="55"
          height="55"
          rx="12"
          fill="#f59e0b"
          filter="url(#glow)"
        />
        <!-- Passo 3: '·' -->
        <rect
          v-if="currentStep === 3"
          x="445"
          y="290"
          width="50"
          height="50"
          rx="12"
          fill="#f59e0b"
          filter="url(#glow)"
        />
        <!-- Passo 4: '2' -->
        <rect
          v-if="currentStep === 4"
          x="552"
          y="280"
          width="55"
          height="55"
          rx="12"
          fill="#f59e0b"
          filter="url(#glow)"
        />
        <!-- Passo 5: '3' -->
        <rect
          v-if="currentStep === 5"
          x="662"
          y="280"
          width="55"
          height="55"
          rx="12"
          fill="#f59e0b"
          filter="url(#glow)"
        />

        <!-- 5. TESTI DEGLI OPERATORI E DEI NUMERALI -->
        <g
          font-family="ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace"
          font-size="20"
          font-weight="bold"
          text-anchor="middle"
          dominant-baseline="central"
        >
          <!-- Passo 0 - 6: Operatore '+' -->
          <text
            v-if="currentStep <= 6"
            x="230"
            y="195"
            :fill="currentStep === 1 ? '#ffffff' : '#f59e0b'"
          >
            +
          </text>

          <!-- Passo 0 - 6: Numerale '1' -->
          <text
            v-if="currentStep <= 6"
            x="360"
            y="195"
            :fill="currentStep === 2 ? '#ffffff' : '#0284c7'"
          >
            1
          </text>

          <!-- Passo 0 - 5: Operatore '·' -->
          <text
            v-if="currentStep <= 5"
            x="470"
            y="315"
            :fill="currentStep === 3 ? '#ffffff' : '#f59e0b'"
          >
            ·
          </text>

          <!-- Passo 0 - 5: Numerale '2' -->
          <text
            v-if="currentStep <= 5"
            x="580"
            y="315"
            :fill="currentStep === 4 ? '#ffffff' : '#0284c7'"
          >
            2
          </text>

          <!-- Passo 0 - 5: Numerale '3' -->
          <text
            v-if="currentStep <= 5"
            x="690"
            y="315"
            :fill="currentStep === 5 ? '#ffffff' : '#0284c7'"
          >
            3
          </text>
        </g>

        <!-- 6. NOTAZIONE UNIFICATA DEI RISULTATI DELLE RIDUZIONI -->

        <!-- PASSO 6: Riduzione (· 2 3) -> 6 -->
        <g v-if="currentStep === 6" class="transition-all duration-300">
          <rect
            x="552"
            y="160"
            width="55"
            height="55"
            rx="12"
            fill="#22c55e"
            stroke="#16a34a"
            stroke-width="2"
          />
          <text
            x="580"
            y="195"
            font-family="ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace"
            font-size="20"
            font-weight="bold"
            text-anchor="middle"
            dominant-baseline="central"
            fill="#ffffff"
          >
            6
          </text>
        </g>

        <!-- PASSO 7: Riduzione Finale (+ 1 6) -> 7 (Radice) -->
        <g v-if="currentStep === 7" class="transition-all duration-300">
          <rect
            x="332"
            y="50"
            width="55"
            height="55"
            rx="14"
            fill="#22c55e"
            stroke="#16a34a"
            stroke-width="2.5"
          />
          <text
            x="360"
            y="85"
            font-family="ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace"
            font-size="20"
            font-weight="bold"
            text-anchor="middle"
            dominant-baseline="central"
            fill="#ffffff"
          >
            7
          </text>
        </g>
      </svg>
    </div>
  </div>
</template>