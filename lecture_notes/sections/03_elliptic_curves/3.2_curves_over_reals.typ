#import "../../utils.typ": *
== Elliptic Curves over the Reals

=== Theory

The real case gives the geometric model for elliptic curves. In this section, ordinary addition in $RR^2$ will still be written with $+$. The elliptic-curve operation will be written with the circled-plus symbol $⊕$.

#definition([Short Weierstrass Model over $RR$])[
  Let $a,b in RR$. The *affine short Weierstrass model* determined by $a$ and $b$ is the set
  $ C_("aff")(RR) = {(x,y) in RR^2 : y^2 = x^3 + a x + b}. $
  Its defining equation is
  $ y^2 = x^3 + a x + b. $
]

#note[
  More general Weierstrass equations exist. Over the fields used in this chapter, the short form is enough once the characteristic is not $2$ or $3$. Section 3.1 explains why this condition matters.
]

#definition("Non-Singularity")[
  The short Weierstrass model
  $ y^2 = x^3 + a x + b $
  is *non-singular* if its elliptic-curve discriminant is nonzero:
  $ Delta_E = -16(4a^3 + 27b^2) != 0. $
  Equivalently,
  $ 4a^3 + 27b^2 != 0. $
]

#note[
  The condition $Delta_E != 0$ is equivalent to saying that the cubic polynomial $x^3 + a x + b$ has no repeated root over $CC$. Geometrically, this prevents the completed cubic from having a cusp or self-intersection. Appendix @appendix-cubic-discriminant proves the discriminant criterion.
]

#example[
  Compare two cubic models:
  - $E_1: y^2 = x^3 - x + 1$ has $a=-1$, $b=1$, so
    $Delta_E = -16(4(-1)^3 + 27(1)^2) = -16(23) != 0$.
    Hence $E_1$ is non-singular.
  - $E_2: y^2 = x^3$ has $a=0$, $b=0$, so $Delta_E = 0$.
    This model is singular, so it is not an elliptic curve.

  #align(center)[
    #image("../../assets/generated/03_elliptic_curves/3.2_discriminant_comparison.svg", width: 90%)
  ]

  The nonzero discriminant for $E_1$ appears geometrically as a smooth curve. For $E_2$, the zero discriminant corresponds to the cusp at the origin.
]

#definition([Elliptic Curve over $RR$])[
  An *elliptic curve over $RR$ in short Weierstrass form* is a non-singular short Weierstrass model together with one additional point, called the *point at infinity*:
  $ E(RR) = {(x,y) in RR^2 : y^2 = x^3 + a x + b} union {cal(O)}, $
  where $4a^3 + 27b^2 != 0$.
]

#definition("The Point at Infinity")[
  The point $cal(O)$ is the unique point at infinity on the projective closure of
  $ y^2 = x^3 + a x + b. $
  In homogeneous coordinates it is
  $ cal(O) = [0 : 1 : 0]. $
]

#note[
  The point $cal(O)$ is not an affine coordinate pair. Appendix @appendix-point-at-infinity constructs it formally using projective geometry. For the present section, the essential fact is that every vertical affine line meets the completed curve at this same point $cal(O)$.
]

#definition("Inverse Point")[
  If $P = (x,y)$ is an affine point of $E(RR)$, its inverse with respect to $⊕$ is denoted
  $ overline(P) $
  and is given by
  $ overline(P) = (x,-y). $
  We also define
  $ overline(cal(O)) = cal(O). $
]

#example[
  If $P=(x,y)$ lies on $y^2=x^3+a x+b$, then $overline(P)=(x,-y)$ also lies on the curve because both points have the same value of $y^2$. The minus sign in $(x,-y)$ is ordinary real-number negation of the coordinate $y$; the symbol $overline(P)$ is the inverse of the point $P$ under $⊕$.
]

#definition("Point Subtraction")[
  If $P,Q in E(RR)$, define
  $ P ⊖ Q = P ⊕ overline(Q). $
  Thus $⊖$ is a binary operation on two points, while the bar notation $overline(P)$ denotes the inverse of one point.
]

