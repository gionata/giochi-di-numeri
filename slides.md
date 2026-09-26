---
title: |
  Giochi di Numeri:\
  Dall'aritmetica al pensiero ricorsivo
author: Gionata Massi, Alberto Cesaretti e Pamela Sanchini
theme: default
class: text-center
drawings:
  persist: false
transition: slide-left
mdc: true
hideInToc: true
# enable Comark Syntax: https://comark.dev/syntax/markdown
comark: true
# duration of the presentation
duration: 15min
date: 2026-10-11-T09:00
location: Sala Elettra B (piano terra), centro congressi Palazzo della Salute, Via San Francesco 90. Padova.
---

<Frontespizio />

<!--
Buongiorno, sono Gionata Massi e ho il piacere di presentare l'esperienza didattica "Giochi di Numeri: dall'aritmetica al pensiero ricorsivo". Il percorso è stato svolto al Savoia Benincasa di Ancona, la mia scuola di titolarità, ed è stato sviluppato insieme ai colleghi Cesaretti e Sanchini dell'Einstein di Rimini.

Il titolo, "Giochi di numeri", si riferisce all'oggetto che abbiamo manipolato, i numeri naturali, per ricostruire le operazioni che impariamo già nella scuola primaria. Abbiamo usato un approccio basato su metodologie didattiche dialogate, simili all'approccio didattico dell'aritmetica usato in Italia fino ai primi del Novecento, e la scomposizione induttiva.

Il sottotitolo del corso, "dall'aritmetica al pensiero ricorsivo", sta ad indicare che l'obiettivo centrale è l'interiorizzazione della "ricorsione strutturale" lavorando sulla struttura dei numeri naturali per passare dal "saper fare" al "saper far fare".
-->

---
layout: itadinfo
hideInToc: true
---

# Piano della presentazione

<Toc maxDepth="2" minDepth="1" text-sm/>

<!--
Vedremo il contesto, la cornice PNRR e le motivazioni pedagogiche legate all'insegnamento formativo dell'Informatica. Esamineremo gli obiettivi di apprendimento e la metodologia basata su mediatori iconici, strumenti simbolici e manipolativi.

Mostreremo come, partendo da un predicato e due primitive su numeri e liste, sia possibile costruire la notazione prefissa, l'addizione e la divisione euclidea ("operazione misteriosa"). Concluderemo con i risultati didattici, i limiti e la discussione del valore formativo della disciplina.
-->

---
layout: itadinfo
---

# Contesto e motivazione

## Quadro istituzionale
### Il progetto PNRR e il gruppo classe

<v-click>

- **Ambito istituzionale:** Progetto PNRR (DM 65/2023) *"Citizen scientists of the future"*
- **Target scolastico:** IIS "Savoia Benincasa" di Ancona, 15 studenti del primo biennio del Liceo Matematico
- **Prerequisiti iniziali:** familiarità con aritmetica e calcolo parentesizzato; nessuna competenza pregressa di programmazione

</v-click>

## Il nodo pedagogico
### Dal calcolo meccanico alla consapevolezza formale

<v-click>

- **Prassi esecutiva vs comprensione:** gli studenti usano procedure aritmetiche meccaniche ("saper fare") ma non sanno ancora **descriverle come processi per un esecutore automatico**.
- **Apprendimento significativo:** la pura memorizzazione non lascia traccia duratura; quasi nessuno studente ricorda il senso profondo della **divisione euclidea** (intera).

</v-click>

<!--
Il corso si è rivolto a 15 studenti del primo biennio del Liceo Matematico. Con una tale platea è naturale inserire l'informatica nel contesto della matematica di base, dove lo studente sa associare significato alle forme.
Il passaggio dalla matematica all'informatica avviene nell'esplicitare ciò che prima era dato per scontato.

Come notava Antonio Gramsci nei "Quaderni del carcere" (Quaderno 12):
"La lingua latina e greca si imparava secondo grammatica, meccanicamente; ma c’è molta ingiustizia e improprietà nell’accusa di meccanicità... Si ha che fare con ragazzetti, ai quali occorre far contrarre certe abitudini di diligenza, di esattezza, di compostezza anche fisica, di concentrazione psichica... che non si possono acquistare senza una ripetizione meccanica di atti disciplinati e metodici."
L'aritmetica rigorosa funge qui da sostituto moderno del latino come palestra di concentrazione.
-->

