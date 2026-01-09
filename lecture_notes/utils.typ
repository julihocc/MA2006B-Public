#import "@preview/ctheorems:1.1.3": *

// Initialize the counters and rules. This function must be called in a show rule in main.typ
// #show: thmrules

// Definitions
#let definition = thmbox("definition", "Definition", fill: rgb("#e6f3ff"), stroke: rgb("#0000ff") + 1pt)

// Theorems
#let theorem = thmbox("theorem", "Theorem", fill: rgb("#ffe6e6"), stroke: rgb("#ff0000") + 1pt)

// Propositions
#let proposition = thmbox("proposition", "Proposition", fill: rgb("#e6ffe6"), stroke: rgb("#008800") + 1pt)

// Corollaries
#let corollary = thmbox("corollary", "Corollary", fill: rgb("#fff2e6"), stroke: rgb("#ff8800") + 1pt, base: "theorem")

// Examples
#let example = thmplain("example", "Example").with(numbering: none)

// Proofs
#let proof = thmproof("proof", "Proof")

// Solutions
#let solution = thmbox("solution", "Solution", fill: luma(240), inset: 8pt, radius: 4pt).with(numbering: none)