#definition("Chord-and-Tangent Operation")[
  Let $E(RR)$ be an elliptic curve over $RR$. The *chord-and-tangent operation* defines a binary operation $⊕$ on $E(RR)$ as follows:

  + If $P,Q$ are distinct affine points and $Q != overline(P)$, let the affine line through $P$ and $Q$ meet the curve at the third point $R'$, counted with intersection multiplicity. Define
    $ P ⊕ Q = overline(R'). $
  + If $P=Q$ is an affine point and the tangent line at $P$ is not vertical, let the tangent line meet the curve at the third point $R'$, counted with intersection multiplicity. Define
    $ 2 P = P ⊕ P = overline(R'). $
  + If $Q=overline(P)$, define
    $ P ⊕ Q = cal(O). $
  + For every $P in E(RR)$, define
    $ P ⊕ cal(O) = cal(O) ⊕ P = P. $
]

#note[
  The operation $⊕$ is not coordinate-wise addition in $RR^2$. It is defined from lines and the completed cubic. The inverse bar is not the ordinary vector inverse in $RR^2$; for an affine point $R'=(x,y)$ it gives $overline(R')=(x,-y)$.

  The minus sign is the convention that makes three collinear points on the completed cubic satisfy
  $ P ⊕ Q ⊕ R' = cal(O). $
]

==== Case-by-Case Examples of $⊕$

#example[
  *Distinct affine points.* On $E: y^2 = x^3 - x + 1$, take
  $ P = (0,1) quad "and" quad Q = (1,1). $
  The line through them is $y=1$. Substituting into the curve gives
  $ 1 = x^3 - x + 1, $
  so
  $ x^3 - x = x(x-1)(x+1) = 0. $
  The third intersection is $R'=(-1,1)$, and therefore
  $ P ⊕ Q = overline(R') = (-1,-1). $

  #align(center)[
    #image("../../assets/generated/03_elliptic_curves/3.2_chord_distinct_points.svg", width: 72%)
  ]
]

#example[
  *Doubling with a non-vertical tangent.* On $E: y^2 = x^3 - x + 1$, take
  $ P=(0,1). $
  The tangent slope at $P$ is
  $ lambda = (3x^2 - 1)/(2y) bar_(P) = -1/2. $
  Hence the tangent line is
  $ y = 1 - x/2. $
  It meets the curve again at
  $ R' = (1/4, 7/8). $
  Therefore
  $ 2 P = P ⊕ P = overline(R') = (1/4, -7/8). $

  #align(center)[
    #image("../../assets/generated/03_elliptic_curves/3.2_tangent_doubling.svg", width: 72%)
  ]
]

#example[
  *Inverse points.* On $E: y^2 = x^3 - x + 1$, let
  $ P=(0,1). $
  Then
  $ overline(P)=(0,-1). $
  The line through $P$ and $overline(P)$ is the vertical line $x=0$. In the projective closure, this vertical line meets the curve at $cal(O)$, so
  $ P ⊕ overline(P) = cal(O). $

  #align(center)[
    #image("../../assets/generated/03_elliptic_curves/3.2_inverse_vertical_line.svg", width: 72%)
  ]
]

#example[
  *Vertical tangent at a point of order $2$.* On $E: y^2 = x^3 - x$, take
  $ P=(1,0). $
  We use this curve, rather than $y^2=x^3-x+1$, because the point $(1,0)$ has $y$-coordinate zero and lies on this curve:
  $ 0^2 = 1^3 - 1 = 0. $
  Points with $y=0$ are exactly the affine points that can be equal to their own inverse.

  Since $overline(P)=(1,-0)=(1,0)=P$, the point is its own inverse. The tangent line at $P$ is vertical, and therefore
  $ 2 P = P ⊕ P = cal(O). $

  #align(center)[
    #image("../../assets/generated/03_elliptic_curves/3.2_vertical_tangent_order_two.svg", width: 72%)
  ]
]