---
layout: itadinfo
---

# Obiettivi generali e visione pedagogica

## I pilastri formativi
### Dal "saper fare" al "saper far fare"

- **Formalizzazione algoritmica:** rendere esplicito il processo di riscrittura
- **Modello di esecutore:** distinguere rigorosamente espressione e valutazione
- **Struttura concettuale:** costruire una forma mentis fondata sulla *ricorsione strutturale*
- **Sistemi formali:** eliminare ogni ambiguità sintattica e semantica

## La scelta del paradigma
### Un linguaggio rigoroso e disinteressato

<v-switch>

<template #1>

- Quale linguaggio di programmazione adottare?
  - [ ] Python
  - [ ] JavaScript
  - [ ] Prolog
  - [ ] Scheme (Lisp)

</template>

<template #2>

> In questo periodo infatti lo studio... deve essere (o apparire ai discenti) disinteressato, non avere cioè scopi pratici immediati... deve essere formativo, anche se 'istruttivo', cioè ricco di nozioni concrete.
>
> — A. Gramsci, *Quaderno 12*

</template>

<template #3>

- Quale linguaggio di programmazione adottare?
  - [ ] Python
  - [ ] JavaScript
  - [ ] Prolog
  - [x] Scheme con ambiente iniziale personalizzato

</template>

</v-switch>

<!--
Gli obiettivi di alto livello sono:
1. Imparare un modo di pensare generale che toglie i dettagli e fornisce uno schema per risolvere classi di problemi.
2. Formalizzare le idee mediante un linguaggio testuale con regole rigide di interpretazione per poterci ragionare sopra.
3. Comprendere la necessità di un esecutore meccanico e saperlo simulare.

Gramsci sottolinea l'importanza di una scuola "disinteressata", non precocemente professionalizzante. Allo stesso modo, l'informatica nel Liceo non deve essere addestramento all'uso di software commerciali, ma studio formale dei processi di pensiero.

Tra le varie opzioni, ho scelto Scheme, un dialetto Lisp nato per la didattica della struttura e dell'interpretazione dei programmi.
Per rendere più significative e mnemoniche le procedure, ho modificato l'ambiente iniziale.
-->

---
layout: itadinfo
---

# Obiettivi didattici specifici (proposta CINI)

## Traguardi di competenza
### Modellizzazione e pensiero algoritmico

- **T-S-1:** comprende la necessità di fare riferimento a un esecutore automatico per esprimere algoritmi in modo non ambiguo
- **T-S-2:** riconosce che un algoritmo risolve un problema nella sua generalità
- **T-S-3:** giustifica la correttezza di un algoritmo rispetto a tale generalità
- **T-S-6:** definisce, realizza e valida programmi che modellano processi familiari

## Obiettivi di apprendimento operativi
### Previsione e programmazione

- **O-S-P-2:** predire il risultato di un programma prima di farlo eseguire
- **O-S-P-3:** utilizzare condizioni che impiegano operatori logici
- **O-S-P-7:** scrivere semplici programmi in un linguaggio testuale rispettandone la sintassi
- **O-S-N-3:** identificare se e come i programmi possono essere modificati

<!--
Con particolare riferimento al contesto degli obiettivi della proposta di indicazioni nazionali del CINI, che individua nella secondaria di secondo grado il compito di sviluppare la competenza di modellizzare i problemi e progettare algoritmi.
Trovate l'elenco nella diapositiva.

I concetti chiave da costruire sono:
- Algoritmo come forma generale di ragionamento corretto su insiemi infiniti di istanze.
- Computazione come passo di riscrittura meccanica dell'interprete.
- Correttezza tramite lo schema induttivo della ricorsione strutturale.
-->

---
layout: itadinfo
---

# Metodologia e mediatori didattici

## Metodologia didattica
### Risoluzione guidata e imitazione di schemi

