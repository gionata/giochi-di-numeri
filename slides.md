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
location: Sala Elettra Blu (piano terra), centro congressi Palazzo della Salute, Via San Francesco 90. Padova.
---

<script setup>
const titolo = 'Giochi di Numeri';
const sottotitolo = "Dall'aritmetica al pensiero ricorsivo";
const autori = [
  {
    nome: 'Gionata Massi',
    affiliazione: 'IIS "Savoia Benincasa"',
    citta: 'Ancona',
    presentatore: true,
  },
  {
    nome: 'Alberto Cesaretti e Pamela Sanchini',
    affiliazione: 'Liceo Scientifico e Musicale "Einstein"',
    citta: 'Rimini',
    presentatore: false,
  },
];
const conferenza = 'ITADINFO 2026';
const citta = 'Padova';
const data = '11/10/2026';
// const luogo = 'Sala Elettra Blu (piano terra), centro congressi Palazzo della Salute, Via San Francesco 90. Padova.';
const url = 'https://gionata.github.io/giochi-di-numeri/';
</script>

<Frontespizio
  :titolo="titolo"
  :sottotitolo="sottotitolo"
  :autori="autori"
  :conferenza="conferenza"
  :citta="citta"
  :data="data"
  :url="url"
/>

<!--
Buongiorno, sono Gionata Massi e ho il piacere di presentare l'esperienza didattica "Giochi di Numeri: dall'aritmetica al pensiero ricorsivo". Il percorso è stato svolto al Savoia Benincasa di Ancona, la mia scuola di titolarità, ed è stato sviluppato insieme ai colleghi Cesaretti e Sanchini dell'Einstein di Rimini.

Il titolo, "Giochi di numeri", si riferisce all'oggetto che abbiamo manipolato, i numeri naturali, per ricostruire le operazioni che impariamo già nella scuola primaria. Abbiamo usato un approccio basato su metodologie didattiche dialogate, simili all'approccio didattico dell'aritmetica usato in Italia fino ai primi del Novecento, e la scomposizione induttiva.

Il sottotitolo del corso, "dall'aritmetica al pensiero ricorsivo", sta ad indicare che l'obiettivo centrale è l'interiorizzazione della "ricorsione strutturale". Lavorando sulla struttura induttiva dei numeri naturali, un modello applicabile a molti altri problemi non necessariamente numerici, vogliamo passare dalla competenza del "saper fare" a quella del "saper far fare".

-->

---
layout: itadinfo
hideInToc: true
---

# Piano della presentazione

<Toc maxDepth="2" minDepth="1" text-sm/>

<!--
Il percorso della presentazione si articola in quattro momenti principali.

Inizieremo analizzando il contesto istituzionale, i bisogni formativi degli studenti e le scelte pedagogiche, fondate su un'idea di informatica rigorosa e disinteressata.

Passeremo poi alla metodologia, illustrando l'integrazione tra mediatori iconici, strumenti manipolativi come i regoli Cuisenaire e un interprete Scheme.

A seguire, mostreremo il cuore dell'esperienza: come, partendo da pochissime primitive, gli studenti abbiano ricostruito l'addizione e riscoperto la divisione euclidea come "operazione misteriosa".

Infine, discuteremo i risultati didattici emersi, i limiti riscontrati e il profondo valore formativo della disciplina nell'istruzione secondaria.

-->

---
layout: itadinfo
---

# Constesto, obiettivi, scelte metodologiche e strumenti

<v-switch>

<template #1>

## Contesto

### Quadro istituzionale e _target_

- Progetto PNRR (DM 65/2023) sulle discipline STEM
- IIS "Savoia Benincasa" di Ancona, 15 studenti del primo biennio del **Liceo Matematico**

## Prerequisiti
- Familiarità con l'aritmetica: operatori e priorità
- Nessuna competenza pregressa di programmazione richiesta!

</template>

<template #2>

## Bisogni formativi da soddifare

- **Dicotomia tra prassi esecutiva e comprensione**
  - gli studenti usano procedure aritmetiche meccaniche ("saper fare") ma non sanno **descriverle come processi per un esecutore automatico**.
- **Apprendimento: meccanico vs significativo**
  - la pura memorizzazione non lascia traccia duratura: quasi nessuno studente ricorda il significato della **divisione euclidea** (intera).

</template>

<template #3>

