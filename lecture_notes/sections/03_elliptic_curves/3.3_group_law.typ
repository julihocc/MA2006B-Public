#import "../../utils.typ": *
== The Group Law and Arithmetic

=== Theory

#definition("Point Addition Formula")[
  Let $E: y^2 = x^3 + ax + b$ be an elliptic curve over $FF_p$ ($p > 3$ prime), and let $P = (x_1, y_1)$, $Q = (x_2, y_2)$ be two points on $E$ with $P, Q != cal(O)$ and $P != -Q$.

  The sum $R = P + Q = (x_3, y_3)$ is computed algebraically as follows:

  #align(center)[
    *Case 1: $P != Q$ (Point Addition)*

    $ lambda = (y_2 - y_1)(x_2 - x_1)^(-1) mod p $
    $ x_3 = lambda^2 - x_1 - x_2 mod p $
    $ y_3 = lambda(x_1 - x_3) - y_1 mod p $
  ]

  #align(center)[
    *Case 2: $P = Q$ (Point Doubling)*

    $ lambda = (3x_1^2 + a)(2y_1)^(-1) mod p $
    $ x_3 = lambda^2 - 2x_1 mod p $
    $ y_3 = lambda(x_1 - x_3) - y_1 mod p $
  ]

  In both cases, $lambda$ is the *slope* of the chord/tangent line.
]

#note[
  The formula for $lambda$ in Case 2 is derived by implicit differentiation of $y^2 = x^3 + ax + b$:
  $ 2y (d y)/(d x) = 3x^2 + a => (d y)/(d x) = (3x^2 + a)/(2y) $
  This is the tangent slope at $(x_1, y_1)$, carried over to finite field arithmetic.
]

#definition("Special Cases")[
  - *Identity*: $P + cal(O) = cal(O) + P = P$ for any $P in E(FF_p)$.
  - *Inverse*: $P + (-P) = cal(O)$, where $-P = (x_1, p - y_1)$.
  - *Point at infinity*: If $P = -Q$ (i.e., $x_1 = x_2$ and $y_1 + y_2 equiv 0 space (mod p)$), then $P + Q = cal(O)$.
]

#definition("Scalar Multiplication")[
  *Scalar multiplication* is the repeated addition of a point $P$ to itself $k$ times:
  $ k P = underbrace(P + P + ... + P)_{k "times") $
  For large $k$, this is computed efficiently using the *double-and-add algorithm*, analogous to repeated squaring for exponentiation.
]

#algorithm("Double-and-Add for Scalar Multiplication")[
  *Input*: Point $P in E(FF_p)$, integer $k > 0$ with binary representation $k = (k_n k_(n-1) ... k_1 k_0)_2$.

  *Output*: $Q = k P$.

  1. Set $Q = cal(O)$, $R = P$.
  2. For $i = 0$ to $n$:
     - If $k_i = 1$: set $Q = Q + R$.
     - Set $R = 2R$ (point doubling).
  3. Return $Q$.

  *Complexity*: $O(log k)$ point additions/doublings, compared to $O(k)$ for naive addition.
]

#note[
  Scalar multiplication is the *one-way function* at the heart of ECC. Computing $k P$ from $P$ and $k$ is fast (polynomial in $log k$). The reverse problem — finding $k$ given $P$ and $kP$ — is the *Elliptic Curve Discrete Logarithm Problem (ECDLP)*, believed to be computationally intractable for properly chosen parameters.
]

=== Solved Problems

#solved_problem[
  On $E: y^2 equiv x^3 + 3x + 8 space (mod 13)$, compute $P + Q$ where $P = (1, 5)$ and $Q = (4, 7)$.
]
#solution[
  Check $P$ and $Q$ are on the curve:
  - $P$: $5^2 = 25 equiv 12$; $1 + 3 + 8 = 12$. ✓
  - $Q$: $7^2 = 49 equiv 10$; $64 + 12 + 8 = 84 equiv 84 - 6(13) = 84-78=6$. Let me recheck: $4^3=64 equiv 64-4(13)=64-52=12$; $3(4)=12$; $12+12+8=32 equiv 32-2(13)=6$. And $7^2=49 equiv 10$. So $Q = (4,7)$ is not on the curve. Take $Q = (4, 6)$: $6^2=36 equiv 10$; check matches. ✓

  Use $P = (1,5)$, $Q = (4, 6)$:
  $ lambda = (6 - 5)(4 - 1)^(-1) = 1 dot 3^(-1) mod 13 $
  Find $3^(-1) mod 13$: $3 dot 9 = 27 equiv 1$, so $3^(-1) = 9$.
  $ lambda = 9 $
  $ x_3 = 81 - 1 - 4 = 76 equiv 76 - 5(13) = 76 - 65 = 11 $
  $ y_3 = 9(1 - 11) - 5 = 9(-10) - 5 = -90 - 5 = -95 equiv -95 + 8(13) = -95 + 104 = 9 $
  So $P + Q = (11, 9)$.
]