- **Metodo dialogato:** conduzione maieutica basata su problemi guidati e discussione comune
- **Esercizio formale e disciplinato:** apprendimento per imitazione e ripetizione sistematica

## Riferimenti teorici e storici
### Ispirazioni pedagogiche

- **Dan Friedman (*The Little Schemer*):** emergenza della ricorsione per ripetizione e schemi comuni
- **Abelson & Sussman (*SICP*) e Felleisen et al. (*HtDP*):** scomposizione strutturale del dato
- **Georges Cuisenaire e Giovanni Bosco:** l'aritmetica manipolativa dei "numeri in colore", il confronto iconico e la gradualità

<!--
Invece di calare la ricorsione come regola astratta, l'abbiamo fatta emergere per imitazione e ripetizione: gli studenti osservano procedure scritte, ne discutono la struttura e la riproducono su problemi nuovi.

Questo approccio metodico e disciplinato trova un riscontro nell'idea gramsciana per cui la maturazione dell'astrazione passa attraverso l'esercizio costante e la padronanza delle forme.
-->

---
layout: itadinfo
---

# Linguaggio e ambiente di calcolo

## Il linguaggio Scheme
### Essenzialità sintattica: tre forme fondamentali

- **`define`:** associazione univoca tra nomi e valori
- **`lambda`:** astrazione funzionale pura
- **`cond`:** espressione condizionale multi-ramo

Nessun costrutto imperativo accessorio (cicli `for`/`while`, mutazione di variabili): l'attenzione resta interamente focalizzata sulla struttura dei dati e delle funzioni.

## Ambienti di sviluppo e visualizzazione
### Accessibilità web senza installazione

- **WeScheme:** interprete didattico eseguibile direttamente nel browser
- **ProcessVisualizer:** simulatore dei passi di riduzione per l'esecutore automatico

<!--
WeScheme offre un ambiente accessibile che non richiede installazione. Scheme permette di costruire una forma mentis ricorsiva (la procedura ricalca la struttura induttiva del dato) senza la complessità sintattica dei linguaggi imperativi commerciali.

Come rimarcato da Gramsci, la sostituzione dei percorsi classici richiede materie capaci di dare un risultato equivalente di formazione generale: Scheme garantisce questo rigore logico-formale.
-->

---
layout: itadinfo
---

# Incontri 1–3: fondamenti e ricorsione su liste

## Articolazione delle prime tre sessioni
### La progressione concettuale

- **Incontro 1: Fondamenti di Scheme, espressioni e mediatori iconici**
  - Notazione prefissa, atomi, liste e modello di valutazione per sostituzione
  - I quattro mediatori iconici e il morphing verso la sintassi Scheme
- **Incontro 2: Condizionali e struttura ricorsiva**
  - La forma `cond`, identificazione rigorosa del caso base e del passo ricorsivo
- **Incontro 3: Procedure ricorsive su liste**
  - Algoritmi di riconoscimento (`tutti-atomi?`), esplorazione e scomposizione `primo`/`resto`

<!--
Nei primi tre incontri il lavoro parte dalla distinzione tra espressione e valutazione per poi approdare alla manipolazione ricorsiva delle liste.
-->

---
layout: itadinfo
---

# Incontro 1: espressioni e ordine di valutazione

## Modello di calcolo per sostituzione
### Riduzione meccanica di un'espressione aritmetica

<div class="relative h-40 mt-12 text-5xl text-center">

<div v-click.fade-in.scale="[1, 2]" class="absolute inset-0 flex items-center justify-center">

$$
1 + 2 \cdot 3
$$

</div>

<div v-click.fade-in.scale="[2, 3]" class="absolute inset-0 flex items-center justify-center">

$$
1 + (2 \cdot 3)
$$

</div>

<div v-click.fade-in.scale="[3, 4]" class="absolute inset-0 flex items-center justify-center">

$$
1 + 6
$$

</div>

<div v-click.fade-in.scale="[4, 5]" class="absolute inset-0 flex items-center justify-center">

$$
(1 + 6)
$$

</div>

<div v-click.fade-in.scale="5" class="absolute inset-0 flex items-center justify-center">

