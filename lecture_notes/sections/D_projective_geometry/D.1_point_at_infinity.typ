#import "../../utils.typ": *
== The Point at Infinity <appendix-point-at-infinity>

=== Theory

This section explains the projective-geometric meaning of a point at infinity. The construction is developed first for affine and projective planes, and only afterward applied to the short Weierstrass equation.

#definition("Affine Plane")[
  The *affine plane* over $RR$, denoted $AA^2(RR)$, is a two-dimensional affine space. Formally, it consists of:

  - a set $A$ whose elements are called *points*,
  - a two-dimensional real vector space $V$, and
  - a free and transitive action
    $ A times V -> A, quad (P, v) mapsto P + v. $

  Free and transitive means that for any two points $P,Q in A$, there is a unique vector $v in V$ such that
  $ Q = P + v. $
  This vector is written $arrow(P Q)$ or $Q - P$.
]

#note[
  Points of an affine space are not vectors. The expression $P + Q$ has no intrinsic meaning for affine points. What does make sense is:
  - subtracting two points to obtain a vector, and
  - adding a vector to a point to obtain another point.
]

#definition("Affine Coordinates and Lines")[
  After choosing an origin $O in A$ and a basis of $V$, every point of $A$ receives coordinates $(x,y)$. This identifies $AA^2(RR)$ with $RR^2$ as a set, but the affine structure itself does not choose a preferred origin.

  An *affine line* is a set of the form
  $ L = {P + t v : t in RR}, $
  where $P in A$ and $v in V$ is nonzero. In coordinates, affine lines are exactly the solution sets
  $ L_(alpha,beta,gamma) = {(x,y) in RR^2 : alpha x + beta y = gamma}, quad (alpha,beta) != (0,0). $
]

#example[
  After coordinates have been chosen, $(2,3)$, $(-1,0)$, and $(0,0)$ are affine points, and
  $ 2x - y = 1 $
  is an affine line.
]

#note[
  In the affine plane, distinct parallel lines do not meet. Projective geometry removes this exception by adding one point at infinity for each direction of parallel lines.
]

#definition("Projective Plane")[
  The *projective plane* over $RR$, denoted $PP^2(RR)$, is the set of one-dimensional vector subspaces of $RR^3$:
  $ PP^2(RR) = {ell subset RR^3 : ell " is a one-dimensional vector subspace"}. $

  A nonzero vector $(X,Y,Z) in RR^3$ determines the one-dimensional subspace
  $ RR (X,Y,Z) = {lambda (X,Y,Z) : lambda in RR}. $
]

#definition("Homogeneous Coordinates")[
  The projective point determined by a nonzero vector $(X,Y,Z)$ is written
  $ [X : Y : Z]. $

  Since nonzero scalar multiples determine the same one-dimensional subspace,
  $ [X : Y : Z] = [lambda X : lambda Y : lambda Z] $
  for every nonzero real number $lambda$.
]

#example[
  The three triples
  $ [2 : 3 : 1], quad [4 : 6 : 2], quad [-2 : -3 : -1] $
  represent the same projective point.
]

#definition("Projective Lines and the Line at Infinity")[
  A *projective line* is the set of one-dimensional subspaces contained in a fixed two-dimensional vector subspace of $RR^3$. Equivalently, projective lines are the solution sets of homogeneous linear equations
  $ alpha X + beta Y + gamma Z = 0, quad (alpha,beta,gamma) != (0,0). $

  The usual affine plane sits inside the projective plane by the map
  $ (x,y) mapsto [x : y : 1]. $

  The projective points with $Z != 0$ form the affine chart $Z = 1$. The remaining projective points form the *line at infinity*
  $ L_infinity = {[X : Y : 0] : (X,Y) != (0,0)}. $
]

#note[
  A point of $L_infinity$ records a direction in the affine plane. If an affine line has direction vector $(u,v) != (0,0)$, then its projective completion contains the point at infinity $[u : v : 0]$.
]

#example[
  All vertical affine lines have direction $(0,1)$, so they meet the line at infinity at $[0 : 1 : 0]$. All horizontal affine lines have direction $(1,0)$, so they meet the line at infinity at $[1 : 0 : 0]$.
]

