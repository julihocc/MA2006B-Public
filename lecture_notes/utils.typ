#import "@preview/ctheorems:1.1.3": *

// Initialize the counters and rules. This function must be called in a show rule in main.typ
// #show: thmrules

// Definitions
#let definition = thmbox("definition", "Definition", fill: luma(245), stroke: luma(80) + 1pt)

// Theorems
#let theorem = thmbox("theorem", "Theorem", fill: luma(240), stroke: luma(0) + 1pt)

// Propositions
#let proposition = thmbox("proposition", "Proposition", fill: luma(250), stroke: luma(100) + 1pt)

// Corollaries
#let corollary = thmbox("corollary", "Corollary", fill: luma(250), stroke: luma(120) + 1pt, base: "theorem")

// Examples
#let example = thmplain("example", "Example").with(numbering: none)

// Proofs
#let proof = thmproof("proof", "Proof")

// Solutions
#let solution = thmbox("solution", "Solution", fill: luma(240), inset: 8pt, radius: 4pt).with(numbering: none)