$$
7
$$

</div>

</div>

<!--
Il modello di valutazione per sostituzione abitua gli studenti a considerare il calcolo come un processo di riscrittura a catena.
-->

---
layout: itadinfo
---

# Incontro 1: i quattro mediatori iconici

## Trasposizioni visive dell'espressione (+ 1 2)
### Molteplici linguaggi per distinguere espressione e valutazione

<div class="grid grid-cols-2 gap-4 mt-2">
  <div class="bg-white p-2.5 rounded-xl border border-slate-200 shadow-sm flex flex-col items-center">
    <div class="text-xs font-bold text-slate-800 mb-1">Scrittura prefissa (s-exp)</div>
    <div class="h-16 flex items-center justify-center">
      <img src="/assets/img/s-exp.svg" class="h-10 object-contain" alt="Espressione prefissa" />
    </div>
    <div class="text-[11px] text-slate-500 mt-1">Operatore anteposto agli argomenti</div>
  </div>

  <div class="bg-white p-2.5 rounded-xl border border-slate-200 shadow-sm flex flex-col items-center">
    <div class="text-xs font-bold text-slate-800 mb-1">Struttura a lista (cons cell)</div>
    <div class="h-16 flex items-center justify-center">
      <img src="/assets/img/lista.svg" class="h-12 object-contain" alt="Struttura a lista" />
    </div>
    <div class="text-[11px] text-slate-500 mt-1">Coppie di puntatori in memoria</div>
  </div>

  <div class="bg-white p-2.5 rounded-xl border border-slate-200 shadow-sm flex flex-col items-center">
    <div class="text-xs font-bold text-slate-800 mb-1">Albero sintattico (AST)</div>
    <div class="h-18 flex items-center justify-center">
      <img src="/assets/img/albero.svg" class="h-16 object-contain" alt="Albero sintattico" />
    </div>
    <div class="text-[11px] text-slate-500 mt-1">Gerarchia di rami dall'operatore</div>
  </div>

  <div class="bg-white p-2.5 rounded-xl border border-slate-200 shadow-sm flex flex-col items-center">
    <div class="text-xs font-bold text-slate-800 mb-1">Cerchio di valutazione (Bootstrap)</div>
    <div class="h-18 flex items-center justify-center">
      <img src="/assets/img/cerchio.svg" class="h-16 object-contain" alt="Cerchio di valutazione" />
    </div>
    <div class="text-[11px] text-slate-500 mt-1">Operatore in alto, argomenti in basso</div>
  </div>
</div>

<div class="text-[11px] text-slate-600 dark:text-slate-400 mt-2 text-center">
  A questi quattro mediatori per le espressioni si affianca il supporto manipolativo dei <strong>numeri in colore (regoli Cuisenaire)</strong> per la costruzione delle operazioni aritmetiche sui naturali.
</div>

<!--
I quattro mediatori iconici consentono agli studenti di visualizzare la stessa struttura sintattica da prospettive complementari: simbolica, strutturale, ad albero e a contenitore geometrico.
-->

---
layout: itadinfo
clicks: 6
---

# Incontro 1: morphing dai mediatori alla notazione prefissa

## Transizione continua tra le rappresentazioni
### Da (1 + (2 · 3)) a (+ 1 (· 2 3)) attraverso sette stadi

<ExpressionMorph :click="$clicks" />

<!--
Questa animazione sintetizza l'intero percorso pedagogico di transizione tra rappresentazioni:
a) Partiamo dall'espressione infissa completamente parentesizzata (1 + (2 · 3)).
b) Elevando gli operatori facciamo emergere la gerarchia sintattica e semantica rispetto agli operandi.
c) Nel Cerchio di Valutazione (Bootstrap World), l'operatore occupa la parte superiore e comanda i sotto-settori.
d) L'AST binario classico mostra la gerarchia con operatori nei nodi interni e operandi come foglie.
e) L'albero a nodi (stile SICP) tratta ogni combinazione come un nodo con 3 rami, dove il primo figlio è l'operatore.
f) La struttura a lista / cons cell mostra la catena di coppie [car | cdr] in memoria che punta ad atomi e sotto-liste.
g) Linearizzando la lista otteniamo la notazione prefissa Scheme (+ 1 (· 2 3)), priva di qualsiasi ambiguità sintattica.
-->