> Il calcolatore era (ed è ancora) un nuovo e meraviglioso concetto filosofico
> e matematico. Il calcolatore è ancora più rivoluzionario come idea che come
> congegno pratico che modifica la società -- e tutti sappiamo quanto abbia
> cambiato la nostra vita.
>
> Perché lo dico? Perché il calcolatore cambia l'epistemologia, modifica il
> significato del verbo «comprendere».
> A mio giudizio, si capisce qualcosa solo se si è capaci -- noi, non altri! --
> di scriverne il programma.
> Altrimenti non si ha una vera comprensione, si crede soltanto di capire.
>
> -- Gregory Chaitin, *Alla ricerca di Omega*, Adelphi Edizioni

</template>

</v-switch>

<!--
Il progetto è stato realizzato nell'ambito dei fondi DM 65/2023 e ha coinvolto 15 studenti del primo biennio del Liceo Matematico ad Ancona, senza alcuna competenza pregressa di programmazione.

[click]
Siamo partiti da un bisogno formativo fondamentale: superare la spaccatura tra prassi esecutiva e reale comprensione. Gli studenti eseguono procedure aritmetiche in modo meccanico, ma non sanno descriverle formalmente per un esecutore automatico. Inoltre, la pura memorizzazione non lascia tracce durature, come dimostra la diffusa incapacità di spiegare il senso della divisione euclidea.

[click]
Come scrive efficacemente Gregory Chaitin in "Alla ricerca di Omega", comprendere qualcosa significa essere capaci di scriverne il programma; altrimenti ci si limita a credere di aver capito. L'informatica modifica l'epistemologia del sapere, trasformando il calcolatore in un potente strumento filosofico per formalizzare il pensiero.

-->

---
layout: itadinfo
---

## Obiettivi generali e visione pedagogica

### Dal "saper fare" al "saper far fare"

- **Formalizzazione algoritmica:** rendere esplicito il processo di valutazione
- **Modello di esecutore:** distinguere rigorosamente forma e valutazione
- **Struttura concettuale:** costruire una forma mentis fondata sulla *ricorsione strutturale*
- **Sistemi formali:** eliminare ogni ambiguità sintattica e semantica

<div v-click.at="1">

### Un linguaggio rigoroso

</div>

<v-switch>

<template #1>

- Quale linguaggio di programmazione adottare?
  - <input type="checkbox" disabled /> JavaScript
  - <input type="checkbox" disabled /> Prolog
  - <input type="checkbox" disabled /> Python
  - <input type="checkbox" disabled /> Scheme

</template>

<template #2>

- Quale linguaggio di programmazione adottare?
  - <input type="checkbox" disabled /> <span class="opacity-50 line-through">JavaScript</span>
  - <input type="checkbox" disabled /> <span class="opacity-50 line-through">Prolog</span>
  - <input type="checkbox" disabled /> <span class="opacity-50 line-through">Python</span>
  - <input type="checkbox" checked disabled /> **Scheme** con ambiente iniziale personalizzato

</template>

<template #3>

- Quale linguaggio di programmazione adottare?
  - > In questo periodo infatti lo studio... deve essere (o apparire ai discenti) disinteressato, non avere cioè scopi pratici immediati... deve essere formativo, anche se 'istruttivo', cioè ricco di nozioni concrete.
     >
     > — A. Gramsci, *Quaderno 12*

  - <input type="checkbox" checked disabled /> **Scheme** con ambiente iniziale personalizzato

</template>

</v-switch>

<!--
Gli obiettivi generali puntano a trasformare la forma mentis degli studenti: formalizzare i processi, distinguere la sintassi dalla valutazione e interiorizzare la ricorsione strutturale.

[click]
Per raggiungere questo rigore, la scelta del linguaggio di programmazione diventa cruciale.

[click]
Non abbiamo scelto linguaggi di ampio uso professionale come Python o JavaScript: la loro ricchezza di costrutti complessi e le eventuali competenze pregresse degli studenti rischierebbero di distrarre dal fine formativo del corso. Allo stesso modo, per rappresentare l'aritmetica di Peano, avremmo potuto sfruttare l'unificazione nativa di Prolog per destrutturare induttivamente i numeri naturali nei loro sottoproblemi. Abbiamo invece preferito Scheme.

La sua minimalità sintattica e l'adozione del nostro ambiente personalizzato costringono gli studenti a ragionare esplicitamente sulle funzioni di costruzione e selezione dei dati, incarnando appieno lo spirito didattico della struttura dei programmi.

