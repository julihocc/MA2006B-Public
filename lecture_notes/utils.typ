#let solution(content) = block(
  fill: luma(240),
  inset: 8pt,
  radius: 4pt,
  width: 100%,
  [*Solution:* \ #content],
)

#let proof(content) = block(
  width: 100%,
  inset: (left: 1em),
  above: 0.6em,
  below: 1em,
  [_Proof._ #content #h(1fr) $square$],
)

#let definition(title: "Definition", content) = block(
  fill: rgb("#e8f4fd"),
  stroke: (left: 2pt + blue),
  inset: 8pt,
  radius: (right: 4pt),
  width: 100%,
  [*#title* \ #content],
)

#let theorem(title: "Theorem", content) = block(
  fill: rgb("#fff0e6"),
  stroke: (left: 2pt + orange),
  inset: 8pt,
  radius: (right: 4pt),
  width: 100%,
  [*#title* \ #content],
)

#let proposition(title: "Proposition", content) = block(
  fill: rgb("#f0fdf4"),
  stroke: (left: 2pt + green),
  inset: 8pt,
  radius: (right: 4pt),
  width: 100%,
  [*#title* \ #content],
)

#let corollary(title: "Corollary", content) = block(
  fill: rgb("#f5f5f5"),
  stroke: (left: 2pt + gray),
  inset: 8pt,
  radius: (right: 4pt),
  width: 100%,
  [*#title* \ #content],
)

#let example(content) = block(
  stroke: (left: 1pt + black),
  inset: (left: 1em),
  width: 100%,
  [*Example*: #content],
)
