#import "../../utils.typ": *
== Elliptic Curves over the Reals

=== Theory

#definition("Weierstrass Form")[
  An *elliptic curve* over the real numbers is the set of affine points $(x, y) in RR^2$ satisfying the *short Weierstrass equation*
  $ y^2 = x^3 + a x + b $
  where $a, b in RR$, together with one additional point $cal(O)$ called the *point at infinity*. We write this set as
  $ E(RR) = {(x,y) in RR^2 : y^2 = x^3 + a x + b} union {cal(O)}. $
]

#note[
  The equation is called "short" Weierstrass form. More general Weierstrass equations exist, but over fields of characteristic not equal to 2 or 3 they can often be transformed into this simpler shape. Since $RR$ has characteristic 0, the short form is enough for the geometric intuition used in this section.
]

#definition("Non-Singularity")[
  An elliptic curve $y^2 = x^3 + a x + b$ is *non-singular* (i.e., truly an elliptic curve) if its *discriminant* is nonzero:
  $ Delta = -16(4a^3 + 27b^2) != 0 $
  Equivalently, $4a^3 + 27b^2 != 0$. Geometrically, this means the cubic has no cusp or self-intersection. At every point of the curve there is a well-defined tangent line.
]

#example[
  Compare two cubic models:
  - $E_1: y^2 = x^3 - x + 1$ has $a=-1$, $b=1$, so
    $Delta = -16(4(-1)^3 + 27(1)^2) = -16(23) != 0$.
    Hence $E_1$ is a valid elliptic curve.
  - $E_2: y^2 = x^3$ has $a=0$, $b=0$, so $Delta = 0$.
    This is singular (a cusp), so it is not an elliptic curve for group-law purposes.
]

#note[
  The condition $Delta != 0$ says that the polynomial $x^3 + a x + b$ has no repeated roots over the complex numbers. This prevents the affine curve $y^2 = x^3 + a x + b$ from developing a singular point. If $Delta = 0$, the chord-and-tangent construction breaks down at the singularity and does not produce the elliptic-curve group used in cryptography.
]

#definition("The Point at Infinity")[
  Every elliptic curve includes a distinguished point $cal(O)$, the *point at infinity*, which serves as the *identity element* of the group law. Formally, $cal(O)$ lies in the projective closure of the curve.

  A useful mental model is: all vertical lines meet the curve again at this same point $cal(O)$. This convention lets inverse points add to the identity.
]

#example[
  If $P = (x,y)$ is on $E(RR)$, then $-P = (x,-y)$ is also on $E(RR)$ because both points have the same value of $y^2$. The vertical line through $P$ and $-P$ meets the curve at $cal(O)$, so the group law will force
  $ P + (-P) = cal(O). $
]

#definition("Geometric Group Law — Chord and Tangent")[
  Given two points $P, Q$ on an elliptic curve, their *sum* $P + Q$ is defined geometrically:
  + *Case $P != Q$*: Draw the line through $P$ and $Q$. It intersects the cubic at a third point $R'$ (counting intersections with multiplicity). Reflect $R'$ across the $x$-axis to obtain $R = P + Q$.
  + *Case $P = Q$* (point doubling): Draw the tangent line to the curve at $P$. It intersects the cubic at a third point $R'$. Reflect $R'$ across the $x$-axis to obtain $R = 2P$.
  + *Vertical line*: If $Q = -P$, then the line through $P$ and $Q$ is vertical. The third intersection is $cal(O)$, so $P + Q = cal(O)$.
  + *Identity*: For every point $P$, define $P + cal(O) = cal(O) + P = P$.
]

#note[
  The reflection step is a convention that makes the group law work cleanly: three collinear points on the curve satisfy
  $ P + Q + R' = cal(O). $
  Therefore, if the line through $P$ and $Q$ meets the curve again at $R'$, then $P + Q = -R'$, which is the reflection of $R'$ across the $x$-axis.
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
  The set of points on a non-singular elliptic curve $E$ over $RR$, together with the point at infinity $cal(O)$, forms an *abelian group* $(E(RR), +)$ under the chord-and-tangent law. The identity is $cal(O)$, and the inverse of a point $P = (x, y)$ is $-P = (x, -y)$.
]

#note[
  Closure and inverses are visible from the geometry. Associativity is much deeper: it is true, but proving it carefully requires more algebraic geometry than we need here. For this course, the key point is that non-singular cubic curves provide a genuine abelian group whose operation can later be computed algebraically.
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
  *Cryptographic relevance*: The geometric construction over $RR$ gives the intuition, but cryptographic applications use elliptic curves over *finite fields* (Section 3.2), where the group is finite and discrete computations can be performed efficiently.
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
  The discriminant is zero, so the curve is *singular*. Indeed, at the origin $(0, 0)$, both partial derivatives $partial_x(x^3 - y^2) = 3x^2 = 0$ and $partial_y(x^3 - y^2) = -2y = 0$ vanish simultaneously, confirming a *cusp* at the origin. Singular curves do not support a well-defined group law.
]

#solved_problem[
  On the elliptic curve $y^2 = x^3 - x + 1$ over $RR$, the points $P = (0, 1)$ and $Q = (1, 1)$ lie on the curve. Verify membership and describe geometrically how $P + Q$ is computed.
]
#solution[
  *Verification*:
  - $P = (0, 1)$: $1^2 = 1$ and $0^3 - 0 + 1 = 1$. ✓
  - $Q = (1, 1)$: $1^2 = 1$ and $1^3 - 1 + 1 = 1$. ✓

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
  Find the inverse of the point $P = (2, 3)$ on an elliptic curve $y^2 = x^3 - x + 5$ over $RR$.
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