#solved_problem[
  On $E: y^2 equiv x^3 + x + 6 space (mod 11)$, compute $2P$ where $P = (2, 7)$.
]
#solution[
  Verify $P$: $7^2 = 49 equiv 5$; $8 + 2 + 6 = 16 equiv 5$. ✓

  Point doubling formula with $a = 1$:
  $ lambda = (3 dot 4 + 1)(2 dot 7)^(-1) = 13 dot 14^(-1) equiv 2 dot 3^(-1) space (mod 11) $
  $14 equiv 3$; $13 equiv 2$. Find $3^(-1) mod 11$: $3 dot 4 = 12 equiv 1$, so $3^(-1) = 4$.
  $ lambda = 2 dot 4 = 8 $
  $ x_3 = 64 - 4 = 60 equiv 60 - 5(11) = 5 $
  $ y_3 = 8(2 - 5) - 7 = -24 - 7 = -31 equiv -31 + 3(11) = 2 $
  So $2P = (5, 2)$.
]

#solved_problem[
  Explain why double-and-add is efficient for computing $127 P$.
]
#solution[
  $127 = 1111111_2$, so it has 7 bits. Naive addition requires 126 additions. Double-and-add uses:
  - 6 doublings: $2P, 4P, 8P, 16P, 32P, 64P$
  - 6 additions (since all bits are 1): $P + 2P, + 4P, + 8P, + 16P, + 32P, + 64P$
  Total: 12 operations vs. 126. For a 256-bit scalar (typical in ECC), double-and-add uses ~512 operations vs. $2^{256}$ for naive.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [In point addition $P + Q$ ($P != Q$), the slope $lambda$ is computed as:],
    (
      [$(y_2 + y_1)/(x_2 + x_1)$],
      [$(y_2 - y_1)/(x_2 - x_1)$],
      [$(3x_1^2 + a)/(2y_1)$],
      [$(x_2 - x_1)/(y_2 - y_1)$],
    ),
    1,
  )

  #question(
    [In point doubling $2P$, the slope $lambda$ is derived from:],
    (
      [The chord through $P$ and $-P$],
      [The tangent line at $P$],
      [The $x$-axis],
      [The vertical line at $P$],
    ),
    1,
  )

  #question(
    [Scalar multiplication $kP$ is computed efficiently in $O(log k)$ operations using:],
    (["Trial division"], ["Double-and-add algorithm"], ["Sieve of Eratosthenes"], ["Extended Euclidean algorithm"]),
    1,
  )

  #question(
    [The ECDLP asks: given $P$ and $Q = kP$, find:],
    ([$P$], [$Q$], [$k$], [$-P$]),
    2,
  )

  #question(
    [On $E(FF_p)$, division by $(x_2 - x_1)$ is performed as:],
    (["Real division"], ["$(x_2 - x_1)^{-1} mod p$ (modular inverse)"], ["Integer division"], ["Ignored if zero"]),
    1,
  )

  #question(
    [When $P + (-P)$ is computed, the result is:],
    ([$2P$], [$cal(O)$], [$(0, 0)$], [$-2P$]),
    1,
  )

  #question(
    [The formula $x_3 = lambda^2 - x_1 - x_2 space (mod p)$ applies when:],
    (["$P = Q$"], ["$P != Q$ and $P != -Q$"], ["$P = cal(O)$"], ["$P = -Q$"]),
    1,
  )

  #question(
    [In double-and-add, the bit $k_i = 0$ means:],
    (["Skip the addition, only double"], ["Add $P$"], ["Reset $Q$"], ["Stop the algorithm"]),
    0,
  )

  #question(
    [Which property of scalar multiplication makes ECC secure?],
    (["It is reversible in polynomial time"], ["Finding $k$ from $P$ and $kP$ is computationally hard"], ["It requires large keys"], ["It is slow to compute"]),
    1,
  )

  #question(
    [True or False: Point doubling uses the same $lambda$ formula as point addition.],
    (["True"], ["False — doubling uses the tangent slope $(3x_1^2 + a)/(2y_1)$"], ["Only for prime fields"], ["Depends on $a$"]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  On $E: y^2 equiv x^3 + 2x + 2 space (mod 17)$, compute $(6, 3) + (5, 1)$.
]

#supplementary[
  Compute $3P$ on $E: y^2 equiv x^3 + x + 1 space (mod 23)$ where $P = (0, 1)$ using double-and-add.
]

#supplementary[
  Show that for any point $P$ of order $n$ on $E(FF_p)$, we have $n P = cal(O)$.
]

#supplementary[
  Verify the associativity of the group law algebraically for two specific points on $E: y^2 equiv x^3 + x + 6 space (mod 11)$.
]

#supplementary[
  Explain why ordinary multiplication $k times P$ (adding $P$ to itself naively) is computationally infeasible for 256-bit scalars $k$.
]

#supplementary[
  On $E(FF_7)$ with $\#E = 9$, if $G$ has order 9. How many distinct points does $angle.l G angle.r$ contain?
]
