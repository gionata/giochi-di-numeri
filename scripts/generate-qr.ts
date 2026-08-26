import { writeFileSync } from "node:fs"
import { resolve, dirname } from "node:path"
import { fileURLToPath } from "node:url"
import { renderSVG } from "uqr"

const __dirname = dirname(fileURLToPath(import.meta.url))
const targetUrl = process.argv[2] || "https://gionata.github.io/giochi-di-numeri/"
const outputPath = resolve(__dirname, "../assets/qr.svg")

const svg = renderSVG(targetUrl, {
  ecc: "M",
  border: 1,
  whiteColor: "transparent",
  blackColor: "#000000",
})

writeFileSync(outputPath, svg, "utf-8")
console.log(`✓ QR Code SVG generated for: ${targetUrl}`)
console.log(`✓ Saved to: ${outputPath}`)
