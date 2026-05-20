#import "../../utils.typ": *
== Elliptic Curves over Finite Fields

=== Theory

Over finite fields, the same elliptic-curve group becomes a finite algebraic system. The geometry from the real case supplies the operation $⊕$; the field $FF_p$ supplies exact modular arithmetic.

#definition("Elliptic Curve over a Prime Field")[
  Let $p > 3$ be prime. An *elliptic curve over $FF_p$ in short Weierstrass form* is
  $ E(FF_p) = {(x,y) in FF_p times FF_p : y^2 equiv x^3 + a x + b space (mod p)} union {cal(O)}, $
  where $a,b in FF_p$ and
  $ 4a^3 + 27b^2 equiv.not 0 space (mod p). $
]

#note[
  All arithmetic in the equation is performed modulo $p$. The condition $p>3$ keeps the short Weierstrass formulas in the same shape as the real formulas, because $2$ and $3$ are nonzero and invertible in $FF_p$.
]

#example[
  For $p=5$, $a=1$, and $b=1$, the curve is
  $ y^2 equiv x^3 + x + 1 space (mod 5). $
  Its non-singularity condition is
  $ 4a^3 + 27b^2 = 4 + 27 = 31 equiv 1 != 0 space (mod 5), $
  so this is an elliptic curve over $FF_5$.
]

#example[
  The integer value of $4a^3+27b^2$ may be nonzero and still vanish after reducing modulo $p$. For instance, over $FF_5$ take $a=2$ and $b=2$. Then
  $ 4a^3 + 27b^2 = 4 dot 2^3 + 27 dot 2^2 = 32 + 108 = 140 equiv 0 space (mod 5). $
  Therefore
  $ y^2 equiv x^3 + 2x + 2 space (mod 5) $
  is singular over $FF_5$, so it is not an elliptic curve in this sense. The singular point is $(1,0)$: the equation gives $0 equiv 1+2+2 equiv 0 space (mod 5)$, and for
  $ F(x,y)=y^2 - x^3 - 2x - 2 $
  both partial derivatives vanish at $(1,0)$ modulo $5$:
  $ F_x(1,0) = -3 - 2 equiv 0 space (mod 5) quad "and" quad F_y(1,0)=0. $
]

#definition("Order of an Elliptic Curve")[
  The *order* of an elliptic curve over $FF_p$, denoted $\#E(FF_p)$ or $|E(FF_p)|$, is the number of points in $E(FF_p)$, including the point at infinity $cal(O)$.
]

#note[
  To count points, test each $x in FF_p$. Compute
  $ r = x^3 + a x + b space (mod p). $
  If $r=0$, there is one point $(x,0)$. If $r$ is a nonzero quadratic residue modulo $p$, there are two points $(x,y)$ and $(x,-y)$. If $r$ is a quadratic non-residue, there is no point with that $x$-coordinate.
]

#example[
  For $E: y^2 equiv x^3 + x + 1 space (mod 5)$, counting all affine solutions gives 8 affine points. Including $cal(O)$ gives
  $ \#E(FF_5) = 9. $
]

#theorem("Hasse's Theorem")[
  For an elliptic curve $E$ over $FF_p$,
  $ |space \#E(FF_p) - (p+1) space| <= 2 sqrt(p). $
  Equivalently,
  $ p + 1 - 2sqrt(p) <= \#E(FF_p) <= p + 1 + 2sqrt(p). $
]

#definition("Trace of Frobenius")[
  The integer
  $ t = p + 1 - \#E(FF_p) $
  is called the *trace of Frobenius*. By Hasse's theorem,
  $ |t| <= 2sqrt(p). $
]

#example[
  If $p=5$ and $\#E(FF_5)=9$, then
  $ t = 5 + 1 - 9 = -3. $
  Hasse's theorem gives $|-3| <= 2sqrt(5)$, which is true.
]

#definition("Inverse Point over $FF_p$")[
  For an affine point $P=(x,y) in E(FF_p)$, its inverse with respect to $⊕$ is denoted
  $ overline(P) $
  and is given by
  $ overline(P) = (x,-y mod p). $
  Equivalently, when $y != 0$, one may write
  $ overline(P) = (x,p-y). $
  Also,
  $ overline(cal(O))=cal(O). $
]