---
layout: itadinfo
---

# Incontri 2 e 3: primitive linguistiche e ricorsione su liste

## Primitive per la manipolazione di liste
### Costruttori, selettori e predicati fondamentali

- **Costante terminale:** `lista-vuota` (`'()`)
- **Predicati di tipo:** `atomo?`, `lista?`, `lista-vuota?`, `uguale?`
- **Selettori e costruttori:** `primo` (`car`), `resto` (`cdr`), `anteponi` (`cons`), `lista`

## Struttura ricorsiva e predicati di verifica
### Caso base e passo induttivo

```scheme
(define tutti-atomi?
  (lambda (lst)
    (cond
      [(lista-vuota? lst) #t]
      [(atomo? (primo lst)) (tutti-atomi? (resto lst))]
      [else #f])))
```

<!--
Fornendo agli studenti un insieme ridotto di primitive fondamentali, tutto il resto del linguaggio e delle procedure su liste viene costruito per composizione ricorsiva.
-->

---
layout: itadinfo
---

# Incontri 4 e 5: aritmetica ricorsiva e assiomi di Peano

<div class="grid grid-cols-12 gap-5 mt-1 items-start">
<div class="col-span-7">

## Primitive sui naturali e assiomi di Peano
### Il sistema computazionale di Peano

- `zero?` : verifica del caso base ($n = 0$)
- `s` : funzione successore unitario ($n + 1$)
- `p` : funzione predecessore unitario ($n - 1$)

## Costruzione ricorsiva dell'addizione
### Tre piani integrati per (addizione 3 2)

```scheme
(define addizione
  (lambda (a b)
    (cond
      [(zero? b) a]
      [else (s (addizione a (p b)))])))
```

- **Piano manipolativo:** i numeri in colore (regoli Cuisenaire)
- **Piano simbolico:** riscrittura delle espressioni alla lavagna
- **Piano grafico:** accumulo e contrazione dei successori differiti

</div>

<div class="col-span-5 bg-white p-2.5 rounded-xl border border-slate-200 shadow-sm flex flex-col items-center">
  <div class="text-xs font-bold text-slate-800 mb-1">Numeri in colore: (addizione 3 2)</div>
  <img src="/assets/img/addizione.svg" class="h-68 max-h-[290px] object-contain" alt="Addizione con i numeri in colore" />
  <div class="text-[10px] text-slate-500 mt-1">Riduzione del secondo argomento e accumulo dei successori</div>
</div>
</div>

<!--
Invece di usare tabelline o algoritmi in colonna, l'addizione viene definita unicamente tramite incremento/decremento unitario.
Per calcolare (addizione 3 2), la procedura riduce il secondo argomento b verso 0, accumulando chiamate della funzione successore 's'. Raggiunto il caso base zero?, la catena di successori sospesi si contrae fornendo il risultato.
I numeri in colore (regoli Cuisenaire) rendono tangibile la manipolazione e l'equivalenza numerica.
-->

---
layout: itadinfo
---

# Il caso emblematico: la divisione intera e l'operazione misteriosa

<div class="grid grid-cols-12 gap-5 mt-1 items-start">
<div class="col-span-7">

## Introduzione euristica
### Analisi semantica di un listato oscurato

- **Strategia didattica:** presentazione con nome oscurato `operazione-misteriosa`
- **Compito richiesto:** simulazione mentale di `(operazione-misteriosa 12 4)`

## Riscoperta della divisione euclidea
### Sottrazione ripetuta e astrazione funzionale

```scheme
(define quoziente
  (lambda (a b)
    (cond
      [(minore? a b) 0]
      [else (s (quoziente (sottrazione a b) b))])))
```

- **Sottrazione ripetuta:** riscoperta come decrementi a blocchi di 4
- **Verso l'astrazione:** generalizzazione del pattern induttivo

</div>

