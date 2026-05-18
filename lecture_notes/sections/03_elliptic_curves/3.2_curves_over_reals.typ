#import "../../utils.typ": *
== Elliptic Curves over the Reals

=== Theory

#definition([Short Weierstrass Model over $RR$])[
  Let $a,b in RR$. The *affine short Weierstrass model* determined by $a$ and $b$ is the set
  $ C_("aff")(RR) = {(x,y) in RR^2 : y^2 = x^3 + a x + b}. $
  Its defining equation is
  $ y^2 = x^3 + a x + b $
  and is called the *short Weierstrass equation*.
]

#note[
  More general Weierstrass equations exist. Over the fields used in this chapter, the short form is enough once the characteristic is not $2$ or $3$. Section 3.1 explains why this condition matters.
]

#definition("Non-Singularity")[
  The short Weierstrass model
  $ y^2 = x^3 + a x + b $
  is *non-singular* if its discriminant is nonzero:
  $ Delta = -16(4a^3 + 27b^2) != 0. $
  Equivalently,
  $ 4a^3 + 27b^2 != 0. $
  Appendix @appendix-cubic-discriminant explains where this cubic discriminant formula comes from.
]

#example[
  Compare two cubic models:
  - $E_1: y^2 = x^3 - x + 1$ has $a=-1$, $b=1$, so
    $Delta = -16(4(-1)^3 + 27(1)^2) = -16(23) != 0$.
    Hence $E_1$ is non-singular.
  - $E_2: y^2 = x^3$ has $a=0$, $b=0$, so $Delta = 0$.
    This model is singular, so it is not an elliptic curve.

  #align(center)[
    #image("../../assets/generated/03_elliptic_curves/3.2_discriminant_comparison.svg", width: 90%)
  ]

  The nonzero discriminant for $E_1$ appears geometrically as a smooth curve. For $E_2$, the zero discriminant corresponds to the cusp at the origin.
]

#note[
  The condition $Delta != 0$ is equivalent to saying that the cubic polynomial $x^3 + a x + b$ has no repeated root over $CC$. Geometrically, this prevents the affine curve from developing a cusp or self-intersection. At each affine point there is then a well-defined tangent line.
]

#definition([Elliptic Curve over $RR$])[
  An *elliptic curve over $RR$ in short Weierstrass form* is a non-singular short Weierstrass model together with its point at infinity:
  $ E(RR) = {(x,y) in RR^2 : y^2 = x^3 + a x + b} union {cal(O)}, $
  where $4a^3 + 27b^2 != 0$.
]

#note[
  The point $cal(O)$ is not an affine coordinate pair. In projective coordinates it is
  $ cal(O) = [0 : 1 : 0]. $
  Appendix @appendix-point-at-infinity gives the formal construction using the projective closure of the short Weierstrass equation.
]

#definition("The Point at Infinity")[
  The point $cal(O)$ is the unique point at infinity on the projective closure of
  $ y^2 = x^3 + a x + b. $
  It is included in $E(RR)$ and serves as the identity element for the group law.

  Projectively, every vertical affine line has this same point at infinity. This is why the vertical line through $(x,y)$ and $(x,-y)$ corresponds to the identity element in the chord-and-tangent law.
]

#example[
  If $P = (x,y)$ is an affine point of $E(RR)$, then $(x,-y)$ is also on $E(RR)$ because both points have the same value of $y^2$. We denote this point by $-P$.

  The vertical line through $P$ and $-P$ has point at infinity $cal(O)$, so the chord-and-tangent law gives
  $ P + (-P) = cal(O). $
]

