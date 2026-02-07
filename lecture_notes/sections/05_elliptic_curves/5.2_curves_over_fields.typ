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

=== Self-Evaluation Quiz

#quiz[
  #question(
    [What is the primary difference between elliptic curves over $RR$ and over a finite field $K$?],
    (
      [The equation form changes],
      [The geometric intuition (tangent/secant lines) holds but graphs are discrete points],
      [There is no group structure over fields],
      [The discriminant is always zero over fields],
    ),
    1,
  )

  #question(
    [In the algebraic addition formula for $P+Q=R$, $x_3$ is calculated as:],
    (
      [$lambda^2 - x_1 - x_2$],
      [$lambda^2 + x_1 + x_2$],
      [$lambda(x_1 - x_2)$],
      [$y_1 + y_2$],
    ),
    0,
  )

  #question(
    [When doubling a point $P=(x_1, y_1)$, the slope $lambda$ is given by:],
    (
      [$(y_2 - y_1) / (x_2 - x_1)$],
      [$(3x_1^2 + a) / (2y_1)$],
      [$y_1 / x_1$],
      [Undefined],
    ),
    1,
  )

  #question(
    [If $x_2 = x_1$ but $y_2 != y_1$ (i.e., $Q = -P$), what is $P+Q$?],
    (
      [$(0,0)$],
      [$2P$],
      [The point at infinity $O$],
      [$P$],
    ),
    2,
  )

  #question(
    [Finite fields $K$ used in ECC must have a characteristic NOT equal to:],
    (
      [2 or 3 (for short Weierstrass form)],
      [0],
      [5 or 7],
      [11],
    ),
    0,
  )

  #question(
    [The order of an elliptic curve group over a finite field $E(ZZ_p)$ is roughly:],
    (
      [$p$ (Hasse's Theorem)],
      [$p^2$],
      [$log p$],
      [$2p$],
    ),
    0,
  )

  #question(
    [To compute $k P$ (scalar multiplication) efficiently, which algorithm is commonly used?],
    (
      [Sieve of Eratosthenes],
      [Double-and-Add],
      [Fast Fourier Transform],
      [Gaussian Elimination],
    ),
    1,
  )

  #question(
    [If $4a^3 + 27b^2 = 0$ in the field $K$, the curve is:],
    (
      [Supersingular],
      [Singular],
      [Anomalous],
      [Ordinary],
    ),
    1,
  )

  #question(
    [What is the inverse of $P=(x, y)$ in a field of characteristic $p > 3$?],
    (
      [$(x, -y mod p)$],
      [$(-x, y)$],
      [$(y, x)$],
      [$(x^{-1}, y^{-1})$],
    ),
    0,
  )

  #question(
    [Which problem is the basis for the security of ECC?],
    (
      [Integer Factorization],
      [Elliptic Curve Discrete Logarithm Problem (ECDLP)],
      [Knapsack Problem],
      [Shortest Vector Problem],
    ),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Derive the doubling formula from differentiation of the Weierstrass equation (tangent slope).
]

#supplementary[
  Calculate $P + Q$ on $y^2 = x^3 + x + 1$ over $ZZ_5$ for suitable points $P$ and $Q$.
]

#supplementary[
  List all points on the curve $y^2 = x^3 + x + 1$ over $ZZ_5$. What is the order of the group?
]

#supplementary[
  Prove that if $P$ has order 2, then its y-coordinate must be 0 (for characteristic $> 2$).
]

#supplementary[
  Compute $2P$ for $P=(2, 1)$ on $y^2 = x^3 + x + 6$ over $ZZ_11$.
]

#supplementary[
  Explain how the "Double-and-Add" algorithm works for computing $k P$. Trace it for $k=5$ ($101_2$).
]

#supplementary[
  Why do we need the condition that the characteristic of the field is not 2 or 3 for the equation $y^2 = x^3 + a x + b$? (Hint: coordinate transformation).
]

#supplementary[
  For $y^2 = x^3 + 2x + 2$ over $ZZ_17$, verify that the point $(0, 6)$ is on the curve. Find its inverse.
]

#supplementary[
  Show that point addition is associative: $(P+Q)+R = P+(Q+R)$. (Geometric sketch or algebraic outlines).
]

#supplementary[
  What is a "Generator" point $G$ in the context of ECC protocols? Definition and properties.
]
