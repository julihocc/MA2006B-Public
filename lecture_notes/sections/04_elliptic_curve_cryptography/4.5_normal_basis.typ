#import "../../utils.typ": *

== Matemática de base normal

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

=== Supplementary Problems

#supplementary[
  Explain why the multiplication operation is generally more complex in normal basis representation compared to polynomial basis representation.
]

#supplementary[
  Verify that for any element $alpha in "GF"(2^n)$, $"Tr"(alpha) = 1$ if and only if $alpha$ has an odd number of 1s in its normal basis representation (assuming Trace definition involving sum of conjugates).
]