#definition("Point Subtraction over $FF_p$")[
  If $P,Q in E(FF_p)$, define
  $ P ⊖ Q = P ⊕ overline(Q). $
  Thus $⊖$ is reserved for subtraction of two points, not for the inverse of one point.
]

#definition("Point Operation and Doubling Formulas")[
  Let $E: y^2 equiv x^3 + a x + b space (mod p)$ be an elliptic curve over $FF_p$, and let $P=(x_1,y_1)$ and $Q=(x_2,y_2)$ be affine points on $E$.

  If $P != Q$ and $P != overline(Q)$, define $R=P ⊕ Q=(x_3,y_3)$ by
  $ lambda = (y_2-y_1)(x_2-x_1)^(-1) mod p, $
  $ x_3 = lambda^2 - x_1 - x_2 mod p, $
  $ y_3 = lambda(x_1-x_3)-y_1 mod p. $

  If $P=Q$ and $y_1 != 0$, define $2 P=(x_3,y_3)$ by
  $ lambda = (3x_1^2+a)(2y_1)^(-1) mod p, $
  $ x_3 = lambda^2 - 2x_1 mod p, $
  $ y_3 = lambda(x_1-x_3)-y_1 mod p. $
]

#note[
  These formulas are the affine coordinate form of the chord-and-tangent operation from Section 3.2. Division modulo $p$ means multiplication by a modular inverse, so every denominator must be checked before applying the formula.
]

#definition("Special Cases")[
  The finite-field operation also includes the following cases:
  - *Identity*: $P ⊕ cal(O) = cal(O) ⊕ P = P$.
  - *Inverse points*: If $Q=overline(P)$, then $P ⊕ Q=cal(O)$.
  - *Doubling with $y_1=0$*: If $P=(x_1,0)$, then $P=overline(P)$, so $2 P=cal(O)$.
]

#example[
  On $E: y^2 equiv x^3 + 2x + 2 space (mod 17)$, add $P=(5,1)$ and $Q=(6,3)$.
  Since $P != Q$ and $P != overline(Q)$,
  $ lambda = (3-1)(6-5)^(-1) = 2. $
  Then
  $ x_3 = 2^2 - 5 - 6 = -7 equiv 10, $
  $ y_3 = 2(5-10) - 1 = -11 equiv 6. $
  Thus $P ⊕ Q=(10,6)$.
]

#definition("Scalar Multiplication")[
  *Scalar multiplication* is repeated use of the operation $⊕$:
  $ k P = underbrace(P ⊕ P ⊕ ... ⊕ P)_(k " times"). $
  It is computed efficiently by the *double-and-add algorithm*, which uses the binary expansion of $k$.
]

#algorithm("Double-and-Add for Scalar Multiplication")[
  *Input*: A point $P in E(FF_p)$ and an integer $k > 0$ with binary representation $k=(k_n k_(n-1) ... k_1 k_0)_2$.

  *Output*: $Q = k P$.

  1. Set $Q=cal(O)$ and $R=P$.
  2. For $i=0$ to $n$:
     - If $k_i=1$, set $Q=Q+R$.
     - Set $R=2 R$.
  3. Return $Q$.

  This requires $O(log k)$ elliptic-curve operations and doublings.
]

#definition("Subgroup and Generator")[
  Since $E(FF_p)$ is a finite abelian group, it may contain cyclic subgroups. A *generator* or *base point* $G$ of order $n$ is a point satisfying
  $ n G = cal(O) $
  and no smaller positive multiple of $G$ equals $cal(O)$.

  The subgroup generated by $G$ is
  $ chevron.l G chevron.r = {cal(O), G, 2 G, ..., (n-1) G}. $
]

#example[
  On the toy curve $y^2 equiv x^3 + 2x + 2 space (mod 17)$, the point $G=(5,1)$ has order $19$. Hence
  $ chevron.l G chevron.r = {cal(O), G, 2 G, ..., 18 G}, $
  and
  $ 19 G = cal(O). $
]