#definition("Geometric Group Law - Chord and Tangent")[
  Let $E(RR)$ be a non-singular short Weierstrass curve. The *chord-and-tangent law* defines a binary operation on $E(RR)$ as follows:
  + If $P,Q in E(RR)$ are distinct affine points and $Q != -P$, let the line through $P$ and $Q$ meet the curve at the third point $R'$ (counting intersection multiplicity). Define
    $ P + Q = -R'. $
  + If $P=Q$ is an affine point and the tangent line at $P$ is not vertical, let that tangent line meet the curve at the third point $R'$. Define
    $ 2P = -R'. $
  + If $Q = -P$, define
    $ P + Q = cal(O). $
  + For every $P in E(RR)$, define
    $ P + cal(O) = cal(O) + P = P. $
]

#note[
  For an affine point $R'=(x,y)$, the point $-R'$ is $(x,-y)$. Thus the instruction $P+Q=-R'$ is exactly the usual reflection across the $x$-axis.

  The reason for the minus sign is that the operation is normalized so that, once the group law is established, three collinear points on the projective curve satisfy
  $ P + Q + R' = cal(O). $
]

#example[
  On $E: y^2 = x^3 - x + 1$, take $P = (0,1)$ and $Q = (1,1)$.
  The line through them is $y=1$. Substituting into the curve gives
  $ x^3 - x = 0 => x in {0,1,-1}. $
  So the third intersection is $R' = (-1,1)$, and reflecting across the $x$-axis gives
  $ P + Q = (-1,-1). $
  This concrete picture is the geometric prototype of elliptic-curve addition.
]

#theorem("Elliptic Curve Group")[
  Let $E(RR)$ be a non-singular short Weierstrass curve. Under the chord-and-tangent law, $E(RR)$ is an abelian group. Its identity element is $cal(O)$, and the inverse of an affine point $P = (x,y)$ is
  $ -P = (x,-y). $
]

#note[
  Closure and inverses are visible from the projective geometry. Associativity is deeper: it is true, but a careful proof requires more algebraic geometry than we need here. For this course, the key point is that non-singular cubic curves provide a genuine abelian group whose operation can later be computed algebraically.
]

#definition("Torsion Points")[
  A point $P in E(RR)$ is called a *torsion point* if some positive multiple of it equals the identity:
  $ n P = cal(O) quad "for some integer" n >= 1. $
  For example, any point with $y = 0$ satisfies $P = -P$, so $2P = cal(O)$. Such points are called points of order 2.
]

#example[
  On $E: y^2 = x^3 - x$, the point $P = (1,0)$ lies on the curve. Since $P = -P$, the tangent line at $P$ is vertical and
  $ 2P = cal(O). $
]

#note[
  *Cryptographic relevance*: The geometric construction over $RR$ gives the intuition, but cryptographic applications use elliptic curves over *finite fields* (Section 3.3), where the group is finite and discrete computations can be performed efficiently.
]

=== Solved Problems

#solved_problem[
  Determine whether the curve $y^2 = x^3 - x$ is a valid (non-singular) elliptic curve.
]
#solution[
  We have $a = -1$, $b = 0$. Compute the discriminant:
  $ Delta = -16(4(-1)^3 + 27(0)^2) = -16(-4) = 64 != 0 $
  Since $Delta != 0$, the curve is non-singular and is a valid elliptic curve.
]

#solved_problem[
  Show that the curve $y^2 = x^3$ is singular, and explain the geometric significance.
]
#solution[
  Here $a = 0$, $b = 0$:
  $ Delta = -16(4 dot 0 + 27 dot 0) = 0 $
  The discriminant is zero, so the curve is *singular*. Indeed, at the origin $(0, 0)$, both partial derivatives $partial_x(x^3 - y^2) = 3x^2 = 0$ and $partial_y(x^3 - y^2) = -2y = 0$ vanish simultaneously, confirming a cusp at the origin. Singular curves do not support a well-defined group law.
]

