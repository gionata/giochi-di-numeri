<script setup lang="ts">
import { computed, ref, watch } from 'vue'

const props = withDefaults(
  defineProps<{
    click?: number
  }>(),
  {
    click: 0,
  }
)

const manualStep = ref<number | null>(null)

// Reset manual step when parent click changes
watch(
  () => props.click,
  () => {
    manualStep.value = null
  }
)

const steps = [
  { key: 'a', title: 'Espressione infissa con parentesi', code: '(1 + (2 · 3))' },
  { key: 'b', title: 'Elevamento degli operatori', code: 'Elevazione di + e ·' },
  { key: 'c', title: 'Cerchi di valutazione (Bootstrap World)', code: 'Cerchio esterno + e sotto-cerchio ·' },
  { key: 'd', title: 'Albero sintattico (AST)', code: 'Operatori nei nodi, operandi foglie' },
  { key: 'e', title: 'Albero sintattico a nodi (SICP)', code: 'Operatore come primo elemento della lista' },
  { key: 'f', title: 'Struttura a lista', code: 'Catena [primo | resto] con puntatori' },
  { key: 'g', title: 'Notazione prefissa Scheme', code: '(+ 1 (· 2 3))' },
]

const currentStep = computed(() => {
  if (manualStep.value !== null) {
    return manualStep.value
  }
  const raw = props.click ?? 0
  return Math.min(Math.max(raw, 0), steps.length - 1)
})

function setStep(idx: number) {
  manualStep.value = idx
}

// Colori unificati: tutti i numeri con lo stesso colore (#38bdf8), tutti gli operatori (#f59e0b)
const COLOR_OPERATOR = '#f59e0b'
const COLOR_NUMBER = '#38bdf8'

const symbolsConfig = [
  { id: 'plus', char: '+', color: COLOR_OPERATOR },
  { id: 'n1', char: '1', color: COLOR_NUMBER },
  { id: 'mul', char: '·', color: COLOR_OPERATOR },
  { id: 'n2', char: '2', color: COLOR_NUMBER },
  { id: 'n3', char: '3', color: COLOR_NUMBER },
]

// Coordinate [x, y] dei 5 simboli nei 7 stati (a - g)
// ViewBox: 0 0 920 390
const positions: Record<string, Array<{ x: number; y: number }>> = {
  // Simbolo '+'
  plus: [
    { x: 390, y: 195 }, // a: tra 1 e (
    { x: 390, y: 115 }, // b: sollevato in alto
    { x: 450, y: 105 }, // c: sommità del cerchio principale
    { x: 410, y: 95 },  // d: radice dell'AST binario
    { x: 230, y: 195 }, // e: primo figlio del nodo radice SICP
    { x: 180, y: 205 }, // f: puntato dal car della prima cons cell
    { x: 300, y: 195 }, // g: notazione prefissa (+ 1 (· 2 3))
  ],
  // Simbolo '1'
  n1: [
    { x: 320, y: 195 }, // a: primo numero
    { x: 280, y: 275 }, // b: base sinistra
    { x: 345, y: 255 }, // c: settore sinistro del cerchio
    { x: 280, y: 215 }, // d: foglia sinistra dell'AST
    { x: 360, y: 195 }, // e: secondo figlio del nodo radice SICP
    { x: 300, y: 205 }, // f: puntato dal car della seconda cons cell
    { x: 380, y: 195 }, // g: secondo elemento (+ 1 ...)
  ],
  // Simbolo '·'
  mul: [
    { x: 600, y: 195 }, // a: tra 2 e 3
    { x: 600, y: 155 }, // b: sollevato sopra 2 e 3
    { x: 515, y: 215 }, // c: sommità del sotto-cerchio
    { x: 580, y: 215 }, // d: nodo destro intermedio dell'AST
    { x: 470, y: 315 }, // e: primo figlio del sotto-nodo SICP
    { x: 520, y: 325 }, // f: puntato dal car della cons cell del sotto-elenco
    { x: 510, y: 195 }, // g: prefisso della sotto-espressione (· 2 3)
  ],
  // Simbolo '2'
  n2: [
    { x: 530, y: 195 }, // a: dentro parentesi interna
    { x: 520, y: 275 }, // b: base centrale
    { x: 492, y: 275 }, // c: settore sinistro del sotto-cerchio
    { x: 490, y: 320 }, // d: foglia sinistra del ramo ·
    { x: 580, y: 315 }, // e: secondo figlio del sotto-nodo SICP
    { x: 640, y: 325 }, // f: car della seconda cella sotto-elenco
    { x: 590, y: 195 }, // g: primo argomento di ·
  ],
  // Simbolo '3'
  n3: [
    { x: 670, y: 195 }, // a: ultimo numero
    { x: 680, y: 275 }, // b: base destra
    { x: 538, y: 275 }, // c: settore destro del sotto-cerchio
    { x: 670, y: 320 }, // d: foglia destra del ramo ·
    { x: 690, y: 315 }, // e: terzo figlio del sotto-nodo SICP
    { x: 760, y: 325 }, // f: car della terza cella sotto-elenco
    { x: 670, y: 195 }, // g: secondo argomento di ·
  ],
}

