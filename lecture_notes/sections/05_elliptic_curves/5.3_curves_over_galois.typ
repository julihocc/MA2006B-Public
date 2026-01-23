#import "../../utils.typ": *

== Curvas elípticas sobre grupos de Galois

=== Theory

#definition("Elliptic Curve Group Order")[
  The *order* of an elliptic curve group $\#E("GF"(q))$ is the number of points on the curve (including $O$).
]

#theorem("Hasse's Theorem")[
  The number of points on an elliptic curve over a finite field $"GF"(q)$ is essentially $q+1$, bounded by error $2sqrt(q)$:
  $ | \#E("GF"(q)) - (q + 1) | <= 2sqrt(q) $
]

#definition("Discrete Logarithm Problem (ECDLP)")[
  Given points $P$ and $Q$ on an elliptic curve such that $Q = k P$ for some integer $k$, the *Elliptic Curve Discrete Logarithm Problem* is to find $k$.
  The hardness of this problem underpins ECC security.
]

=== Solved Problems

#solved_problem[
  For $E("GF"(7))$ defined by $y^2 = x^3 + 2$, list all points and verify Hasse's Theorem.
]
#solution[
  Squares mod 7: $0^2=0, 1^2=1, 2^2=4, 3^2=2$.
  Check $x = 0, ..., 6$:
  - $x=0: y^2 = 2 = 3^2 => (0, 3), (0, 4)$
  - $x=1: y^2 = 3$ (No sol)
  - $x=2: y^2 = 8+2=10=3$ (No sol)
  - $x=3: y^2 = 27+2=29=1=1^2 => (3, 1), (3, 6)$
  - $x=4: y^2 = 64+2=66=3$ (No sol)
  - $x=5: y^2 = 125+2=127=1=1^2 => (5, 1), (5, 6)$
  - $x=6: y^2 = 216+2=218=1=1^2 => (6, 1), (6, 6)$

  Points: $O, (0,3), (0,4), (3,1), (3,6), (5,1), (5,6), (6,1), (6,6)$.
  Total count $N = 9$.
  Hasse's Bound: $q+1 = 8$. Error $|9 - 8| = 1$.
  $2sqrt(7) approx 2(2.64) = 5.28$.
  Since $1 <= 5.28$, theorem holds.
]

=== Supplementary Problems

#supplementary[
  Why are curves with trace of Frobenius being 1 (anomalous curves) avoided in cryptography?
]

#supplementary[
  Explain the difference between supersingular and non-supersingular curves in the context of finite fields.
]
