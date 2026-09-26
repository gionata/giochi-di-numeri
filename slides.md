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

# Constesto, obiettivi, scelte metodologiche e strumenti

## Contesto
### Quadro istituzionale e _target_
<!-- ### Il progetto PNRR e il gruppo classe -->

- Progetto PNRR (DM 65/2023) *"Citizen scientists of the future"* su discipline STEM
- IIS "Savoia Benincasa" di Ancona, 15 studenti del primo biennio del **Liceo Matematico**
- Prerequisiti familiarità con aritmetica e ordine delle operazioni
- Nessuna competenza pregressa di programmazione richiesta

<v-click>

### Bisogni formativi da soddifare
<!-- ### Dal calcolo meccanico alla consapevolezza formale -->

- **Dicotomia tra prassi esecutiva e comprensione**
  - gli studenti usano procedure aritmetiche meccaniche ("saper fare") ma non sanno **descriverle come processi per un esecutore automatico**.
- **Apprendimento: meccanivo vs significativo**
  - la pura memorizzazione non lascia traccia duratura: quasi nessuno studente ricorda il significato della **divisione euclidea** (intera).

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

## Obiettivi generali e visione pedagogica

### Dal "saper fare" al "saper far fare"

- **Formalizzazione algoritmica:** rendere esplicito il processo di riscrittura
- **Modello di esecutore:** distinguere rigorosamente espressione e valutazione
- **Struttura concettuale:** costruire una forma mentis fondata sulla *ricorsione strutturale*
- **Sistemi formali:** eliminare ogni ambiguità sintattica e semantica

<div v-click.at="1">

### Un linguaggio rigoroso

</div>

<v-switch>

<template #1>

- Quale linguaggio di programmazione adottare?
  - <input type="checkbox" disabled /> Python
  - <input type="checkbox" disabled /> JavaScript
  - <input type="checkbox" disabled /> Prolog
  - <input type="checkbox" disabled /> Scheme (Lisp)

</template>

<template #2>

<br/> 

> In questo periodo infatti lo studio... deve essere (o apparire ai discenti) disinteressato, non avere cioè scopi pratici immediati... deve essere formativo, anche se 'istruttivo', cioè ricco di nozioni concrete.
>
> — A. Gramsci, *Quaderno 12*

</template>

<template #3>

- Quale linguaggio di programmazione adottare?
  - <input type="checkbox" disabled /> Python
  - <input type="checkbox" disabled /> JavaScript
  - <input type="checkbox" disabled /> Prolog
  - <input type="checkbox" checked disabled /> **Scheme** con ambiente iniziale personalizzato

</template>

</v-switch>

<!--
Gli obiettivi di alto livello sono:
1. Imparare un modo di pensare generale che toglie i dettagli e fornisce uno schema per risolvere classi di problemi.
2. Formalizzare le idee mediante un linguaggio testuale con regole rigide di interpretazione per poterci ragionare sopra.
3. Comprendere la necessità di un esecutore meccanico e saperlo simulare.

Gramsci sottolinea l'importanza di una scuola "disinteressata", non precocemente professionalizzante. Allo stesso modo, l'informatica nel Liceo non deve essere addestramento all'uso di software commerciali, ma studio formale dei processi di pensiero.

Tra le varie opzioni, ho scelto Scheme, un dialetto Lisp nato per la didattica della struttura e dell'interpretazione dei programmi, con una teoria sul come la mente costruisce i pensieri.

Tra vari linguaggi, ho scelto Scheme e, per avere "primitive" con nomi mnemonici e significativi, ho modificato l'ambiente iniziale (globale).
-->

---
layout: itadinfo
---

## Obiettivi didattici specifici (proposta CINI)

### Traguardi di competenza
<!-- ### Modellizzazione e pensiero algoritmico -->

