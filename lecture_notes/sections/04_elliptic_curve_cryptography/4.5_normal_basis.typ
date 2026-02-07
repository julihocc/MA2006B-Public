#import "../../utils.typ": *

== Normal Basis Arithmetic

=== Theory

#definition("Normal Basis")[
  A *normal basis* of $"GF"(p^n)$ over $"GF"(p)$ is a basis of the form:
  $ N = {beta, beta^p, beta^(p^2), ..., beta^(p^(n-1))} $
  where $beta in "GF"(p^n)$.
]

#theorem("Squaring in Normal Basis")[
  In a normal basis representation over $"GF"(2^n)$, squaring an element is a simple *cyclic shift* of its coordinates.
  If $A = (a_0, a_1, ..., a_(n-1))$ represents $a_0 beta + a_1 beta^2 + ...$, then
  $ A^2 = (a_(n-1), a_0, a_1, ..., a_(n-2)) $

  #align(center)[
    #box(stroke: 1pt + gray, inset: 10pt, radius: 5pt)[
      *Cyclic Shift Operation:* \
      $(a_0, a_1, a_2) arrow.r^"Square" (a_2, a_0, a_1) arrow.r^"Square" (a_1, a_2, a_0)$
    ]
  ]
  This makes squaring extremely efficient in hardware.
]

=== Solved Problems

#solved_problem[
  Given a normal basis element $A = (1, 0, 1)$ in $"GF"(2^3)$, compute $A^2$ and $A^4$.
]
#solution[
  $A = (1, 0, 1)$ corresponds to coefficients for $beta, beta^2, beta^4$.
  Squaring is a right cyclic shift (or left depending on indexing convention, here assuming $A^2$ shifts right):
  $ A^2 = (1, 1, 0) $
  Squaring again:
  $ A^4 = (0, 1, 1) $
  Squaring again gives $A^8 = (1, 0, 1) = A$ (since $2^3 = 8$, $x^8 = x$ in the field).
]

#solved_problem[
  Convert the polynomial $x^2 + 1$ in $"GF"(2^3)$ to its Normal Basis representation, given the normal basis $N = {x^3, x^6, x^12 mod P(x)}$ where $P(x) = x^3 + x^2 + 1$.
  (Note: $x^3 = x^2 + 1$ in this field).
]
#solution[
  Let the basis elements be $beta_1 = x^3$, $beta_2 = x^6$, $beta_4 = x^12$.
  First, express the target polynomial $T = x^2 + 1 = x^3$ (using relation $x^3 + x^2 + 1 = 0$).
  So $T = beta_1$.
  The coordinate vector is $(1, 0, 0)$.
  Let's verify: $1 dot beta_1 + 0 dot beta_2 + 0 dot beta_4 = x^3 = x^2 + 1$. Correct.
]

=== Supplementary Problems

#supplementary[
  Explain why the multiplication operation is generally more complex in normal basis representation compared to polynomial basis representation.
]

#supplementary[
  Verify that for any element $alpha in "GF"(2^n)$, $"Tr"(alpha) = 1$ if and only if $alpha$ has an odd number of 1s in its normal basis representation (assuming Trace definition involving sum of conjugates).
]