#note[
  *Light cryptographic motivation*: For a public point $G$, computing $k G$ from $k$ is efficient by double-and-add. The reverse problem, recovering $k$ from $G$ and $k G$, is the *Elliptic Curve Discrete Logarithm Problem* (ECDLP). This one-way behavior is the algebraic reason elliptic-curve groups are useful in cryptography.
]

#example[
  In a toy public/private key picture, a private integer $d$ determines a public point
  $ Q = d G. $
  Anyone can see $G$ and $Q$, but recovering $d$ from them is the hard direction on properly chosen large curves. Real systems use standardized curves and very large prime-order subgroups; the small examples in these notes are only for calculation.
]

#note[
  Standardized curves such as secp256k1, P-256, and Curve25519 are chosen with large field sizes, carefully selected group orders, and implementation constraints. The algebraic objects remain the same: a finite field, an elliptic curve, a base point, and scalar multiplication.
]

=== Solved Problems

#solved_problem[
  Let $E: y^2 equiv x^3 + x + 1 space (mod 5)$. Find all points on $E(FF_5)$ by testing each $x in {0,1,2,3,4}$.
]
#solution[
  The quadratic residues modulo $5$ are
  $ 0^2=0, quad 1^2=1, quad 2^2=4, quad 3^2=4, quad 4^2=1, $
  so $Q R={0,1,4}$.

  - $x=0$: $r=1$, so $y=1,4$. Points: $(0,1),(0,4)$.
  - $x=1$: $r=3$, not a quadratic residue. No points.
  - $x=2$: $r=11 equiv 1$, so $y=1,4$. Points: $(2,1),(2,4)$.
  - $x=3$: $r=31 equiv 1$, so $y=1,4$. Points: $(3,1),(3,4)$.
  - $x=4$: $r=69 equiv 4$, so $y=2,3$. Points: $(4,2),(4,3)$.

  There are 8 affine points. Including $cal(O)$,
  $ \#E(FF_5)=9. $
]

#solved_problem[
  Verify that Hasse's theorem holds for $E(FF_5)$ with $\#E(FF_5)=9$.
]
#solution[
  Hasse's bound gives
  $ 5+1-2sqrt(5) <= \#E(FF_5) <= 5+1+2sqrt(5). $
  Numerically,
  $ 1.53 <= \#E(FF_5) <= 10.47. $
  Since $9$ lies in this interval, Hasse's theorem holds. The trace is
  $ t=5+1-9=-3, $
  and $|-3| <= 2sqrt(5)$.
]

#solved_problem[
  On $E: y^2 equiv x^3 + 2x + 3 space (mod 7)$, verify that $P=(2,1)$ lies on the curve and find $overline(P)$.
]
#solution[
  Check membership:
  $ 1^2 equiv 1 space (mod 7), $
  while
  $ 2^3 + 2 dot 2 + 3 = 15 equiv 1 space (mod 7). $
  Thus $P$ lies on $E(FF_7)$.

  The inverse is obtained by negating the $y$-coordinate modulo $7$:
  $ overline(P) = (2,-1 mod 7) = (2,6). $
]

#solved_problem[
  Consider the toy curve $E: y^2 equiv x^3 + 2x + 2 space (mod 17)$. Verify that $E$ is non-singular and that $G=(5,1)$ lies on $E$.
]
#solution[
  For non-singularity,
  $ 4a^3 + 27b^2 = 4(2^3)+27(2^2)=32+108=140 equiv 4 != 0 space (mod 17). $
  Hence $E$ is non-singular.

  For $G=(5,1)$,
  $ 1^2 = 1 $
  and
  $ 5^3 + 2 dot 5 + 2 = 137 equiv 1 space (mod 17). $
  Thus $G in E(FF_17)$.
]