#example[
  *The identity point.* For every point $P in E(RR)$,
  $ P ⊕ cal(O) = cal(O) ⊕ P = P. $
  This case is not represented by an ordinary affine line construction, because $cal(O)$ is not a point of $RR^2$. It is the projective point that completes the curve and serves as the identity element.

  #align(center)[
    #image("../../assets/generated/03_elliptic_curves/3.2_identity_point_at_infinity.svg", width: 72%)
  ]
]

#example[
  *Point subtraction.* On $E: y^2 = x^3 - x + 1$, take
  $ P=(0,1) quad "and" quad Q=(1,1). $
  Since $overline(Q)=(1,-1)$, subtraction is computed by
  $ P ⊖ Q = P ⊕ overline(Q). $
  The line through $P$ and $overline(Q)$ has equation $y=1-2x$ and meets the curve again at
  $ R'=(3,-5). $
  Hence
  $ P ⊖ Q = overline(R') = (3,5). $

  #align(center)[
    #image("../../assets/generated/03_elliptic_curves/3.2_point_subtraction.svg", width: 72%)
  ]
]

#note[
  The case-by-case construction above defines the operation $⊕$. The next result explains why this operation is algebraically useful: it does not merely produce more points on the curve, but gives the whole set of points the structure of an abelian group.
]

#theorem("Elliptic Curve Group Structure")[
  Let $E(RR)$ be an elliptic curve over $RR$. With the chord-and-tangent operation $⊕$, the set $E(RR)$ is an abelian group.

  More explicitly:
  - the identity element is $cal(O)$;
  - the inverse of an affine point $P=(x,y)$ is $overline(P)=(x,-y)$;
  - for all $P,Q in E(RR)$, the point $P ⊕ Q$ is again in $E(RR)$;
  - the operation is associative and commutative.
]

#note[
  The identity, inverse, and vertical-line cases are visible from the projective construction. Closure follows from the fact that a line meets a non-singular cubic in three points when intersections are counted with multiplicity. Associativity is the deeper part of the theorem and is not proved in this course. The important algebraic conclusion is that the geometric rule is a genuine group operation, which is why finite-field elliptic curves can later be used as finite abelian groups.
]

#definition("Torsion Points")[
  A point $P in E(RR)$ is called a *torsion point* if some positive multiple of it equals the identity:
  $ n P = cal(O) quad "for some integer" n >= 1. $
  If $P=(x,0)$ is on the curve, then $P=overline(P)$, so $2 P=cal(O)$. Such points are points of order $2$, as in the vertical-tangent case above.
]

#note[
  Real curves give the geometric origin of the operation. Cryptographic applications use the same algebraic operation over finite fields, where the set of points is finite and arithmetic can be performed exactly.
]

=== Solved Problems

#solved_problem[
  Determine whether the curve $y^2 = x^3 - x$ is a valid non-singular elliptic curve over $RR$.
]
#solution[
  We have $a = -1$ and $b = 0$. Compute
  $ Delta_E = -16(4(-1)^3 + 27(0)^2) = -16(-4) = 64 != 0. $
  Since the discriminant is nonzero, the curve is non-singular and is an elliptic curve over $RR$ after adding $cal(O)$.
]

#solved_problem[
  Show that the curve $y^2 = x^3$ is singular, and explain the geometric significance.
]
#solution[
  Here $a = 0$ and $b = 0$, so
  $ Delta_E = -16(4 dot 0 + 27 dot 0) = 0. $
  The discriminant is zero, so the curve is singular. Directly, for
  $ F(x,y) = y^2 - x^3, $
  both partial derivatives vanish at the origin:
  $ F_x(0,0) = -3(0)^2 = 0, quad F_y(0,0) = 2(0) = 0. $
  This is the cusp visible at $(0,0)$. Singular cubic curves are excluded because the chord-and-tangent operation does not give the elliptic-curve group used in this chapter.
]

