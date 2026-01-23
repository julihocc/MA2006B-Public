#import "../../utils.typ": *

== Elliptic Curves over Fields

=== Theory

#definition("Elliptic Curve over a Field K")[
  Let $K$ be a field of characteristic not equal to 2 or 3. An elliptic curve $E(K)$ consists of all points $(x, y) in K times K$ satisfying:
  $ y^2 = x^3 + a x + b $
  where $a, b in K$ and $Delta = -16(4a^3 + 27b^2) != 0$, together with the point at infinity $O$.
]

#theorem("Algebraic Addition Formula")[
  Let $P = (x_1, y_1)$ and $Q = (x_2, y_2)$ be points on $E(K)$ with $P != -Q$. Then $P + Q = (x_3, y_3)$ is given by:
  $ x_3 = lambda^2 - x_1 - x_2 $
  $ y_3 = lambda(x_1 - x_3) - y_1 $

  where the slope $lambda$ is:
  - If $P != Q$: $lambda = (y_2 - y_1) / (x_2 - x_1)$
  - If $P = Q$ (Point Doubling): $lambda = (3x_1^2 + a) / (2y_1)$
]

=== Solved Problems

#solved_problem[
  On the curve $y^2 = x^3 + 2x + 2$ over $ZZ_17$, compute $2P$ where $P = (5, 1)$.
]
#solution[
  First, check $P$ on curve: $1^2 = 1$. $5^3 + 2(5) + 2 = 125 + 10 + 2 = 137$.
  $137 mod 17 = 1$. (Since $137 = 8(17) + 1$). Valid.

  For doubling $P=(5, 1)$:
  $ lambda = (3(5)^2 + 2) / (2(1)) = (75 + 2) / 2 = 77 / 2 $.
  Modulo 17: $77 = 4(17) + 9 equiv 9$.
  Inverse of 2 mod 17 is 9 (since $2(9)=18 equiv 1$).
  $ lambda = 9 dot 9 = 81 = 4(17) + 13 equiv 13 $.

  $ x_3 = 13^2 - 5 - 5 = 169 - 10 = 159 $.
  $ 159 = 9(17) + 6 equiv 6 $.
  $ y_3 = 13(5 - 6) - 1 = 13(-1) - 1 = -13 - 1 = -14 equiv 3 $.
  So $2P = (6, 3)$.
]

=== Supplementary Problems

#supplementary[
  Derive the doubling formula from differentiation of the Weierstrass equation (tangent slope).
]

#supplementary[
  Calculate $P + Q$ on $y^2 = x^3 + x + 1$ over $ZZ_5$ for suitable points $P$ and $Q$.
]