#solved_problem[
  On $E: y^2 equiv x^3 + 3x + 8 space (mod 13)$, compute $P ⊕ Q$ where $P=(1,5)$ and $Q=(9,6)$.
]
#solution[
  Check membership:
  - $P$: $5^2=25 equiv 12$, and $1+3+8=12$.
  - $Q$: $6^2=36 equiv 10$, and $9^3+3 dot 9+8=764 equiv 10 space (mod 13)$.

  Since $P != Q$ and $P != overline(Q)$,
  $ lambda = (6-5)(9-1)^(-1) = 1 dot 8^(-1) equiv 5 space (mod 13), $
  because $8 dot 5 equiv 1 space (mod 13)$.
  Then
  $ x_3 = 5^2 - 1 - 9 = 15 equiv 2 space (mod 13), $
  $ y_3 = 5(1-2)-5 = -10 equiv 3 space (mod 13). $
  Therefore $P ⊕ Q=(2,3)$.
]

#solved_problem[
  On $E: y^2 equiv x^3 + x + 6 space (mod 11)$, compute $2 P$ where $P=(2,7)$.
]
#solution[
  Verify $P$:
  $7^2=49 equiv 5$, and $2^3+2+6=16 equiv 5$.

  Use the doubling formula with $a=1$:
  $ lambda = (3 dot 2^2 + 1)(2 dot 7)^(-1) = 13 dot 14^(-1) equiv 2 dot 3^(-1) space (mod 11). $
  Since $3^(-1) equiv 4 space (mod 11)$,
  $ lambda = 2 dot 4 = 8. $
  Hence
  $ x_3 = 8^2 - 2 dot 2 = 60 equiv 5, $
  $ y_3 = 8(2-5)-7 = -31 equiv 2 space (mod 11). $
  Therefore $2 P=(5,2)$.
]

#solved_problem[
  Explain why double-and-add is efficient for computing $127 P$.
]
#solution[
  Since
  $ 127 = 1111111_2, $
  it has 7 binary digits. Naive repeated use of $⊕$ requires 126 operations. Double-and-add builds the powers
  $ 2 P,4 P,8 P,16 P,32 P,64 P $
  by 6 doublings and then combines the needed terms. This uses about $O(log 127)$ group operations instead of $O(127)$ operations.
]

#solved_problem[
  On the toy curve $E: y^2 equiv x^3 + 2x + 2 space (mod 17)$ with $G=(5,1)$, compute $2 G$, $3 G$, and $10 G$, and verify that $19 G=cal(O)$.
]
#solution[
  *Step 1: $2 G$.* Since $a=2$,
  $ lambda = (3 dot 5^2 + 2)(2 dot 1)^(-1) = 77 dot 2^(-1) equiv 9 dot 9 equiv 13 space (mod 17). $
  Thus
  $ x_3 = 13^2 - 2 dot 5 = 159 equiv 6, $
  $ y_3 = 13(5-6)-1 = -14 equiv 3. $
  Hence $2 G=(6,3)$.

  *Step 2: $3 G=2 G ⊕ G$.* Combine $(6,3)$ and $(5,1)$:
  $ lambda = (1-3)(5-6)^(-1) = (-2)(-1)^(-1) equiv 2 space (mod 17). $
  Hence
  $ x_3 = 2^2 - 6 - 5 = -7 equiv 10, $
  $ y_3 = 2(6-10)-3 = -11 equiv 6. $
  So $3 G=(10,6)$.

  Continuing by the same formulas gives
  $ 10 G=(7,11). $
  Also $18 G=overline(G)=(5,16)$, so
  $ 19 G=18 G ⊕ G=(5,16) ⊕ (5,1)=cal(O), $
  because the two points are inverses.
]

