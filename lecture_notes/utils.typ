#import "@preview/ctheorems:1.1.3": *

// Math sets
#let ZZ = $bb(Z)$
#let RR = $bb(R)$
#let QQ = $bb(Q)$
#let CC = $bb(C)$
#let NN = $bb(N)$
#let chevron = (l: [⟨], r: [⟩])

// Initialize the counters and rules. This function must be called in a show rule in main.typ
// #show: thmrules

// Definitions
#let definition = thmbox("definition", "Definition", fill: rgb("fff3e0"), stroke: rgb("e65100") + 1pt, base: "heading")

// Theorems
#let theorem = thmbox("theorem", "Theorem", fill: rgb("e8eaf6"), stroke: rgb("283593") + 1pt, base: "heading")

// Propositions
#let proposition = thmbox(
  "proposition",
  "Proposition",
  fill: rgb("fce4ec"),
  stroke: rgb("880e4f") + 1pt,
  base: "heading",
)

// Corollaries
#let corollary = thmbox("corollary", "Corollary", fill: rgb("e0f2f1"), stroke: rgb("00695c") + 1pt, base: "heading")

// Algorithms
#let algorithm = thmbox(
  "algorithm",
  "Algorithm",
  fill: rgb("f3e5f5"),
  stroke: rgb("6a1b9a") + 1pt,
  breakable: true,
  base: "heading",
)

// Examples
#let _example = thmplain("example", "Example", base: "heading").with(
  numbering: "1.1",
)

#let example(..args) = {
  block(
    breakable: true,
    fill: rgb("f5f5f5"),
    inset: 8pt,
    radius: 4pt,
    width: 100%,
    [
      #_example(..args)
    ],
  )
}

// Notes
#let note = thmbox("note", "Note", fill: rgb("e8f5e9"), stroke: rgb("2e7d32") + 1pt, base: "heading")

// Solved Problems (Schaum's Style)
#let solved_problem = thmbox(
  "solved_problem",
  "Solved Problem",
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
#let exercise = thmbox("exercise", "Exercise", fill: rgb("f3e5f5"), stroke: rgb("6a1b9a") + 1pt, base: "heading")

// Proofs
#let proof = thmproof("proof", "Proof")

// Solutions
#let solution = thmproof("solution", "Solution")

// Self-Evaluation Quiz
// Self-Evaluation Quiz
#let quiz-counter = counter("quiz-question")

#let quiz(body) = {
  set text(size: 0.95em)
  quiz-counter.update(0) // Reset counter for each quiz
  block(
    breakable: true,
    fill: rgb("e0f7fa"),
    inset: 16pt,
    radius: 4pt,
    stroke: rgb("00838f") + 0.8pt,
    width: 100%,
    [
      #text(weight: "bold", size: 1.2em, fill: rgb("006064"))[Self-Evaluation Quiz]
      #v(8pt)
      #body
    ],
  )
}

#let question(query, options, correct-idx) = {
  quiz-counter.step()
  pad(bottom: 12pt, [
    #context text(weight: "bold", fill: rgb("0d47a1"))[#quiz-counter.display(). ]
    *#query*
    #v(4pt)
    #for (i, opt) in options.enumerate() {
      let marker = if i == correct-idx { " (Correct)" } else { "" }
      // In a real interactive PDF we could hide the answer, but for static notes:
      text(style: "italic")[ #numbering("a)", i + 1) #opt ]
      h(2em)
    }
  ])
}