- **T-S-1:** comprende la necessità di fare riferimento a un esecutore automatico per esprimere algoritmi in modo non ambiguo
- **T-S-2:** riconosce che un algoritmo risolve un problema nella sua generalità
- **T-S-3:** giustifica la correttezza di un algoritmo rispetto a tale generalità
- **T-S-6:** definisce, realizza e valida programmi che modellano processi familiari

### Obiettivi di apprendimento operativi
<!-- ### Previsione e programmazione -->

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

## Metodologia e mediatori

### Metodologia didattica
<!-- ### Risoluzione guidata e imitazione di schemi -->

- **Metodo dialogato:** domande e risposte su concetti e problemi
- **Esercizio formale e disciplinato:** fasi di apprendimento per imitazione e ripetizione alternate da esercizi e riflessioni

### Riferimenti teorici e storici
<!-- ### Ispirazioni pedagogiche -->

- **Dan Friedman (*The Little Schemer*):** emergenza della ricorsione per ripetizione e schemi comuni
- **Abelson & Sussman (*SICP*) e Felleisen et al. (*HtDP*):** scomposizione strutturale del dato, rappresentazioni
- **Georges Cuisenaire:** l'aritmetica manipolativa dei "numeri in colore"
- **Giovanni Bosco:** *L’aritmetica ed il sistema metrico portati a semplicità per le classi elementari col confronto dei prezzi e delle misure antiche d’Italia in metrico-decimale*. 1881

<!--
Invece di calare la ricorsione come regola astratta, l'abbiamo fatta emergere per imitazione e ripetizione: gli studenti osservano procedure scritte, ne discutono la struttura e la riproducono su problemi nuovi.

Questo approccio metodico e disciplinato trova un riscontro nell'idea gramsciana per cui la maturazione dell'astrazione passa attraverso l'esercizio costante e la padronanza delle forme.
-->

---
layout: itadinfo
---

## Sottoinsieme Scheme e ambiente di valutazione

### Essenzialità sintattica: tre forme fondamentali

- **`define`:** associazione tra nomi e valori
- **`lambda`:** astrazione funzionale
- **`cond`:** espressione condizionale multi-ramo

Nessun costrutto imperativo accessorio (cicli `for`/`while`, assegnamento di variabili): l'attenzione resta interamente focalizzata sulla struttura dei dati e delle funzioni.

### Ambienti di sviluppo e visualizzazione
<!-- ### Accessibilità web senza installazione -->