#solved_problem[
  Explain the algebraic idea behind a public key of the form $Q = d G$.
]
#solution[
  The integer $d$ is private, while $G$ and $Q = d G$ may be public. Computing $Q$ from $d$ and $G$ is efficient because scalar multiplication can be done by double-and-add. Recovering $d$ from $G$ and $Q$ is the ECDLP. For carefully chosen large curves, no efficient general method is known for this reverse problem.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [An elliptic curve $E(FF_p)$ in this section is defined over a field where $p$ is:],
    (["Any integer"], ["A prime greater than 3"], ["A power of 2 only"], ["An even number"]),
    1,
  )

  #question(
    [The total number of points on $E(FF_p)$, including $cal(O)$, is called:],
    (["Trace of Frobenius"], ["Discriminant"], ["Order of the curve"], ["Hasse bound"]),
    2,
  )

  #question(
    [Hasse's theorem says that $\#E(FF_p)$ is approximately:],
    ([$p$], [$p+1$], [$p^2$], [$sqrt(p)$]),
    1,
  )

  #question(
    [For a point $P=(x,y) in E(FF_p)$, the inverse $overline(P)$ is:],
    ([$(-x,y)$], [$(x,-y mod p)$], [$(p-x,p-y)$], [$cal(O)$]),
    1,
  )

  #question(
    [In the point operation $P ⊕ Q$ with $P != Q$ and $P != overline(Q)$, the slope $lambda$ is:],
    ([$(y_2+y_1)(x_2+x_1)^(-1)$], [$(y_2-y_1)(x_2-x_1)^(-1)$], [$(3x_1^2+a)(2y_1)^(-1)$], [$(x_2-x_1)(y_2-y_1)^(-1)$]),
    1,
  )

  #question(
    [In point doubling $2 P$, the slope formula comes from:],
    ([The chord through $P$ and $overline(P)$], [The tangent line at $P$], [The $x$-axis], [The line at infinity]),
    1,
  )

  #question(
    [When $P ⊕ overline(P)$ is computed, the result is:],
    ([$2 P$], [$cal(O)$], [$(0,0)$], [$-2 P$]),
    1,
  )

  #question(
    [Scalar multiplication $k P$ is computed efficiently using:],
    (["Trial division"], ["Double-and-add"], ["The Euclidean algorithm only"], ["Point counting"]),
    1,
  )

  #question(
    [A generator $G$ of order $n$ satisfies:],
    ([$G^n=1$], [$n G=cal(O)$], [$G+n=cal(O)$], [$n=\#FF_p$]),
    1,
  )

  #question(
    [The ECDLP asks one to recover:],
    ([$G$ from $Q = d G$], [$Q$ from $d$ and $G$], [$d$ from $G$ and $Q = d G$], [$p$ from $E(FF_p)$]),
    2,
  )
]

=== Supplementary Problems

#supplementary[
  Find all points on $E: y^2 equiv x^3 + x space (mod 7)$.
]

#supplementary[
  For $E(FF_11)$ with $\#E=13$, compute the trace of Frobenius and verify Hasse's bound.
]

#supplementary[
  Explain why arithmetic on $E(FF_p)$ is performed modulo $p$, including coordinate arithmetic.
]

#supplementary[
  Show that for any point $P=(x,y)$ on $E(FF_p)$ with $y != 0$, we have $P != overline(P)$.
]

#supplementary[
  For $p=5$, compute the quadratic residues modulo $5$ and use them to count points on $y^2 equiv x^3 + 2 space (mod 5)$.
]

#supplementary[
  What goes wrong if $4a^3+27b^2 equiv 0 space (mod p)$? Give a concrete example.
]

#supplementary[
  On $E: y^2 equiv x^3 + 2x + 2 space (mod 17)$, compute $(6,3) ⊕ (5,1)$.
]

#supplementary[
  Compute $3 P$ on $E: y^2 equiv x^3 + x + 1 space (mod 23)$ where $P=(0,1)$ using double-and-add.
]

#supplementary[
  Show that for any point $P$ of order $n$ on $E(FF_p)$, we have $n P=cal(O)$.
]

#supplementary[
  Verify associativity for one concrete triple of points on $E: y^2 equiv x^3 + x + 6 space (mod 11)$.
]

#supplementary[
  Explain why naive repeated use of $⊕$ is computationally infeasible for a 256-bit scalar $k$.
]

#supplementary[
  On $E(FF_7)$ with $\#E=9$, if $G$ has order $9$, how many distinct points does $chevron.l G chevron.r$ contain?
]

#supplementary[
  In the public-key relation $Q = d G$, explain what is public, what is private, and why recovering $d$ is expected to be hard on a large standardized curve.
]

#supplementary[
  Compare, at a high level, why elliptic-curve cryptography can use smaller keys than RSA for a similar security level.
]
