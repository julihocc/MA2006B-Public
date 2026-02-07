#import "../../utils.typ": *

== Elliptic Curves over Galois Fields

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

=== Self-Evaluation Quiz

#quiz[
  #question(
    [What is the Hasse's Theorem bound for the number of points on an elliptic curve over $"GF"(q)$?],
    (
      [$| \#E("GF"(q)) - (q + 1) | <= 2sqrt(q)$],
      [$| \#E("GF"(q)) - q | <= sqrt(q)$],
      [$| \#E("GF"(q)) - (q - 1) | <= 2q$],
      [$| \#E("GF"(q)) | = q$],
    ),
    0,
  )

  #question(
    [The Elliptic Curve Discrete Logarithm Problem (ECDLP) is to find $k$ given:],
    (
      [$P$ and $Q = k P$],
      [$P$ and $Q = P^k$],
      [$P$ and $k$],
      [$Q$ and $k$],
    ),
    0,
  )

  #question(
    [What is the trace of Frobenius $t$ for an elliptic curve over $"GF"(q)$?],
    (
      [$t = q + 1 - \#E("GF"(q))$],
      [$t = \#E("GF"(q)) - q$],
      [$t = q - 1$],
      [$t = 0$],
    ),
    0,
  )

  #question(
    [A generic algorithm (like Pollard's rho) for solving ECDLP has a time complexity of roughly:],
    (
      [$sqrt(n)$ where $n$ is the group order],
      [$n$],
      [$log n$],
      [$n^2$],
    ),
    0,
  )

  #question(
    [What is a cofactor $h$ in the context of ECC group order $N$?],
    (
      [$N = h dot r$, where $r$ is a large prime],
      [$h = N - 1$],
      [$h$ is the discriminant],
      [$h$ is the private key],
    ),
    0,
  )

  #question(
    [Why are curves with cofactor $h=1$ generally preferred?],
    (
      [The entire group is of prime order, avoiding small subgroup attacks],
      [They are faster to compute],
      [They are easier to generate],
      [They have no points at infinity],
    ),
    0,
  )

  #question(
    [What is a Koblitz curve (or anomalous binary curve)?],
    (
      [A curve defined over $"GF"(2)$],
      [A curve with trace $t=1$],
      [A curve where the order is exactly $q$],
      [A curve that is susceptible to the Weil Pairing attack],
    ),
    0,
  )

  #question(
    [The Schoof-Elkies-Atkin (SEA) algorithm is used for:],
    (
      [Counting the number of points on an elliptic curve],
      [Solving the discrete logarithm problem],
      [Generating random curves],
      [Encrypting messages],
    ),
    0,
  )

  #question(
    [For a curve over $"GF"(2^m)$, the points form:],
    (
      [An abelian group],
      [A ring],
      [A field],
      [A vector space],
    ),
    0,
  )

  #question(
    [In the context of the ECDH key exchange, the shared secret is:],
    (
      [The x-coordinate of $d_A d_B G$],
      [The point $d_A G + d_B G$],
      [The product $d_A d_B$],
      [The point $(d_A + d_B) G$],
    ),
    0,
  )
]


=== Supplementary Problems

#supplementary[
  Why are curves with trace of Frobenius being 1 (anomalous curves) avoided in cryptography?
]

#supplementary[
  Explain the difference between supersingular and non-supersingular curves in the context of finite fields.
]

#supplementary[
  Given $E: y^2 = x^3 + x$ over $"GF"(5)$, determine the number of points using Legendre symbols or direct checking.
]

#supplementary[
  Explain the significance of the "embedding degree" and why it matters for pairing-based cryptography (like Weil/Tate pairings).
]

#supplementary[
  If a curve has order $N$ and we choose a base point $G$ of order $r$ where $r$ divides $N$, what happens if we accidentally choose a point of small order?
]

#supplementary[
  What is the "Frobenius Endomorphism" $phi: (x, y) arrow (x^q, y^q)$ and how does it relate to the number of points?
]

#supplementary[
  Compare the efficiency of elliptic curve point counting algorithms (Naive vs Baby-step Giant-step vs Schoof's).
]

#supplementary[
  Why is the MOV attack a threat to supersingular curves?
]

#supplementary[
  For the curve $y^2 + x y = x^3 + 1$ over $"GF"(2^m)$, explain why point doubling is more efficient (hint: characteristic 2 arithmetic).
]

#supplementary[
  Determine if the curve $y^2 = x^3 + 1$ over $"GF"(7)$ is supersingular.
]

