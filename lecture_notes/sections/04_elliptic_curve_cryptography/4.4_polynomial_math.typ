#import "../../utils.typ": *

== Polynomial Arithmetic over Finite Fields

=== Theory

#definition("Finite Field GF(p^n)")[
  A *finite field* (or Galois Field) with $p^n$ elements, denoted $"GF"(p^n)$ or $FF_(p^n)$, consists of polynomial classes over $"GF"(p)$ modulo an irreducible polynomial $P(x)$ of degree $n$.
  Elements are polynomials $a_{n-1}x^(n-1) + ... + a_1 x + a_0$ where $a_i in ZZ_p$.
]

#definition("Irreducible Polynomial")[
  A polynomial $P(x)$ is *irreducible* over a field $K$ if it cannot be factored into two non-constant polynomials over $K$. It plays the role of a prime number for polynomial arithmetic.
]

#theorem("Field Arithmetic")[
  - *Addition*: Performed coefficient-wise in $ZZ_p$. (For $p=2$, this is XOR).
  - *Multiplication*: Polynomial multiplication modulo $P(x)$.
]

=== Solved Problems

#solved_problem[
  In $"GF"(2^3)$ represented by polynomials modulo $P(x) = x^3 + x + 1$, compute the sum of $(x^2 + 1)$ and $(x^2 + x)$.
]
#solution[
  Coefficients are in $ZZ_2$ (binary).
  $(x^2 + 1) + (x^2 + x) = (1+1)x^2 + (0+1)x + (1+0)$
  $ = 0x^2 + x + 1 = x + 1 $
  (Note: $1+1=0$ in $ZZ_2$).
]

#solved_problem[
  Multiply $x$ by $(x^2 + 1)$ in $"GF"(2^3)$ with $P(x) = x^3 + x + 1$.
]
#solution[
  $ x(x^2 + 1) = x^3 + x $.
  Since $x^3 equiv x + 1 (mod x^3 + x + 1)$ (because $x^3 + x + 1 = 0 => x^3 = -x - 1 = x + 1$ over $ZZ_2$),
  $ x^3 + x = (x + 1) + x = 2x + 1 = 1 $.
  So the result is $1$.
]

=== Supplementary Problems

#supplementary[
  List all irreducible polynomials of degree 2 over $ZZ_2$.
]

#supplementary[
  Construct the multiplication table for $"GF"(2^2)$ using the irreducible polynomial $x^2 + x + 1$.
]
