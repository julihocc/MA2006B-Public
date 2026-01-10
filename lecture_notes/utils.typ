#import "@preview/ctheorems:1.1.3": *

// Math sets
#let ZZ = $bb(Z)$
#let RR = $bb(R)$
#let QQ = $bb(Q)$
#let CC = $bb(C)$
#let NN = $bb(N)$

// Initialize the counters and rules. This function must be called in a show rule in main.typ
// #show: thmrules

// Definitions
#let definition = thmbox("definition", "Definition", fill: luma(245), stroke: luma(80) + 1pt, base: "heading")

// Theorems
#let theorem = thmbox("theorem", "Theorem", fill: luma(240), stroke: luma(0) + 1pt, base: "heading")

// Propositions
#let proposition = thmbox("proposition", "Proposition", fill: luma(250), stroke: luma(100) + 1pt, base: "heading")

// Corollaries
#let corollary = thmbox("corollary", "Corollary", fill: luma(250), stroke: luma(120) + 1pt, base: "heading")

// Examples (Keeping as alias or for minor inline examples if needed, but primary focus is Solved Problems)
#let example = thmplain("example", "Example", base: "heading").with(numbering: "1.1")

// Solved Problems (Schaum's Style)
#let solved_problem = thmbox(
  "solved_problem",
  "Problem",
  fill: rgb("e6f3ff"),
  inset: 8pt,
  radius: 4pt,
  stroke: rgb("0074d9") + 1pt,
  base: "heading",
)

// Supplementary Problems (Schaum's Style)
#let supplementary = thmbox(
  "supplementary",
  "Supplementary Problem",
  fill: rgb("fffde7"),
  inset: 8pt,
  radius: 4pt,
  stroke: rgb("fbc02d") + 1pt,
  base: "heading",
)

// Exercises (Keeping for backward compatibility or generic use)
#let exercise = thmbox("exercise", "Exercise", fill: luma(250), stroke: luma(150) + 1pt, base: "heading")

// Proofs
#let proof = thmproof("proof", "Proof")

// Solutions
#let solution = thmbox("solution", "Solution", fill: luma(250), inset: 8pt, radius: 4pt).with(numbering: none)
