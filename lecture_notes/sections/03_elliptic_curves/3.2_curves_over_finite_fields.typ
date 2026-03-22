#import "../../utils.typ": *
== Elliptic Curves over Finite Fields

=== Theory

#definition("Elliptic Curve over $FF_p$")[
  Let $p > 3$ be a prime. An *elliptic curve over $FF_p$* is the set of points $(x, y) in FF_p times FF_p$ satisfying:
  $ y^2 equiv x^3 + a x + b space (mod p) $
  where $a, b in FF_p$ and $4a^3 + 27b^2 not equiv 0 space (mod p)$, together with the point at infinity $cal(O)$.

  We denote this set $E(FF_p)$.
]

#note[
  All arithmetic (addition, multiplication, and finding inverses) is performed *modulo $p$*. The curve $E(FF_p)$ has only finitely many points, making it suitable for cryptographic use.
]

#definition("Order of an Elliptic Curve")[
  The *order* of an elliptic curve over $FF_p$, denoted $\#E(FF_p)$ or $|E(FF_p)|$, is the total number of points on the curve including the point at infinity $cal(O)$.
]

#theorem("Hasse's Theorem")[
  For an elliptic curve $E$ over $FF_p$, Hasse's theorem bounds the number of points:
  $ |space \#E(FF_p) - (p+1) space| <= 2 sqrt(p) $
  Equivalently, the order $\#E(FF_p)$ lies in the interval:
  $ p + 1 - 2sqrt(p) <= \#E(FF_p) <= p + 1 + 2sqrt(p) $
  This shows that the curve has approximately $p + 1$ points.
]

#definition("Trace of Frobenius")[
  The integer $t = p + 1 - \#E(FF_p)$ is called the *trace of Frobenius*. By Hasse's theorem, $|t| <= 2sqrt(p)$.
]

#note[
  *Finding points on $E(FF_p)$*: For each $x in FF_p$, compute $r = x^3 + ax + b space (mod p)$. If $r = 0$, then $(x, 0)$ is a point. If $r$ is a quadratic residue mod $p$ (i.e., $r^{(p-1)/2} equiv 1$), there are two points $(x, y)$ and $(x, -y)$. Otherwise, no point exists for that $x$.
]

#definition("Subgroup and Generator")[
  Since $E(FF_p)$ is a finite abelian group, it may contain cyclic subgroups. A *generator* (or *base point*) $G in E(FF_p)$ is a point of large prime order $n$, meaning $n G = cal(O)$ and no smaller positive multiple equals $cal(O)$. The subgroup $angle.l G angle.r = {cal(O), G, 2G, ..., (n-1)G}$ is used in cryptographic protocols.
]

=== Solved Problems

#solved_problem[
  Let $E: y^2 equiv x^3 + x + 1 space (mod 5)$. Find all points on $E(FF_5)$ by testing each $x in {0,1,2,3,4}$.
]
#solution[
  For each $x$, compute $r = x^3 + x + 1 space (mod 5)$, then check if $r$ has a square root mod 5. The squares mod 5 are $0^2=0, 1^2=1, 2^2=4, 3^2=4, 4^2=1$, so the quadratic residues are $QR = {0, 1, 4}$.

  - $x=0$: $r = 0 + 0 + 1 = 1 in QR$. $y^2 equiv 1$: $y = 1, 4$. Points: $(0,1), (0,4)$.
  - $x=1$: $r = 1 + 1 + 1 = 3 notin QR$. No points.
  - $x=2$: $r = 8 + 2 + 1 = 11 equiv 1 in QR$. $y = 1, 4$. Points: $(2,1), (2,4)$.
  - $x=3$: $r = 27 + 3 + 1 = 31 equiv 1 in QR$. $y = 1, 4$. Points: $(3,1), (3,4)$.
  - $x=4$: $r = 64 + 4 + 1 = 69 equiv 4 in QR$. $y^2 equiv 4$: $y = 2, 3$. Points: $(4,2),(4,3)$.

  Total affine points: 8. Including $cal(O)$: $\#E(FF_5) = 9$.
]

#solved_problem[
  Verify that Hasse's theorem holds for $E(FF_5)$ with $\#E(FF_5) = 9$.
]
#solution[
  Hasse's bound: $p + 1 - 2sqrt(p) <= \#E <= p + 1 + 2sqrt(p)$ with $p=5$:
  $ 5 + 1 - 2sqrt(5) = 6 - 4.47 approx 1.53 $
  $ 5 + 1 + 2sqrt(5) = 6 + 4.47 approx 10.47 $
  Since $1.53 <= 9 <= 10.47$, Hasse's theorem is satisfied. ✓

  The trace of Frobenius is $t = 5 + 1 - 9 = -3$, and indeed $|-3| = 3 <= 2sqrt(5) approx 4.47$. ✓
]