#solved_problem[
  On the elliptic curve $y^2 = x^3 - x + 1$ over $RR$, the points $P = (0, 1)$ and $Q = (1, 1)$ lie on the curve. Verify membership and describe geometrically how $P + Q$ is computed.
]
#solution[
  *Verification*:
  - $P = (0, 1)$: $1^2 = 1$ and $0^3 - 0 + 1 = 1$.
  - $Q = (1, 1)$: $1^2 = 1$ and $1^3 - 1 + 1 = 1$.

  *Geometric computation of $P + Q$*:
  Draw the line through $P = (0,1)$ and $Q = (1,1)$. The slope is $m = (1-1)/(1-0) = 0$, so the line is $y = 1$. Substitute into the curve:
  $ 1 = x^3 - x + 1 => x^3 - x = 0 => x(x-1)(x+1) = 0 $
  Roots: $x = 0, 1, -1$. The third intersection is at $x = -1$, giving $y = 1$, so $R' = (-1, 1)$.
  Reflecting across the $x$-axis: $P + Q = (-1, -1)$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [The short Weierstrass form of an elliptic curve is:],
    ([$y = x^3 + a x + b$], [$y^2 = x^3 + a x + b$], [$y^2 = x^2 + a x + b$], [$y^3 = x^2 + a x + b$]),
    1,
  )

  #question(
    [Which condition ensures an elliptic curve is non-singular?],
    ([$a != 0$], [$b != 0$], [$Delta = -16(4a^3 + 27b^2) != 0$], [$a^2 + b^2 != 0$]),
    2,
  )

  #question(
    [The identity element of the elliptic curve group is:],
    ([$( 0, 0)$], [The $x$-intercept], [The point at infinity $cal(O)$], [The origin]),
    2,
  )

  #question(
    [The inverse of a point $P = (x, y)$ on an elliptic curve is:],
    ([$(- x, y)$], [$(x, -y)$], [$(- x, -y)$], [$cal(O)$]),
    1,
  )

  #question(
    [In the chord-and-tangent law, if we draw a tangent at $P$, we are computing:],
    ([$P + Q$ for $P != Q$], [$2P$ (point doubling)], [$-P$], [$P + cal(O)$]),
    1,
  )

  #question(
    [The elliptic curve group $(E(RR), +)$ is:],
    ([A non-abelian group], [An abelian group], [A ring but not a group], [A semigroup only]),
    1,
  )

  #question(
    [Which geometric action corresponds to adding a point $P$ to the identity $cal(O)$?],
    ([Drawing a horizontal line], [Drawing a vertical line through $P$], [Reflecting $P$ about the $x$-axis], [$P$ itself]),
    3,
  )

  #question(
    [True or False: A singular elliptic curve supports a well-defined group law.],
    (["True"], ["False"], ["Only over finite fields"], ["Only over $RR$"]),
    1,
  )

  #question(
    [If a vertical line through $P$ and $Q = -P$ is drawn, the result $P + Q$ is:],
    ([$(0, 0)$], [$P$], [$cal(O)$], [$Q$]),
    2,
  )

  #question(
    [Which of the following is a consequence of $Delta = 0$?],
    (["The curve has no real points"], ["The curve has a cusp or self-intersection"], ["The group law fails to be commutative"], ["The curve has infinitely many points"]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Determine which of the following are valid elliptic curves: (a) $y^2 = x^3 - 3x + 2$, (b) $y^2 = x^3 + 3x^2 + 3x + 1$, (c) $y^2 = x^3 + x$.
]

#supplementary[
  Find the inverse of the point $P = (2, 3)$ on an elliptic curve $y^2 = x^3 - x + 3$ over $RR$.
]

#supplementary[
  On $y^2 = x^3 + 1$, show that $P = (-1, 0)$ satisfies $2P = cal(O)$.
]

#supplementary[
  Describe geometrically what happens when you attempt to "add" a point $P$ to itself when the tangent line at $P$ is vertical.
]

#supplementary[
  Prove that the operation $P mapsto -P = (x, -y)$ is an involution (applying it twice returns $P$).
]

#supplementary[
  Compute $P + Q$ on $y^2 = x^3 - 2x + 4$ where $P = (-2, 0)$ and $Q = (0, 2)$.
]
