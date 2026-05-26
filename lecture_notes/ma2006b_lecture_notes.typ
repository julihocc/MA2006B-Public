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

#v(1em)
#align(center)[
  #v(0.5em)
  *Author:* Dr. Juliho Castillo Colmenares, Ph.D. \
  *AI Assistance:* Google Gemini 3.0 Pro & ChatGPT-5.5 \
  #v(0.5em)
]

#import "utils.typ": *
#show: thmrules

#outline(indent: auto)
#pagebreak()

#include "sections/01_groups/01_main.typ"
#include "sections/02_rings/02_main.typ"
#include "sections/03_elliptic_curves/03_main.typ"
#include "sections/A_number_theory/A_main.typ"
#include "sections/B_matrix_theory/B_main.typ"
#include "sections/C_symmetric_groups/C_main.typ"
#include "sections/D_projective_geometry/D_main.typ"
#include "sections/E_polynomial_discriminants/E_main.typ"
