#import "../../utils.typ": *

== Elliptic Curves over the Reals

=== Theory

#definition("Elliptic Curve (Weierstrass Form)")[
  An *elliptic curve* $E$ over the real numbers $RR$ is defined by the *Weierstrass equation*:
  $ y^2 = x^3 + a x + b $
  where $a, b in RR$ satisfy the condition that the curve is non-singular.
]

#definition("Discriminant and Non-Singularity")[
  The *discriminant* of the curve is defined as:
  $ Delta = -16(4a^3 + 27b^2) $
  The curve is *non-singular* (i.e., has no cusps or self-intersections) if and only if $Delta != 0$.
]

#theorem("Geometric Group Law")[
  The points on an elliptic curve form an abelian group with the *point at infinity* $O$ as the identity element. The addition operation $P + Q = R$ is defined geometrically:
  1. Draw a line through $P$ and $Q$ (or tangent if $P=Q$).
  2. The line intersects the curve at a third point $R'$.
  3. Reflect $R'$ across the x-axis to get $R$.
]

=== Solved Problems

#solved_problem[
  Check if $y^2 = x^3 - 3x + 2$ represents a non-singular elliptic curve.
]
#solution[
  Parameters are $a = -3$ and $b = 2$.
  Compute the discriminant:
  $ Delta = -16(4(-3)^3 + 27(2)^2) $
  $ Delta = -16(4(-27) + 27(4)) $
  $ Delta = -16(-108 + 108) = 0 $
  Since $Delta = 0$, the curve is singular (it has a "cusp" or node). Thus, it is NOT a valid elliptic curve for cryptography.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [What is the defining equation form for an elliptic curve over $RR$ used in cryptography?],
    (
      [$y^2 = x^3 + a x + b$],
      [$y = m x + c$],
      [$x^2 + y^2 = r^2$],
      [$y = x^2 + a x + b$],
    ),
    0,
  )

  #question(
    [What condition must the discriminant $Delta$ satisfy for the elliptic curve to be non-singular?],
    (
      [$Delta = 0$],
      [$Delta > 0$],
      [$Delta < 0$],
      [$Delta != 0$],
    ),
    3,
  )

  #question(
    [What is the identity element of the elliptic curve group?],
    (
      [The origin $(0,0)$],
      [The point at infinity $O$],
      [The point $(1,1)$],
      [The x-intercept],
    ),
    1,
  )

  #question(
    [Geometrically, if a line intersects an elliptic curve at points $P$ and $Q$, how is $P+Q$ found?],
    (
      [The third intersection point $R'$],
      [The reflection of the third intersection point across the x-axis],
      [The midpoint between $P$ and $Q$],
      [The reflection of points $P$ and $Q$],
    ),
    1,
  )

  #question(
    [If a vertical line intersects the curve at $P=(x,y)$, what is the other intersection point?],
    (
      [$(x, -y)$],
      [$(-x, y)$],
      [$(-x, -y)$],
      [$(0, 0)$],
    ),
    0,
  )

  #question(
    [What is the result of adding a point $P$ to its inverse $-P$?],
    (
      [$(0,0)$],
      [$2P$],
      [The point at infinity $O$],
      [$P$],
    ),
    2,
  )

  #question(
    [If $P = Q$, how is the line for the group operation determined?],
    (
      [It is the secant line passing through $P$ and $O$],
      [It is the tangent line to the curve at $P$],
      [It is a vertical line],
      [It is undefined],
    ),
    1,
  )

  #question(
    [Why are singular curves (where $Delta = 0$) avoided in ECC?],
    (
      [They have too many points],
      [The discrete logarithm problem becomes trivial (isomorphic to simpler groups)],
      [They cannot be plotted],
      [They do not have an identity element],
    ),
    1,
  )

  #question(
    [Which of the following discriminants represents a singular curve for $y^2 = x^3 + a x + b$?],
    (
      [$-16(4a^3 + 27b^2) = 1$],
      [$-16(4a^3 + 27b^2) = -1$],
      [$-16(4a^3 + 27b^2) = 0$],
      [$-16(4a^3 + 27b^2) = 100$],
    ),
    2,
  )

  #question(
    [Over real numbers, the graph of an elliptic curve is symetric with respect to which axis?],
    (
      [y-axis],
      [x-axis],
      [Line $y=x$],
      [Origin],
    ),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Sketch the curve $y^2 = x^3 - x$ and graphically identify the sum of $P=(-1, 0)$ and $Q=(0, 0)$.
]

#supplementary[
  Prove analytically that if $P=(x, y)$ is on the curve, then $-P = (x, -y)$.
]

#supplementary[
  Given the curve $y^2 = x^3 - 3x + 3$, calculate the discriminant to determine if it is non-singular.
]

#supplementary[
  For the curve $y^2 = x^3 - 7x + 6$, verify that points $P=(2,0)$ and $Q=(-3,0)$ lie on the curve. Compute $P+Q$ using the geometric method description.
]

#supplementary[
  Explain why the intersection of a vertical line $x=c$ with an elliptic curve consists of at most two points in the affine plane.
]

#supplementary[
  Derive the condition $4a^3 + 27b^2 != 0$ starting from the polynomial $f(x) = x^3 + a x + b$ having distinct roots.
]

#supplementary[
  Show that if three points $P, Q, R$ are collinear on an elliptic curve, then $P+Q+R = O$.
]

#supplementary[
  Consider the curve $y^2 = x^3$. Compute its discriminant and identifying the singular point (cusp).
]

#supplementary[
  For $y^2 = x^3 + x^2$ (nodal cubic), find the coordinate of the singularity.
]

#supplementary[
  Why is the "Point at Infinity" necessary for the set of points on an elliptic curve to form a group?
]