// Parentesi per lo stato 'a' (infisso) e 'g' (prefisso)
const parens = computed(() => {
  const step = currentStep.value
  const isA = step === 0
  const isG = step === 6
  const opacity = isA || isG ? 1 : 0

  if (isA) {
    return [
      { id: 'p1', char: '(', x: 260, y: 195, opacity },
      { id: 'p2', char: '(', x: 460, y: 195, opacity },
      { id: 'p3', char: ')', x: 740, y: 195, opacity },
      { id: 'p4', char: ')', x: 790, y: 195, opacity },
    ]
  } else if (isG) {
    return [
      { id: 'p1', char: '(', x: 240, y: 195, opacity },
      { id: 'p2', char: '(', x: 450, y: 195, opacity },
      { id: 'p3', char: ')', x: 730, y: 195, opacity },
      { id: 'p4', char: ')', x: 780, y: 195, opacity },
    ]
  }
  return [
    { id: 'p1', char: '(', x: 250, y: 195, opacity: 0 },
    { id: 'p2', char: '(', x: 455, y: 195, opacity: 0 },
    { id: 'p3', char: ')', x: 735, y: 195, opacity: 0 },
    { id: 'p4', char: ')', x: 785, y: 195, opacity: 0 },
  ]
})
</script>

<template>
  <div class="flex flex-col items-center w-full select-none">
    <!-- Header compatto della fase corrente -->
    <div class="w-full flex items-center justify-between mb-2.5 px-2">
      <div class="flex items-center gap-2">
        <span class="text-sm font-bold uppercase tracking-wider text-emerald-500">
          {{ steps[currentStep].key.toUpperCase() }}
        </span>
        <span class="text-xs font-semibold text-slate-700 dark:text-slate-300">
          {{ steps[currentStep].title }}
        </span>
        <span class="text-xs px-2 py-0.5 rounded bg-slate-200/80 dark:bg-slate-800 text-slate-700 dark:text-slate-300 font-mono">
          {{ steps[currentStep].code }}
        </span>
      </div>

      <!-- Selettore dei passi (a - g) -->
      <div class="flex items-center gap-1 bg-slate-200/60 dark:bg-slate-800/80 p-1 rounded-lg border border-slate-300/60 dark:border-slate-700">
        <button
          v-for="(s, idx) in steps"
          :key="s.key"
          type="button"
          class="w-6 h-6 rounded flex items-center justify-center text-xs font-mono font-bold transition-all"
          :class="
            currentStep === idx
              ? 'bg-emerald-500 text-white shadow-sm scale-105'
              : 'text-slate-600 dark:text-slate-400 hover:bg-slate-300/60 dark:hover:bg-slate-700'
          "
          @click="setStep(idx)"
        >
          {{ s.key }}
        </button>
      </div>
    </div>

    <!-- Telaio SVG Principale con sfondo chiaro/pulito e morphing fluido -->
    <div class="relative w-full h-[330px] rounded-xl bg-slate-100/70 dark:bg-slate-800/40 border border-slate-200 dark:border-slate-700/60 p-2 shadow-md overflow-hidden flex items-center justify-center">
      <svg
        viewBox="0 0 920 390"
        class="w-full h-full"
        preserveAspectRatio="xMidYMid meet"
      >
        <defs>
          <!-- Marcatore freccia destra per cdr -->
          <marker
            id="arrow-right"
            viewBox="0 0 10 10"
            refX="7"
            refY="5"
            markerWidth="6"
            markerHeight="6"
            orient="auto"
          >
            <path d="M 1 2 L 8 5 L 1 8 z" fill="#6366f1" />
          </marker>

          <!-- Marcatore freccia giù per car -->
          <marker
            id="arrow-down"
            viewBox="0 0 10 10"
            refX="5"
            refY="7"
            markerWidth="6"
            markerHeight="6"
            orient="auto"
          >
            <path d="M 2 1 L 5 8 L 8 1 z" fill="#38bdf8" />
          </marker>

          <!-- Gradiente cerchi Bootstrap -->
          <linearGradient id="circleGrad" x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" stop-color="#06b6d4" stop-opacity="0.08" />
            <stop offset="100%" stop-color="#0891b2" stop-opacity="0.02" />
          </linearGradient>

          <!-- Gradiente sotto-cerchio -->
          <linearGradient id="innerCircleGrad" x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" stop-color="#f59e0b" stop-opacity="0.10" />
            <stop offset="100%" stop-color="#d97706" stop-opacity="0.03" />
          </linearGradient>
        </defs>

        <!-- ============================================================== -->
        <!-- STRUTTURE GRAFICHE DI CONTORNO CONDIVISE (Senza etichette)     -->
        <!-- ============================================================== -->

        <!-- STATO B: Guide di elevamento degli operatori -->
        <g
          :style="{
            opacity: currentStep === 1 ? 1 : 0,
            transition: 'opacity 0.45s ease',
          }"
          stroke="#94a3b8"
          stroke-dasharray="4 4"
          stroke-width="1.5"
        >
          <!-- Linea di terra orizzontale -->
          <line x1="220" y1="275" x2="720" y2="275" stroke="#94a3b8" stroke-width="1" />
          
          <!-- Linea di elevamento per + -->
          <line x1="390" y1="275" x2="390" y2="135" stroke="#f59e0b" stroke-width="2" />
          <polygon points="390,122 385,137 395,137" fill="#f59e0b" />

          <!-- Linea di elevamento per · -->
          <line x1="600" y1="275" x2="600" y2="175" stroke="#f59e0b" stroke-width="2" />
          <polygon points="600,162 595,177 605,177" fill="#f59e0b" />
        </g>

        <!-- STATO C: Cerchi di valutazione (Bootstrap World)                -->
        <!-- Cerchio esterno ampliato a r=170 per contenere comodamente       -->
        <!-- il sotto-cerchio interno a (515, 255) con r=55                   -->
        <g
          :style="{
            opacity: currentStep === 2 ? 1 : 0,
            transition: 'opacity 0.45s ease',
          }"
        >
          <!-- Cerchio esterno per (+) -->
          <circle
            cx="450"
            cy="195"
            r="170"
            fill="url(#circleGrad)"
            stroke="#0891b2"
            stroke-width="2.5"
          />
          <!-- Divisorio orizzontale cerchio esterno a Y=160 -->
          <line x1="284" y1="160" x2="616" y2="160" stroke="#0891b2" stroke-width="2" />
          <!-- Divisorio verticale cerchio esterno a X=405 -->
          <line x1="405" y1="160" x2="405" y2="360" stroke="#0891b2" stroke-width="2" />

          <!-- Sotto-cerchio per (·) interamente contenuto nel settore inferiore-destro -->
          <circle
            cx="515"
            cy="255"
            r="55"
            fill="url(#innerCircleGrad)"
            stroke="#f59e0b"
            stroke-width="2"
          />
          <!-- Divisorio orizzontale sotto-cerchio a Y=240 -->
          <line x1="462" y1="240" x2="568" y2="240" stroke="#f59e0b" stroke-width="1.8" />
          <!-- Divisorio verticale sotto-cerchio a X=515 -->
          <line x1="515" y1="240" x2="515" y2="310" stroke="#f59e0b" stroke-width="1.8" />
        </g>

        <!-- STATO D: Albero sintattico binario (AST classico) -->
        <g
          :style="{
            opacity: currentStep === 3 ? 1 : 0,
            transition: 'opacity 0.45s ease',
          }"
          stroke-linecap="round"
        >
          <!-- Ramo da + a 1 -->
          <line x1="410" y1="95" x2="280" y2="215" stroke="#94a3b8" stroke-width="2.5" />
          <!-- Ramo da + a · -->
          <line x1="410" y1="95" x2="580" y2="215" stroke="#94a3b8" stroke-width="2.5" />
          <!-- Ramo da · a 2 -->
          <line x1="580" y1="215" x2="490" y2="320" stroke="#94a3b8" stroke-width="2.5" />
          <!-- Ramo da · a 3 -->
          <line x1="580" y1="215" x2="670" y2="320" stroke="#94a3b8" stroke-width="2.5" />
        </g>

        <!-- STATO E: Albero sintattico a nodi (SICP style) -->
        <g
          :style="{
            opacity: currentStep === 4 ? 1 : 0,
            transition: 'opacity 0.45s ease',
          }"
        >
          <!-- Nodo radice lista (piccolo disco pieno discreto) -->
          <circle cx="360" cy="85" r="7" fill="#64748b" />

          <!-- 3 rami dal nodo radice -->
          <line x1="360" y1="85" x2="230" y2="195" stroke="#94a3b8" stroke-width="2" />
          <line x1="360" y1="85" x2="360" y2="195" stroke="#94a3b8" stroke-width="2" />
          <line x1="360" y1="85" x2="580" y2="195" stroke="#94a3b8" stroke-width="2" />

          <!-- Nodo sotto-lista -->
          <circle cx="580" cy="195" r="7" fill="#64748b" />

          <!-- 3 rami dal sotto-nodo -->
          <line x1="580" y1="195" x2="470" y2="315" stroke="#94a3b8" stroke-width="2" />
          <line x1="580" y1="195" x2="580" y2="315" stroke="#94a3b8" stroke-width="2" />
          <line x1="580" y1="195" x2="690" y2="315" stroke="#94a3b8" stroke-width="2" />
        </g>

        <!-- STATO F: Struttura a lista e celle di memoria (cons cell) -->
        <g
          :style="{
            opacity: currentStep === 5 ? 1 : 0,
            transition: 'opacity 0.45s ease',
          }"
        >
          <!-- RIGA 1 (Lista principale): 3 Cons Cell -->
          <!-- Cella 1 (car -> '+', cdr -> Cella 2) -->
          <g>
            <rect x="140" y="90" width="80" height="34" rx="5" fill="rgba(99, 102, 241, 0.08)" stroke="#6366f1" stroke-width="1.8" />
            <line x1="180" y1="90" x2="180" y2="124" stroke="#6366f1" stroke-width="1.5" />
            <circle cx="160" cy="107" r="3.5" fill="#38bdf8" />
            <line x1="160" y1="111" x2="175" y2="185" stroke="#38bdf8" stroke-width="1.8" marker-end="url(#arrow-down)" />
            <circle cx="200" cy="107" r="3.5" fill="#6366f1" />
            <line x1="204" y1="107" x2="255" y2="107" stroke="#6366f1" stroke-width="1.8" marker-end="url(#arrow-right)" />
          </g>

          <!-- Cella 2 (car -> '1', cdr -> Cella 3) -->
          <g>
            <rect x="260" y="90" width="80" height="34" rx="5" fill="rgba(99, 102, 241, 0.08)" stroke="#6366f1" stroke-width="1.8" />
            <line x1="300" y1="90" x2="300" y2="124" stroke="#6366f1" stroke-width="1.5" />
            <circle cx="280" cy="107" r="3.5" fill="#38bdf8" />
            <line x1="280" y1="111" x2="295" y2="185" stroke="#38bdf8" stroke-width="1.8" marker-end="url(#arrow-down)" />
            <circle cx="320" cy="107" r="3.5" fill="#6366f1" />
            <line x1="324" y1="107" x2="375" y2="107" stroke="#6366f1" stroke-width="1.8" marker-end="url(#arrow-right)" />
          </g>

          <!-- Cella 3 (car -> Cella 4 sotto-elenco, cdr -> nil) -->
          <g>
            <rect x="380" y="90" width="80" height="34" rx="5" fill="rgba(99, 102, 241, 0.08)" stroke="#6366f1" stroke-width="1.8" />
            <line x1="420" y1="90" x2="420" y2="124" stroke="#6366f1" stroke-width="1.5" />
            <circle cx="400" cy="107" r="3.5" fill="#38bdf8" />
            <path d="M 400 111 L 400 160 L 475 220" fill="none" stroke="#38bdf8" stroke-width="1.8" marker-end="url(#arrow-down)" />
            <line x1="425" y1="121" x2="455" y2="93" stroke="#ef4444" stroke-width="2.2" />
          </g>

          <!-- RIGA 2 (Sotto-lista per (· 2 3)): 3 Cons Cell -->
          <!-- Cella 4 (car -> '·', cdr -> Cella 5) -->
          <g>
            <rect x="480" y="210" width="80" height="34" rx="5" fill="rgba(99, 102, 241, 0.08)" stroke="#6366f1" stroke-width="1.8" />
            <line x1="520" y1="210" x2="520" y2="244" stroke="#6366f1" stroke-width="1.5" />
            <circle cx="500" cy="227" r="3.5" fill="#38bdf8" />
            <line x1="500" y1="231" x2="515" y2="305" stroke="#38bdf8" stroke-width="1.8" marker-end="url(#arrow-down)" />
            <circle cx="540" cy="227" r="3.5" fill="#6366f1" />
            <line x1="544" y1="227" x2="595" y2="227" stroke="#6366f1" stroke-width="1.8" marker-end="url(#arrow-right)" />
          </g>

          <!-- Cella 5 (car -> '2', cdr -> Cella 6) -->
          <g>
            <rect x="600" y="210" width="80" height="34" rx="5" fill="rgba(99, 102, 241, 0.08)" stroke="#6366f1" stroke-width="1.8" />
            <line x1="640" y1="210" x2="640" y2="244" stroke="#6366f1" stroke-width="1.5" />
            <circle cx="620" cy="227" r="3.5" fill="#38bdf8" />
            <line x1="620" y1="231" x2="635" y2="305" stroke="#38bdf8" stroke-width="1.8" marker-end="url(#arrow-down)" />
            <circle cx="660" cy="227" r="3.5" fill="#6366f1" />
            <line x1="664" y1="227" x2="715" y2="227" stroke="#6366f1" stroke-width="1.8" marker-end="url(#arrow-right)" />
          </g>

          <!-- Cella 6 (car -> '3', cdr -> nil) -->
          <g>
            <rect x="720" y="210" width="80" height="34" rx="5" fill="rgba(99, 102, 241, 0.08)" stroke="#6366f1" stroke-width="1.8" />
            <line x1="760" y1="210" x2="760" y2="244" stroke="#6366f1" stroke-width="1.5" />
            <circle cx="740" cy="227" r="3.5" fill="#38bdf8" />
            <line x1="740" y1="231" x2="755" y2="305" stroke="#38bdf8" stroke-width="1.8" marker-end="url(#arrow-down)" />
            <line x1="765" y1="241" x2="795" y2="213" stroke="#ef4444" stroke-width="2.2" />
          </g>
        </g>

        <!-- STATO G: Evidenziazione S-Expression Prefissa -->
        <g
          :style="{
            opacity: currentStep === 6 ? 1 : 0,
            transition: 'opacity 0.45s ease',
          }"
        >
          <!-- Box per sotto-espressione (· 2 3) -->
          <rect
            x="430"
            y="165"
            width="310"
            height="60"
            rx="10"
            fill="rgba(245, 158, 11, 0.06)"
            stroke="#f59e0b"
            stroke-width="1.5"
            stroke-dasharray="4 4"
          />

          <!-- Box per l'intera espressione (+ 1 ...) -->
          <rect
            x="220"
            y="150"
            width="565"
            height="90"
            rx="14"
            fill="rgba(56, 189, 248, 0.04)"
            stroke="#38bdf8"
            stroke-width="1.5"
          />
        </g>

        <!-- ============================================================== -->
        <!-- PARENTESI GRAFICHE PER INFISSO (A) E PREFISSO (G)              -->
        <!-- ============================================================== -->
        <g
          v-for="p in parens"
          :key="p.id"
          :style="{
            transform: `translate(${p.x}px, ${p.y}px)`,
            opacity: p.opacity,
            transition: 'transform 0.65s cubic-bezier(0.34, 1.25, 0.64, 1), opacity 0.35s ease',
          }"
        >
          <text
            text-anchor="middle"
            dominant-baseline="central"
            font-family="ui-monospace, monospace"
            font-size="28"
            font-weight="300"
            fill="#94a3b8"
          >
            {{ p.char }}
          </text>
        </g>

        <!-- ============================================================== -->
        <!-- I 5 SIMBOLI PERSISTENTI (+, 1, ·, 2, 3) SENZA CERCHIO INTERNO  -->
        <!-- Font compatto (19px), numeri unificati (#38bdf8), op (#f59e0b) -->
        <!-- ============================================================== -->
        <g
          v-for="sym in symbolsConfig"
          :key="sym.id"
          :style="{
            transform: `translate(${positions[sym.id][currentStep].x}px, ${positions[sym.id][currentStep].y}px)`,
            transition: 'transform 0.7s cubic-bezier(0.34, 1.25, 0.64, 1)',
          }"
          class="cursor-pointer"
        >
          <text
            text-anchor="middle"
            dominant-baseline="central"
            font-family="ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace"
            font-size="19"
            font-weight="bold"
            :fill="sym.color"
          >
            {{ sym.char }}
          </text>
        </g>
      </svg>
    </div>
  </div>
</template>

<style scoped>
line, circle, rect, path {
  transition: all 0.45s ease-in-out;
}
</style>