<div class="col-span-5 bg-white p-2.5 rounded-xl border border-slate-200 shadow-sm flex flex-col items-center">
  <div class="text-xs font-bold text-slate-800 mb-1">Numeri in colore: (quoziente 12 4)</div>
  <img src="/assets/img/divisione.svg" class="h-68 max-h-[290px] object-contain" alt="Divisione con i numeri in colore" />
  <div class="text-[10px] text-slate-500 mt-1">Sottrazioni successive di 4 fino al caso base</div>
</div>
</div>

<!--
La divisione euclidea, spesso memorizzata in modo arido alla scuola primaria, viene qui "smontata" e ricostruita tramite sottrazioni successive.
L'uso di nomi non significativi come "operazione-misteriosa" stimola l'analisi interpretativa del codice: lo studente deve simulare l'esecutore per comprendere il significato semantico del programma.
I numeri in colore mostrano visivamente come il segmento da 12 sia composto esattamente da 3 blocchi da 4.
-->

---
layout: itadinfo
---

# Risultati didattici e valore formativo

## Evidenze di apprendimento
### Competenze concettuali e metacognitive

- **Esecuzione vs interpretazione:** gli studenti imparano a leggere i programmi come oggetti di studio e a predire i risultati
- **Lessico disciplinare rigoroso:** assimilazione consapevole dei termini *espressione*, *procedura*, *caso base*, *argomento*, *parametro*
- **Evoluzione cognitiva:** la ricorsione, da iniziale "artificio sintattico", diventa **metodo generale di scomposizione dei problemi**

## Impatto pedagogico
### Una disciplina formativa per la scuola secondaria

> Dimostrata la fattibilità nel primo biennio di un'Informatica fortemente disciplinare, capace di promuovere il pensiero critico.

<!--
L'esperienza ha confermato che anche nel primo biennio è possibile superare l'approccio puramente nozionistico o addestrativo.
In perfetto accordo con l'impostazione gramsciana, lo studio metodico di un sistema formale rigido sviluppa capacità di astrazione, precisione concettuale e consapevolezza dei processi logici.
-->

---
layout: itadinfo
---

# Limiti riscontrati e proposte di sviluppo

## Limiti emersi
### Complessità e vincoli temporali

- **Soglia d'ingresso sintattica:** la notazione prefissa richiede un orientamento iniziale non banale
- **Disparità nei tempi di assimilazione:** 10 ore permettono di costruire intuizioni robuste ma non di consolidarle in modo omogeneo per l'intera classe

## Proposte per le edizioni future
### Consolidamento e trasferibilità

- **Verifiche strutturate:** introduzione di prove ex-ante ed ex-post per quantificare il guadagno formativo nella predizione dei programmi
- **Fase di trasferimento (transfer):** raccordo finale verso linguaggi testuali diffusi (es. Python) per mostrare la generalità dei concetti appresi

<!--
Tra i limiti va registrata la disparità nei tempi di assimilazione tra gli studenti.
Come proposta di sviluppo, il trasferimento dei concetti ricorsivi in un linguaggio imperativo tradizionale consentirebbe di mostrare che la forma mentis acquisita è indipendente dal singolo strumento software utilizzato.
-->

---
layout: itadinfo
---

# Conclusioni

## Sintesi dell'esperienza
### L'informatica come disciplina formativa

- **Rifiuto del riduzionismo pratico:** no all'Informatica intesa come mero addestramento all'uso di applicativi o software commerciali
- **L'aritmetica ricorsiva come "nuovo latino":** una palestra logica disinteressata, rigorosa ed essenziale per il Liceo Matematico
- **Ritorno alla consapevolezza:** il passaggio dal "saper fare" esecutivo al "saper far fare" formale offre agli studenti gli strumenti per comprendere davvero le strutture del calcolo

<div class="text-center font-bold mt-6">
  Grazie per l'attenzione!
</div>

<!--
In conclusione, l'esperienza dimostra che l'Informatica, se insegnata attraverso le sue basi teoriche e formali, risponde appieno alla funzione educativa e culturale delineata da Gramsci per la scuola secondaria: formare menti capaci di astrarre, analizzare e ragionare in modo autonomo e consapevole.
-->