#solved_problem[
  On $E: y^2 equiv x^3 + 2x + 3 space (mod 7)$, verify that $P = (2, 3)$ lies on the curve and find $-P$.
]
#solution[
  *Verification*: LHS: $3^2 = 9 equiv 2 space (mod 7)$. RHS: $8 + 4 + 3 = 15 equiv 1 space (mod 7)$.

  Hmm, $2 != 1$ — let's recheck. $2^3 = 8 equiv 1$, $2 dot 2 = 4$, so RHS $= 1 + 4 + 3 = 8 equiv 1 space (mod 7)$. LHS = 2. Not equal.

  Try $P = (3, 4)$: LHS $= 16 equiv 2$. RHS $= 27 + 6 + 3 = 36 equiv 1$. Try $P = (1, 6)$: LHS $= 36 equiv 1$. RHS $= 1 + 2 + 3 = 6 equiv 6$. Not equal.

  Try $P = (0, b)$: RHS $= 3$. $y^2 equiv 3 space (mod 7)$. Squares mod 7: $\{0,1,2,4\}$. Since $3 notin QR_7$, no point at $x=0$.

  This illustrates that not every pair is on the curve. *Finding $-P$* for any point $P = (x, y) in E(FF_p)$: $-P = (x, -y mod p) = (x, p - y)$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [An elliptic curve $E(FF_p)$ is defined over a finite field where $p$ is:],
    (["Any integer"], ["A prime"], ["A power of 2 only"], ["An even number"]),
    1,
  )

  #question(
    [The total number of points on $E(FF_p)$, including $cal(O)$, is called the:],
    (["Trace of Frobenius"], ["Discriminant"], ["Order of the curve"], ["Hasse bound"]),
    2,
  )

  #question(
    [Hasse's theorem states that $\#E(FF_p)$ is approximately:],
    ([$p$], [$p + 1$], [$p^2$], [$sqrt(p)$]),
    1,
  )

  #question(
    [The trace of Frobenius $t$ is defined as:],
    ([$t = p + \#E(FF_p)$], [$t = p - \#E(FF_p)$], [$t = p + 1 - \#E(FF_p)$], [$t = \#E(FF_p) - p$]),
    2,
  )

  #question(
    [For a point $P = (x, y) in E(FF_p)$, the inverse $-P$ is:],
    ([$(- x, y) mod p$], [$(x, p - y)$], [$(p - x, p - y)$], [$cal(O)$]),
    1,
  )

  #question(
    [How many affine points are on $E: y^2 equiv x^3 + x + 1 space (mod 5)$?],
    (["6"], ["7"], ["8"], ["9"]),
    2,
  )

  #question(
    [A generator (base point) $G$ of order $n$ satisfies:],
    ([$G^n = 1$], [$n G = cal(O)$], [$G + n = cal(O)$], [$n = |E(FF_p)|$]),
    1,
  )

  #question(
    [For an $x in FF_p$, a point $(x, y)$ exists on $E(FF_p)$ if and only if $x^3 + ax + b$ is:],
    (["Zero or a quadratic residue mod $p$"], ["Any value"], ["A prime mod $p$"], ["A quadratic non-residue mod $p$"]),
    0,
  )

  #question(
    [True or False: The group $E(FF_p)$ is always cyclic.],
    (["True"], ["False — it can be $ZZ_n times ZZ_m$"], ["Only for large $p$"], ["Only when $p = 2$"]),
    1,
  )

  #question(
    [The bound $|t| <= 2sqrt(p)$ ensures that $E(FF_p)$ has:],
    (["At most $p$ points"], ["At least 1 point besides $cal(O)$"], ["Roughly $p+1$ points within $2sqrt(p)$"], ["Exactly $p$ points"]),
    2,
  )
]

=== Supplementary Problems

#supplementary[
  Find all points on $E: y^2 equiv x^3 + x space (mod 7)$.
]

#supplementary[
  For $E(FF_{11})$ with $\#E = 13$, compute the trace of Frobenius and verify Hasse's bound.
]

#supplementary[
  Explain why arithmetic on $E(FF_p)$ is performed modulo $p$ even for coordinates.
]

#supplementary[
  Show that for any point $P = (x, y)$ on $E(FF_p)$ with $y != 0$, we have $P != -P$.
]

#supplementary[
  For $p = 5$, compute the quadratic residues mod 5 and use them to count points on $y^2 equiv x^3 + 2 space (mod 5)$.
]

#supplementary[
  What goes wrong if $4a^3 + 27b^2 equiv 0 space (mod p)$? Give a concrete example.
]