#definition("Homogenization")[
  Let $f(x,y)$ be a polynomial of total degree $d$. Its *homogenization* is
  $ F(X,Y,Z) = Z^d f(X / Z, Y / Z), $
  after simplifying so that $F$ is a polynomial in $X,Y,Z$.

  The projective equation
  $ F(X,Y,Z) = 0 $
  extends the affine equation $f(x,y)=0$. On the affine chart $Z = 1$, it becomes
  $ F(X,Y,1) = f(X,Y). $
]

#note[
  The extra solutions of $F(X,Y,Z)=0$ with $Z = 0$ are the points at infinity of the affine curve $f(x,y)=0$.
]

#proposition("Point at Infinity of the Short Weierstrass Equation")[
  The projective closure of the affine equation
  $ y^2 = x^3 + a x + b $
  has exactly one point at infinity, namely
  $ cal(O) = [0 : 1 : 0]. $
]

#proof[
  The polynomial $y^2 - x^3 - a x - b$ has total degree $3$, so its homogenization is
  $ Y^2 Z = X^3 + a X Z^2 + b Z^3. $

  To find the points at infinity, set $Z = 0$:
  $ Y^2 dot 0 = X^3 + a X dot 0^2 + b dot 0^3. $
  Hence $0 = X^3$, so $X = 0$.

  The coordinate $Y$ cannot also be zero because $[0 : 0 : 0]$ is not a projective point. Therefore $Y != 0$, and all such triples are equivalent:
  $ [0 : Y : 0] = [0 : 1 : 0]. $

  Thus the unique point at infinity is $cal(O) = [0 : 1 : 0]$.
]

#example[
  A vertical affine line $x = c$ becomes, in projective coordinates,
  $ X = c Z. $
  At infinity, $Z = 0$, so this equation forces $X = 0$. Therefore every vertical affine line has the same point at infinity:
  $ [0 : 1 : 0] = cal(O). $
]

#note[
  In affine coordinates, $cal(O)$ is not a coordinate pair in $RR^2$. Any computation that stores only affine coordinate pairs must represent this projective point separately, for example by a sentinel value such as `None`.
]

=== Solved Problems

#solved_problem[
  Homogenize the affine equation $y^2 = x^3 + a x + b$.
]
#solution[
  Move all terms to one side:
  $ f(x,y) = y^2 - x^3 - a x - b. $
  The total degree is $3$. Homogenizing to degree $3$ gives
  $ F(X,Y,Z) = Y^2 Z - X^3 - a X Z^2 - b Z^3. $
  Hence the projective equation is
  $ Y^2 Z = X^3 + a X Z^2 + b Z^3. $
]

#solved_problem[
  Find the point at infinity on the projective closure of $y^2 = x^3 - x + 1$.
]
#solution[
  Here $a=-1$ and $b=1$, so the projective equation is
  $ Y^2 Z = X^3 - X Z^2 + Z^3. $
  Set $Z = 0$:
  $ 0 = X^3. $
  Thus $X = 0$. Since $[0:0:0]$ is not allowed, $Y != 0$, so the point is
  $ [0 : 1 : 0]. $
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [A point of $PP^2(RR)$ is:],
    ([A vector in $RR^2$], [A one-dimensional subspace of $RR^3$], [A two-dimensional matrix], [A real number]),
    1,
  )

  #question(
    [In homogeneous coordinates, $[X:Y:Z]$ and $[lambda X:lambda Y:lambda Z]$ represent the same point when:],
    ([$lambda = 0$], [$lambda != 0$], [$lambda = 1$ only], [$Z = 1$]),
    1,
  )

  #question(
    [The affine chart corresponding to the usual coordinate plane is:],
    ([$X = 0$], [$Y = 0$], [$Z = 1$], [$Z = 0$]),
    2,
  )

  #question(
    [The line at infinity in these coordinates is:],
    ([$X = 0$], [$Y = 0$], [$Z = 0$], [$X + Y = 0$]),
    2,
  )

  #question(
    [The point at infinity of $y^2 = x^3 + a x + b$ is:],
    ([$[1:0:0]$], [$[0:1:0]$], [$[0:0:1]$], [$[1:1:1]$]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Homogenize the affine equation $y = x^2 + 1$.
]

#supplementary[
  Find the point at infinity of the projective closure of $y^2 = x^3 + 2x + 3$.
]

#supplementary[
  Show that all affine lines with direction vector $(u,v)$ meet the line at infinity at $[u:v:0]$.
]