#solved_problem[
  On the elliptic curve $y^2 = x^3 - x + 1$ over $RR$, the points $P = (0, 1)$ and $Q = (1, 1)$ lie on the curve. Verify membership and compute $P ⊕ Q$ geometrically.
]
#solution[
  First verify membership:
  - For $P=(0,1)$, $1^2=1$ and $0^3-0+1=1$.
  - For $Q=(1,1)$, $1^2=1$ and $1^3-1+1=1$.

  The line through $P$ and $Q$ is horizontal, so it has equation $y=1$. Substitute into the curve:
  $ 1 = x^3 - x + 1 quad => quad x^3 - x = 0. $
  Thus
  $ x(x-1)(x+1)=0, $
  and the three intersections have $x=0,1,-1$. The third point is $R'=(-1,1)$. Reflecting across the $x$-axis gives
  $ P ⊕ Q=overline(R')=(-1,-1). $
]

#solved_problem[
  Explain why a point $P=(x,0)$ on an elliptic curve satisfies $2 P=cal(O)$.
]
#solution[
  The inverse of an affine point is obtained by changing the sign of the $y$-coordinate. If $P=(x,0)$, then
  $ overline(P) = (x,-0) = (x,0) = P. $
  Hence
  $ 2 P = P ⊕ P = P ⊕ overline(P) = cal(O). $
  Geometrically, the tangent line at such a point is vertical, and every vertical line meets the completed curve at $cal(O)$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [The short Weierstrass form used in this section is:],
    ([$y = x^3 + a x + b$], [$y^2 = x^3 + a x + b$], [$y^2 = x^2 + a x + b$], [$y^3 = x^2 + a x + b$]),
    1,
  )

  #question(
    [Which condition ensures non-singularity for $y^2=x^3+a x+b$ over $RR$?],
    ([$a != 0$], [$b != 0$], [$Delta_E = -16(4a^3 + 27b^2) != 0$], [$a^2+b^2 != 0$]),
    2,
  )

  #question(
    [The point at infinity on a short Weierstrass curve is:],
    ([$(0,0)$], [$[1:0:0]$], [$[0:1:0]$], [The $x$-intercept]),
    2,
  )

  #question(
    [The inverse $overline(P)$ of an affine point $P=(x,y)$ is:],
    ([$(-x,y)$], [$(x,-y)$], [$(-x,-y)$], [$cal(O)$]),
    1,
  )

  #question(
    [The chord-and-tangent operation on an elliptic curve is:],
    ([Ordinary coordinate-wise addition], [A new operation defined using lines and reflection], [Multiplication of coordinates], [Addition only for points with the same $x$-coordinate]),
    1,
  )

  #question(
    [If the tangent line at $P$ is vertical, then:],
    ([$2 P=cal(O)$], [$2 P=P$], [$P$ is not on the curve], [$P$ has no inverse]),
    0,
  )

  #question(
    [Under the chord-and-tangent operation, $E(RR)$ is:],
    ([A non-abelian group], [An abelian group], [A ring], [A field]),
    1,
  )

  #question(
    [True or False: A singular cubic curve is still an elliptic curve in this chapter.],
    (["True"], ["False"], ["Only over $RR$"], ["Only if it has real points"]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Determine which of the following are valid elliptic curves in short Weierstrass form: (a) $y^2 = x^3 - 3x + 2$, (b) $y^2 = x^3 + x$, (c) $y^2 = x^3 + 1$.
]

#supplementary[
  Find the inverse of the point $P = (2, 3)$ on an elliptic curve $y^2 = x^3 - x + 3$ over $RR$.
]

#supplementary[
  On $y^2 = x^3 + 1$, show that $P = (-1, 0)$ satisfies $2 P = cal(O)$.
]

#supplementary[
  Describe geometrically what happens when one attempts to add a point $P$ to itself and the tangent line at $P$ is vertical.
]

#supplementary[
  Prove that the operation $P mapsto overline(P) = (x, -y)$ is an involution on the affine points of $E(RR)$.
]

#supplementary[
  Compute $P ⊕ Q$ on $y^2 = x^3 - 2x + 4$ where $P = (-2, 0)$ and $Q = (0, 2)$.
]
