#set page(
  paper: "us-letter",
  margin: 1in,
)
#set text(
  font: "New Computer Modern",
  size: 12pt,
)
#set heading(numbering: "1.1")

#align(center)[
  #text(1.5em, weight: "bold")[MA2006B - Modern Algebras for Security and Cryptography]

  #text(1.2em)[Lecture Notes]
  \ \
  Tecnológico de Monterrey
  \
  #datetime.today().display()
]

#import "utils.typ": solution, proof, definition, theorem, proposition, corollary, example, solution

#outline(indent: auto)
#pagebreak()

#include "sections/01_groups/01_main.typ"
#include "sections/02_rings/02_main.typ"
