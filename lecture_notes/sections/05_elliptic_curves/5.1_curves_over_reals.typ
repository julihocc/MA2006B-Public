#import "../../utils.typ": *

== Curvas elípticas sobre los reales

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

=== Supplementary Problems

#supplementary[
  Sketch the curve $y^2 = x^3 - x$ and graphically identify the sum of $P=(-1, 0)$ and $Q=(0, 0)$.
]

#supplementary[
  Prove analytically that if $P=(x, y)$ is on the curve, then $-P = (x, -y)$.
]
