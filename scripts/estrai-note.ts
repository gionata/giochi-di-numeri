import { parse } from '@slidev/parser'

// 1. Leggi il file della presentazione
const file = Bun.file('slides.md')
const content = await file.text()

// 2. Parse del contenuto con il parser di Slidev
const slidevData = await parse(content)

// 3. Mappa le slide ed estrai titolo e note (`slide.note`)
const notes = slidevData.slides
  .map((slide, index) => {
    const noteText = slide.note?.trim()
    if (!noteText) return null

    // Recupera il titolo della slide se disponibile, altrimenti usa un fallback
    const slideTitle = slide.title ? `: ${slide.title}` : ''

    return `## Slide ${index + 1}${slideTitle}\n\n${noteText}`
  })
  .filter(Boolean)

// 4. Salva il file di testo
await Bun.write('notes.txt', notes.join('\n\n---\n\n'))

console.log(`Estratte le note da ${notes.length} slide in notes.txt!`)
