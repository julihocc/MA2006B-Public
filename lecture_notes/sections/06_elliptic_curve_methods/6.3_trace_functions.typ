#import "../../utils.typ": *

== Funciones de rastreo

=== Theory

#definition("Field Trace")[
  The *trace* of an element $alpha in "GF"(q^n)$ to the subfield $"GF"(q)$ is defined as the sum of its distinct conjugates:
  $ "Tr"(alpha) = alpha + alpha^q + alpha^(q^2) + ... + alpha^(q^(n-1)) $
  distribution of values maps $"GF"(q^n)$ to $"GF"(q)$.
]

#definition("Trace of Frobenius")[
  For an elliptic curve $E$, the *trace of Frobenius* $t$ is related to the number of points by Hasse's Theorem:
  $ \#E("GF"(q)) = q + 1 - t $
  The integer $t$ is the trace of the Frobenius endomorphism $phi: (x, y) arrow.bar (x^q, y^q)$.
]

#theorem("Property of Trace")[
  The Trace function is a linear map:
  $ "Tr"(a alpha + b beta) = a "Tr"(alpha) + b "Tr"(beta) $
  for $a, b in "GF"(q)$.
  Also, $"Tr"(alpha^q) = "Tr"(alpha)$.
]

=== Solved Problems

#solved_problem[
  Calculate the Trace of $alpha = x$ in $"GF"(2^2)$ defined by $P(x) = x^2 + x + 1$ over $"GF"(2)$.
]
#solution[
  In $"GF"(2^2)$, $q=2, n=2$. $"Tr"(alpha) = alpha + alpha^2$.
  Since $alpha^2 + alpha + 1 = 0 => alpha^2 = alpha + 1$.
  $"Tr"(alpha) = alpha + (alpha + 1) = 2alpha + 1 = 1$.
  So the trace is $1$.
]

=== Supplementary Problems

#supplementary[
  Show that in characteristic 2, the equation $x^2 + x = c$ has a solution if and only if $"Tr"(c) = 0$.
]

#supplementary[
  How is the Trace of Frobenius used in Schoof's algorithm for point counting?
]