[click]
Questa scelta rispecchia la visione pedagogica di Antonio Gramsci nel Quaderno 12: la scuola deve essere formativa e "disinteressata", cioè priva di scopi pratici o professionalizzanti immediati. Così come il latino e il greco fungevano da palestra logica per la concentrazione e la disciplina mentale, l'informatica formale e lo studio di Scheme rappresentano il nuovo "latino", capace di allenare all'astrazione rigorosa.

-->

---
layout: itadinfo
---

## Obiettivi didattici specifici (proposta CINI)

### Traguardi di competenza

- **T-S-1:** comprende la necessità di fare riferimento a un esecutore automatico per esprimere algoritmi in modo non ambiguo
- **T-S-2:** riconosce che un algoritmo risolve un problema nella sua generalità
- **T-S-3:** giustifica la correttezza di un algoritmo rispetto a tale generalità
- **T-S-6:** definisce, realizza e valida programmi che modellano processi familiari

### Obiettivi di apprendimento operativi

- **O-S-P-2:** predire il risultato di un programma prima di farlo eseguire
- **O-S-P-3:** utilizzare condizioni che impiegano operatori logici
- **O-S-P-7:** scrivere semplici programmi in un linguaggio testuale rispettandone la sintassi
- **O-S-N-3:** identificare se e come i programmi possono essere modificati

<!--
Sul piano curricolare, il percorso si allinea rigorosamente con le indicazioni nazionali proposte dal CINI per la scuola secondaria di secondo grado.

Tra i traguardi di competenza, sottolineiamo la capacità di fare riferimento a un esecutore automatico non ambiguo, di comprendere la generalità di un algoritmo e di descriverlo formalmente.

A livello operativo, gli studenti apprendono a predire l'esito di un programma prima dell'esecuzione, a gestire la sintassi testuale e a modificare i programmi esistenti.

I tre pilastri concettuali che ne derivano sono: l'algoritmo come forma universale di ragionamento, la computazione vista come riscrittura meccanica e la correttezza garantita dall'induzione strutturale.

-->

---
layout: itadinfo
---

## Metodologia e mediatori

### Metodologia didattica

- **Metodo dialogato:** domande e risposte su concetti e problemi
- **Esercizio formale e disciplinato:** fasi di apprendimento per imitazione e ripetizione alternate da esercizi e riflessioni

### Riferimenti teorici e storici