- **[WeScheme](https://wescheme.org):** interprete didattico eseguibile direttamente nel browser
- **[ProcessVisualizer](https://gionatamassibenincasa.github.io/process-visualizer):** simulatore dei passi di riduzione per l'esecutore automatico

<!--
WeScheme offre un ambiente accessibile che non richiede installazione. Scheme permette di costruire una forma mentis ricorsiva (la procedura ricalca la struttura induttiva del dato) senza la complessità sintattica dei linguaggi imperativi commerciali.

Come rimarcato da Gramsci, la sostituzione dei percorsi classici richiede materie capaci di dare un risultato equivalente di formazione generale: Scheme garantisce questo rigore logico-formale.
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
- **Incontri 4 e 5: Procedure ricorsive sui numeri naturali**:
  - Applicazione del principio di induzione per la (ri-)costruzione dell'aritmetica

<!--
Nei primi tre incontri il lavoro parte dalla distinzione tra espressione e valutazione per poi approdare alla manipolazione ricorsiva delle liste. Negli ultimi due abbiamo giocato con i numeri!
-->

---
layout: itadinfo
---

## Incontro 1: espressioni aritmetiche e valutazione

### Modello di calcolo per sostituzione e ordine di valutazione
<!-- ### Riduzione meccanica di un'espressione aritmetica -->

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
clicks: 6
---

## Incontro 1: dalle espressioni aritmetiche alla notazione prefissa

### Rappresentazioni _isomorfe_
<!-- ### Da (1 + (2 · 3)) a (+ 1 (· 2 3)) attraverso sette stadi -->

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

## Incontro 1: mediatori iconici e/o rappresentazioni

<!-- ## Trasposizioni visive dell'espressione (+ 1 2) -->
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
I quattro mediatori iconici consentono agli studenti di visualizzare la stessa struttura sintattica da prospettive complementari: simbolica, strutturale, ad albero e a contenitore geometrico.
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
- **Selettori e costruttore:** `primo`, `resto`, `anteponi`

---
layout: itadinfo
---

### Incontro 3: Struttura ricorsiva delle espressioni e predicati di verifica

#### Caso base e passo induttivo

```scheme
(define lista-di-atomi?
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

## Incontro 4: aritmetica ricorsiva e assiomi di Peano

<div class="grid grid-cols-12 gap-5 mt-1 items-start">
<div class="col-span-7">

### Primitive sui naturali
<!-- ### Il sistema computazionale di Peano -->

- `zero?` : verifica del caso base ($n = 0$)
- `s` : funzione successore unitario ($n + 1$)
- `p` : funzione predecessore unitario ($n - 1$)

### Costruzione ricorsiva dell'addizione
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
Invece di usare tabelline o algoritmi in colonna, l'addizione viene definita unicamente tramite incremento/decremento unitario.
Per calcolare (addizione 3 2), la procedura riduce il secondo argomento b verso 0, accumulando chiamate della funzione successore 's'. Raggiunto il caso base zero?, la catena di successori sospesi si contrae fornendo il risultato.
I numeri in colore (regoli Cuisenaire) rendono tangibile la manipolazione e l'equivalenza numerica.
-->

---
layout: itadinfo
---

## Incontro 5: l'operazione misteriosa

<div class="grid grid-cols-12 gap-5 mt-1 items-start">
<div class="col-span-7">

<!-- ## Introduzione euristica -->
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

<!-- ## Evidenze di apprendimento -->
## Competenze concettuali e metacognitive

- **Esecuzione vs interpretazione:** gli studenti imparano a leggere i programmi come oggetti di studio e a predire i risultati
- **Lessico disciplinare rigoroso:** assimilazione consapevole dei termini *espressione*, *procedura*, *caso base*, *argomento*, *parametro*
- **Evoluzione cognitiva:** la ricorsione, da iniziale "artificio sintattico", diventa **metodo generale di scomposizione dei problemi**

## Impatto pedagogico
<!-- ### Una disciplina formativa per la scuola secondaria -->

> Dimostrata la fattibilità nel primo biennio di un'Informatica fortemente disciplinare, capace di promuovere il pensiero critico.

<!--
L'esperienza ha confermato che anche nel primo biennio è possibile superare l'approccio puramente nozionistico o addestrativo.
In perfetto accordo con l'impostazione gramsciana, lo studio metodico di un sistema formale rigido sviluppa capacità di astrazione, precisione concettuale e consapevolezza dei processi logici.
-->

---
layout: itadinfo
---

## Limiti riscontrati e proposte di sviluppo

<!-- ## Limiti emersi -->
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

## Conclusioni

<!-- ## Sintesi dell'esperienza -->
### L'informatica come disciplina formativa

- **Rifiuto del riduzionismo pratico:** no all'Informatica intesa come mero addestramento all'uso di applicativi o software commerciali
- **L'aritmetica ricorsiva come "nuovo latino":** una palestra logica disinteressata, rigorosa ed essenziale per il Liceo Matematico
- **Ritorno alla consapevolezza:** il passaggio dal "saper fare" esecutivo al "saper far fare" formale offre agli studenti gli strumenti per comprendere davvero le strutture del calcolo

<!--
In conclusione, l'esperienza dimostra che l'Informatica, se insegnata attraverso le sue basi teoriche e formali, risponde appieno alla funzione educativa e culturale delineata da Gramsci per la scuola secondaria: formare menti capaci di astrarre, analizzare e ragionare in modo autonomo e consapevole.
-->

---

<RetroFrontespizio />
