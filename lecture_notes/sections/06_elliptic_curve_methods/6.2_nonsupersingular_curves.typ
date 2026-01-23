#import "../../utils.typ": *

== Curvas nosupersingulares

=== Theory

#definition("Supersingular vs. Ordinary")[
  An elliptic curve $E$ over $"GF"(p)$ is *supersingular* if $p$ divides the trace of Frobenius $t = p + 1 - \#E$.
  Otherwise, the curve is called *ordinary* (or non-supersingular).

  Equivalently, over $"GF"(2^n)$, a curve is supersingular if the coefficient $a_1$ in the generalized Weierstrass equation ($y^2 + x y = x^3 + a_2 x^2 + a_6$) is zero.
]

#theorem("Security Implication")[
  Supersingular curves generally have a small embedding degree $k$ (often $k <= 6$). This makes them vulnerable to the *MOV Attack* (Menezes-Okamoto-Vanstone), which transfers the Discrete Log Problem to a finite field $"GF"(p^k)$ where Index Calculus attacks are feasible.
  Therefore, for standard ECDLP security, *ordinary* curves are required.
]

=== Solved Problems

#solved_problem[
  Is the curve $E: y^2 = x^3 + x$ over $"GF"(3)$ supersingular?
]
#solution[
  Points over $"GF"(3)$ ($0, 1, 2$):
  - $x=0 => y^2=0 => (0,0)$
  - $x=1 => y^2=2$ (No solution, squares in $"GF"(3)$ are $0, 1$)
  - $x=2 => y^2=8+2=10=1 => (2,1), (2,2)$
  Total points $N = 3$ (including $O$).
  Trace $t = p + 1 - N = 3 + 1 - 3 = 1$.
  $p=3$ does not divide $t=1$.
  Therefore, the curve is *ordinary* (non-supersingular).
]

=== Supplementary Problems

#supplementary[
  Verify if the curve $y^2 + y = x^3$ over $"GF"(2)$ is supersingular.
]

#supplementary[
  Explain why pairing-based cryptography intentionally uses supersingular (or specific embedding degree) curves.
]