- Dan Friedman ([The Little Schemer](https://felleisen.org/matthias/BTLS-index.html): emergenza della ricorsione per ripetizione e schemi comuni
- Abelson & Sussman ([SICP](https://sarabander.github.io/sicp/) e Felleisen et al. ([HtDP](https://htdp.org/2026-5-28//Book/index.html)): scomposizione strutturale del dato, rappresentazioni
- Georges Cuisenaire: l'aritmetica manipolativa dei "[numeri in colore](https://it.wikipedia.org/wiki/Regoli_Cuisenaire)"
- Giovanni Bosco: [L’aritmetica ed il sistema metrico portati a semplicità per le classi elementari col confronto dei prezzi e delle misure antiche d’Italia in metrico-decimale](https://www.salesian.online/wp-content/uploads/2022/01/Bosco_Aritmetica.pdf). 1881

<!--
La metodologia adottata si basa sul metodo dialogato e sull'apprendimento per imitazione guidata.

Dal punto di vista teorico, ci siamo ispirati a Dan Friedman con "The Little Schemer", da cui riprendiamo l'idea di far emergere gli schemi ricorsivi per ripetizione; Abelson e Sussman con SICP e Felleisen con HtDP per la scomposizione strutturale dei dati.

A questi affianchiamo due riferimenti storici e manipolativi: i numeri in colore, per rappresentare visivamente le procedure aritmetiche, e i testi di aritmetica, tra cui quello di San Giovanni Bosco del 1881, che proponevano lo studio dell'aritmetica con un approccio dialogato basata sulla semplicità e la concretezza percettiva.

-->

---
layout: itadinfo
---

## Scheme _semplificato_ e ambiente di valutazione

### Essenzialità sintattica: tre forme fondamentali

- **`define`:** associazione tra nomi e valori
- **`lambda`:** astrazione funzionale
- **`cond`:** espressione condizionale multi-ramo

Nessun costrutto imperativo accessorio (assegnamento di variabili, cicli): l'attenzione resta interamente focalizzata sulla struttura dei dati e delle funzioni.

### Ambienti di sviluppo e visualizzazione

- **[WeScheme](https://wescheme.org):** interprete didattico eseguibile direttamente nel browser
- **[ProcessVisualizer](https://gionatamassibenincasa.github.io/process-visualizer):** simulatore dei passi di riduzione per l'esecutore automatico

<!--
Per ridurre al minimo la barriera sintattica, abbiamo isolato tre sole forme fondamentali in Scheme: `define` per le associazioni, `lambda` per l'astrazione funzionale e `cond` per le decisioni multi-ramo.

Abbiamo deliberatamente escluso ogni costrutto imperativo accessorio, come cicli o riassegnazioni di variabili, per focalizzare l'attenzione unicamente sulla struttura dei dati.

Sul piano operativo, gli studenti utilizzano WeScheme, un ambiente cloud ad accesso immediato senza installazioni. La similazione è avvenuta alla lavagna, e solo successivamente ho costruito ProcessVisualizer, un simulatore sviluppato ad hoc che mostra passo-passo i passaggi di riduzione ed esecuzione svolti dall'interprete.

-->

---
layout: itadinfo
---

# Articolazione del percorso

##  La progressione concettuale

- **Incontro 1: espressioni, mediatori iconici e linguaggio Scheme**
  - Espressioni numeriche con notazione infissa, atomi e espressioni composte, alberi sintattici, liste e modello di valutazione per sostituzione
- **Incontro 2: Condizionali e struttura ricorsiva**
  - La forma `cond`, identificazione rigorosa del caso base e del passo ricorsivo
- **Incontro 3: Procedure ricorsive su liste**
  - Algoritmi di riconoscimento (`lista-di-atomi?`), esplorazione e scomposizione `primo`/`resto`
- **Incontri 4: Procedure ricorsive sui numeri naturali**:
  - Applicazione del principio di induzione per la (ri-)costruzione dell'aritmetica
- **Incontro 5: Dalla forma al significato delle procedure ricorsive**
  - Esercizi per dare significato ai programmi

<!--
Il percorso didattico si è sviluppato in 5 incontri di 2 ore ciascuno.

Nel primo incontro abbiamo affrontato la distinzione tra espressione e valutazione attraverso la notazione infissa, gli alberi e le liste.

Nel secondo e terzo incontro ci siamo concentrati sulle forme condizionali e sulla ricorsione su liste, abituando i ragazzi a identificare rigorosamente caso base e passo ricorsivo con predicati come `lista-di-atomi?`.

Negli ultimi due incontri, infine, abbiamo trasferito questo impianto concettuale ai numeri naturali, ricostruendo induttivamente l'aritmetica di base e dando un significato semantico profondo alle procedure scritte.

-->

---
layout: itadinfo
---

## Incontro 1: espressioni aritmetiche e valutazione

### Modello di calcolo per sostituzione e ordine di valutazione

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
Il primo passo fondamentale è comprendere il modello di calcolo per sostituzione.

Osserviamo l'espressione classica 1 più 2 per 3. [click]
L'esecutore automatico applica le regole di precedenza identificando la prima sotto-espressione da valutare: 2 per 3. [click]
Questa viene sostituita dal suo valore, 6, ottenendo la nuova espressione 1 più 6. [click]
Successivamente si individua l'operazione rimanente, [click]
fino ad arrivare al valore finale stazionario 7.

Questo esercizio abitua gli studenti a percepire la computazione non come un atto magico, ma come una sequenza deterministica e meccanica di riscritture a catena.

-->

---
layout: itadinfo
clicks: 6
hideInToc: true
---

## Incontro 1: dalle espressioni aritmetiche alla notazione prefissa

### Rappresentazioni _isomorfe_
<ExpressionMorph :click="$clicks" />

<!--
Nel primo incontro si vuole fornire il concetto di espressione simbolica, partendo dalle espressioni aritmetiche, derivando la notazione prefissa. Per enfatizzare il concetto che la notazione deve essere non ambigua si sono usati varie rappresentazioni diverse, tutte aventi la stessa informazione.

Partiamo dall'espressione infissa completamente parentesizzata, così non abbiamo ambiguità sull'ordine delle operazioni: `(1 + (2 · 3))`. [click]
Sollevando gli operatori facciamo emergere la gerarchia sintattica sugli operandi. [click]
Passiamo al Cerchio di Valutazione del Bootstrap World, in cui l'operatore domina dall'alto i propri settori. [click]
Evolviamo poi verso l'Albero Sintattico Astratto classico e [click] la struttura ad albero a nodi di derivazione SICP, dove il primo figlio è l'operatore. [click]
Giungiamo così alla rappresentazione con liste concatenate. [click]
Infine, serializzando la lista, otteniamo la notazione prefissa Scheme `(+ 1 (* 2 3))`.

Gli studenti comprendono che le parentesi in Scheme non servono a stabilire priorità, ma a delimitare fisicamente i confini della struttura dati e, succesivamente, a denotare l'applicazione di un operatore ai suoi argomenti.

-->

---
layout: itadinfo
hideInToc: true
---

## Incontro 1: mediatori iconici e/o rappresentazioni
### Molteplici linguaggi scritto/grafici per distinguere espressione e valutazione

<div class="grid grid-cols-2 gap-4 mt-2">
  <div class="bg-white p-2.5 rounded-xl border border-slate-200 shadow-sm flex flex-col items-center">
    <div class="text-xs font-bold text-slate-800 mb-1">Scrittura prefissa (s-exp)</div>
    <div class="h-16 flex items-center justify-center">
      <img src="/assets/img/s-exp.svg" class="h-10 object-contain" alt="Espressione prefissa" />
    </div>
    <div class="text-[11px] text-slate-500 mt-1">Operatore anteposto agli argomenti</div>
  </div>

  <div class="bg-white p-2.5 rounded-xl border border-slate-200 shadow-sm flex flex-col items-center">
    <div class="text-xs font-bold text-slate-800 mb-1">Struttura a lista</div>
    <div class="h-16 flex items-center justify-center">
      <img src="/assets/img/lista.svg" class="h-12 object-contain" alt="Struttura a lista" />
    </div>
    <div class="text-[11px] text-slate-500 mt-1">Coppie di puntatori primo/resto</div>
  </div>

  <div class="bg-white p-2.5 rounded-xl border border-slate-200 shadow-sm flex flex-col items-center">
    <div class="text-xs font-bold text-slate-800 mb-1">Albero sintattico</div>
    <div class="h-18 flex items-center justify-center">
      <img src="/assets/img/albero.svg" class="h-16 object-contain" alt="Albero sintattico" />
    </div>
    <div class="text-[11px] text-slate-500 mt-1">Gerarchia di rami dall'operatore</div>
  </div>

  <div class="bg-white p-2.5 rounded-xl border border-slate-200 shadow-sm flex flex-col items-center">
    <div class="text-xs font-bold text-slate-800 mb-1">Cerchio di valutazione</div>
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
I quattro mediatori iconici utilizzati per l'espressione `(+ 1 2)` sono qui riassunti: la scrittura prefissa S-expression, la struttura a lista con selettori `primo` e `resto`, l'albero sintattico e il cerchio di valutazione.

Ciascun mediatore offre un punto di vista complementare per separare l'espressione formale dal processo di valutazione.

A queste quattro rappresentazioni simbolico-grafiche affianchiamo il supporto manipolativo dei numeri in colore, per rendere tangibile come le operazioni algebriche possano essere processi espressi, anche nel modo delle cose, con poche istruzioni primitive. I regoli permettono di realizzare fisicamente il processo di scomposizioni, composizioni e operazioni differite con il quale ri-fonderemo l'aritmetica.

-->

---
layout: itadinfo-logo-sx
hideInToc: true
clicks: 7
---

## Regole di valutazione

- I valori dei numerali sono i numeri da essi rappresentati;
- i valori degli operatori sono le sequenze di istruzioni che eseguono le corrispondenti operazioni;

Per valutare una espressione:

1. Valutare le sottoespressioni.
2. Applicare la procedura risultante dalla valutazione della sottoespressione più a sinistra (l'operatore) agli argomenti ottenuti dalla valutazione delle altre sottoespressioni (gli operandi).

<EvalutationMorph :click="$clicks" />

<!--
Tornando ai sistemi formali, le regole universali di valutazione di Scheme sono estremamente essenziali: il valore dei numerali è il numero corrispondente, quello degli operatori è nelle sequenze di istruzioni primitive e quello deii nomi è associato nell'ambiente.

Per valutare una espressione con parentesi generica, l'esecutore segue due soli passi:
Primo, valuta ricorsivamente tutte le sotto-espressioni;
Secondo, applica la procedura ottenuta dalla sotto-espressione più a sinistra agli argomenti risultanti dalle altre.

[click ... avanzi nei passi dell'animazione]
Osserviamo come le chiamate annidate vengano ridotte gradualmente fino ad ottenere il valore finale.

-->

---
layout: itadinfo
---

## Incontro 2: primitive linguistiche e ricorsione

### Termini

- *variabile*
- *creazione di procedura*
- *applicazione di procedura*

### Forme sintattiche e loro semantica

- `define`, `cond` e `lambda`

### Primitive per la manipolazione di liste e s-exp

- **Costante terminale:** `lista-vuota`
- **Costanti logiche:** `#f`, `#t`
- **Predicati di tipo:** `atomo?`, `lista?`, `lista-vuota?`, `uguale?`
- **Selettori e costruttori:** `primo`, `resto`, `anteponi`, `lista`

<!--
Nel secondo incontro formalizziamo il lessico minimale del linguaggio.

Distinguiamo con precisione i tre concetti chiave: variabile, creazione di procedura tramite `lambda` e applicazione della procedura agli argomenti.

Forniamo quindi agli studenti un insieme volutamente ridotto di primitive: la costante terminale `lista-vuota`, i valori booleani, i predicati di tipo come `atomo?` e `lista-vuota?`, e gli operatori fondamentali di scomposizione e costruzione: `primo`, `resto` e `anteponi`.
`lista` è stato introdotto solo per non dover aggiungere `quote` nella valutazione degli esempi.

L'obiettivo pedagogico è mostrare che non servono decine di funzioni predefinite: qualsiasi computazione complessa può essere eretta su questi pochi mattoni fondamentali.

-->

---
layout: itadinfo-two-cols
---

## Incontro 3: struttura ricorsiva di espressioni e predicati

#### Caso base e passo induttivo

#### [Lunghezza](https://gionatamassibenincasa.github.io/process-visualizer/#BQEwpgZglgdlDOBjKACANgVxgcwBZgC8CBDAKBRWDWIFsAjEYyteAFwEpyLLEB7GEF26UqCVsQC0ANwy9xAfnRt2KAAydhFYMTSsATlBpgYrVMADUKAIzMseQiUp6wbXko7tPX0j6p38RExoYpIycsScfjgBjqJsTKrWKABMnkA)
```scheme
(define lunghezza
  (lambda (lst)
    (cond
      [(lista-vuota? lst) 0]
      [else (+ 1 (lunghezza (resto lst)))])))
```
#### [Lista di atomi](https://gionatamassibenincasa.github.io/process-visualizer/#BQEwpgZglgdlDOBjKACANggLgQwLQil20wHsBbKAfgCgUVg1syAjEbeteTASlrvsQkYIPv3oMseAG4BXEjkrou3FAGIeo-sGDFyJRcAAOAJyhkSSniolc8BIqQoHjYLhc5XeYujrSZTZGAwmKiqENwRvNQ2OPiEuk7okriy8ti8MXbxjlQckigADCgAjCgATBHRGLZxDuS5mXm2hSUqFdxAA)
```scheme
(define lista-di-atomi?
  (lambda (lst)
    (cond
      [(lista-vuota? lst) #t]
      [(atomo? (primo lst)) (lista-di-atomi? (resto lst))]
      [else #f])))
```

::right::

<br><br><br>

#### [Pari](https://gionatamassibenincasa.github.io/process-visualizer/#BQEwpgZglgdlDOBjKACADgQwE5QPwCgUVgAbDAWwCMQNiYBKQo4xAexhCeeOAC8wsrXCgYoAxABdG3IsD4ChxNCPr1xEaTOAYSEnOTAwJqYJhzDgAWhEoATKoeN8p7HhQAGRi-MoAjF7M3eyA)
```scheme
(define pari?
  (lambda (n)
    (cond
      [(= n 0) #t]
      [(= n 1) #f]
      [else (pari? (- n 2))])))
```

<!--
Nel terzo incontro guidiamo gli studenti nella scrittura delle prime procedure ricorsive su liste e numeri, strutturate sempre con la forma `cond`.

Prendiamo ad esempio la funzione `lunghezza`: il caso base controlla se la lista è vuota restituendo `0`; altrimenti aggiunge `1` al calcolo ricorsivo sul `resto` della lista.

Nel secondo esempio, `lista-di-atomi?`, verifichiamo la ricorsione su predicati booleani.

Infine, con la procedura `pari?`, mostriamo come la ricorsione si applichi naturalmente ai numeri sottraendo `2` a ogni passo.

Attraverso riscritture alla lavagna gli studenti osservano la catena di chiamate espandersi e poi contrarsi, cogliendo la perfetta corrispondenza tra la struttura del dato e la struttura del codice.

-->

---
layout: itadinfo
---

## Incontro 4: aritmetica ricorsiva

<div class="grid grid-cols-12 gap-5 mt-1 items-start">
<div class="col-span-7">

### Primitive sui naturali

- `zero?` : verifica del caso base ($n = 0$)
- `s` : funzione successore unitario ($n + 1$)
- `p` : funzione predecessore unitario ($n - 1$)

### Costruzione ricorsiva dell'[addizione](https://gionatamassibenincasa.github.io/process-visualizer/#NwAghgtgRglgpgOwC5wFwgjBMIHsC0CArhHAE4yFhJFlgA2MAUABQAmcAZljAM4DGMcGzYwAXjFwI4TECBb1IUNmHkIMASllz5-KW2075LMeVwB+TSARajclgyQVSyIS17ywI8ZOnX5AA6aGiGhTKxeohJScCAAzCAATBpAA)
#### Tre livelli isomorfi per apprendere come calcolare (addizione 3 2)

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
Giunti al quarto incontro, trasferiamo la ricorsione all'aritmetica in un formalismo vicino a quello di Peano anche se non forniamo esplicitamente una definizione induttiva di numero naturale né un predicato di tipo.

Dimentichiamo le tabelline e gli algoritmi in colonna: definiamo sui naturali con tre sole primitive: la verifica dello zero `zero?`, il successore `s` ed il predecessore `p`.

Definiamo quindi l'addizione in Scheme: se il secondo addendo $b$ è zero, il risultato è $a$; altrimenti calcoliamo il successore dell'addizione tra $a$ e il predecessore di $b$.

Sui tre livelli isomorfi — i "numeri in colore" sul piano manipolativo, la riscrittura simbolica e il grafico dei successori sospesi — gli studenti vedono che per calcolare `(addizione 3 2)`, la procedura decrementa $b$ accumulando chiamate a `s`, per poi contrarle al raggiungimento dello zero.

Analogamente vengono fatte costruire le altre operazioni: sottrazione, moltiplicazione, elevamento a potenze, tetrazione.

-->

---
layout: itadinfo-logo-dx
---

## Incontro 5: l'operazione misteriosa

<div class="grid grid-cols-12 gap-5 mt-1 items-start">
<div class="col-span-7">

### Analisi semantica di un listato oscurato

- **Strategia didattica:** presentazione con nome oscurato `operazione-misteriosa`
- **Compito richiesto:** simulazione mentale di `(operazione-misteriosa 12 4)`

## Riscoperta della [divisione euclidea](https://gionatamassibenincasa.github.io/process-visualizer/#NwAghgtgRglgpgOwC5wFwgWJBaMATPbAZwHscIYEAoKgCjzgDNKYiBjGEARwFcSAveMjhUQIWgBtIUPGHEIQEAJSix4tiQR5Va8bQA8GRUpAAGFbrG0wEpACcYEREk60i43gKEpx2I8uMlIKCaWk9BZzgQAEYAJhAAFiUgA)
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
L'ultimo incontro rappresenta il culmine del percorso semantico. Presentiamo agli studenti un codice oscurato denominato `operazione-misteriosa`.

Chiediamo loro di vestire i panni dell'esecutore e simulare mentalmente l'esecuzione di `(operazione-misteriosa 12 4)`.

Attraverso la tracciatura dei passi, gli studenti dovrebbero "riscoprire" autonomamente la divisione euclidea intesa come sottrazione ripetuta.

Nel codice della procedura `quoziente`, se il dividendo è minore del divisore il quoziente è `0`; altrimenti sommiamo `1` al quoziente tra la differenza e il divisore.

Con i regoli la comprensione è facilitata: la composizione di barre lunga 12 viene coperta esattamente da 3 regoli da 4. Gli studenti passano così dal subire una regola aritmetica passiva al comprenderne la struttura algoritmica profonda.

-->

---
layout: itadinfo
---

# Risultati didattici e valore formativo

## Competenze concettuali e metacognitive

- **Esecuzione vs interpretazione:** gli studenti imparano a leggere i programmi come oggetti di studio e a predire i risultati
- **Lessico disciplinare rigoroso:** assimilazione consapevole dei termini *espressione*, *procedura*, *caso base*, *argomento*, *parametro*
- **Evoluzione cognitiva:** la ricorsione, da iniziale "artificio sintattico", diventa **metodo generale di risoluzione dei problemi**

## Impatto pedagogico

- Fattibilità nel primo biennio di un'Informatica **fortemente disciplinare**, capace di promuovere il ragionamento **formalmente corretto**.

<!--
I risultati didattici, sebbene non raccolti formalmente, confermano l'efficacia dell'approccio.

Gli studenti distinguono l'esecuzione dall'interpretazione, sanno leggere il codice come oggetto di indagine e predicono con gli esiti delle computazioni.

Hanno assimilato un lessico disciplinare rigoroso — distinguendo argomenti, parametri, espressioni e procedure — e hanno trasformato la ricorsione da artificio sintattico a metodo generale di risoluzione dei problemi.

In sintesi, l'esperienza dimostra la piena fattibilità, già nel primo biennio liceale, di un'informatica fortemente disciplinare, capace di stimolare l'astrazione, il pensiero critico e forme di ragionamento corretto.

-->

---
layout: itadinfo
---

## Limiti riscontrati e proposte di sviluppo
### Complessità e vincoli temporali

- **Soglia d'ingresso sintattica:** la notazione prefissa richiede un orientamento iniziale non banale
- **Disparità nei tempi di assimilazione:** 10 ore permettono di costruire intuizioni robuste ma non di consolidarle in modo omogeneo per l'intera classe

## Proposte per le edizioni future
### Consolidamento e trasferibilità

- **Verifiche strutturate:** introduzione di prove ex-ante ed ex-post per quantificare l'efficacia formativa
- **Fase di trasferimento (transfer):** raccordo finale verso linguaggi testuali diffusi (es. Python) per mostrare la generalità dei concetti appresi

<!--
Non sono mancati i limiti operativi.

La notazione prefissa rappresenta una soglia d'ingresso iniziale che richiede tempo per essere assimilata. Inoltre, in sole 10 ore complessive, le intuizioni costruite sono state solide ma disomogenee nei tempi di assimilazione tra gli studenti.

Per le edizioni future proponiamo due miglioramenti:

In primo luogo, l'introduzione di test di verifica ex-ante ed ex-post strutturati per quantificare in modo oggettivo il valore formativo di questa proposta didattica.

In secondo luogo, una fase finale di "transfer" tecnologico verso linguaggi diffusi come Python, dimostrando che la forma mentis ricorsiva acquisita è del tutto indipendente dal linguaggio utilizzato.
-->

---
layout: itadinfo
---

## Conclusioni
### L'informatica come disciplina formativa

- **Rifiuto del riduzionismo pratico:** no all'Informatica intesa come mero addestramento all'uso di applicativi o software commerciali
- **L'aritmetica ricorsiva come "nuovo latino":** una palestra logica disinteressata, rigorosa ed essenziale per il Liceo Matematico
- **Intuzione della nozione di algoritmo:** il passaggio dal "saper fare" esecutivo al "saper far fare" formale offre agli studenti gli strumenti per comprendere davvero le strutture del calcolo

### Altri _Giochi di numeri_

- Soddisfacibilità: criptoaritmetica, quadrati magici, sudoku...
- Ottimizzazione discreta: zaino, assegnamento, trasporto...

<!--
In conclusione, questo percorso riafferma l'Informatica come disciplina formativa e culturale autonoma, rifiutando ogni riduzionismo pratico o addestramento all'uso di software commerciali.

L'aritmetica ricorsiva dovrebbe funzionare come un "nuovo latino": una palestra di rigore logico disinteressato perfetta per il Liceo Matematico, capace di guidare i ragazzi dal "saper fare" al "saper far fare".

La proposta iniziale, oltre al percorso che ho concluso di illustrare, prevedeva futuri "giochi di numeri": dai problemi che richiedono di trovare soluzioni ammissibili in uno spazio vincolato, come la criptoaritmetica, fino all'ottimizzazione discreta. Al momento sono solo idee in attesa di realizzazione.

-->

---

<RetroFrontespizio
  titolo='Giochi di Numeri'
  sottotitolo="Dall'aritmetica al pensiero ricorsivo"
  :autori="[
  {
    nome: 'Gionata Massi',
    affiliazione: 'IIS &quot;Savoia Benincasa&quot;',
    citta: 'Ancona',
    presentatore: true,
  },
  {
    nome: 'Alberto Cesaretti e Pamela Sanchini',
    affiliazione: 'Liceo Scientifico e Musicale &quot;Einstein&quot;',
    citta: 'Rimini',
    presentatore: false,
  },
]"
/>

<!--
Vi ringrazio molto per l'attenzione.
Sono ora a vostra disposizione per domande, curiosità o approfondimenti su questa esperienza.

-->
