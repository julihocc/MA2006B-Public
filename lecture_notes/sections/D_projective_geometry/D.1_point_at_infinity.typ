#import "../../utils.typ": *
== The Point at Infinity <appendix-point-at-infinity>

The phrase *point at infinity* is not meant to describe a very large point. It comes from projective geometry: an affine plane can be enlarged by adding extra points that record directions of parallel lines. This section first develops that geometric construction independently, and only afterward applies it to the short Weierstrass equation.

=== The Affine Plane

The *affine plane* over $RR$, denoted $AA^2(RR)$, is a two-dimensional *affine space*. Formally, it consists of:

- a set $A$ whose elements are called *points*,
- a two-dimensional real vector space $V$, and
- a free and transitive action
  $ A times V -> A, quad (P, v) mapsto P + v. $

Free and transitive means that for any two points $P,Q in A$, there is a unique vector $v in V$ such that
$ Q = P + v. $
This vector is written $arrow(P Q)$ or $Q - P$.

The important point is that points of $A$ cannot be added to each other. The expression $P + Q$ has no intrinsic meaning for affine points. What does make sense is subtracting two points to obtain a vector, or adding a vector to a point to obtain another point.

After choosing an origin $O in A$ and a basis of $V$, every point of $A$ receives coordinates $(x,y)$, so $AA^2(RR)$ can be represented by $RR^2$. This coordinate representation is convenient, but it is not the structure itself. The affine structure remembers points, displacement vectors between points, and parallelism, but it does not choose a preferred origin.

An affine line is obtained by choosing a point $P in A$ and a nonzero vector $v in V$:
$ L = {P + t v : t in RR}. $
In coordinates, affine lines are exactly the solution sets
$ L_(alpha,beta,gamma) = {(x,y) in RR^2 : alpha x + beta y = gamma}, quad (alpha,beta) != (0,0). $

For example, after coordinates have been chosen, $(2,3)$, $(-1,0)$, and $(0,0)$ are affine points, and $2x - y = 1$ is an affine line.

The affine plane is excellent for computation, but it has one geometric limitation: distinct parallel lines do not meet. Projective geometry removes this exception by adding one point at infinity for each direction of parallel lines.

=== The Projective Plane

The *projective plane* over $RR$, denoted $PP^2(RR)$, is the set of one-dimensional vector subspaces of $RR^3$:
$ PP^2(RR) = {ell subset RR^3 : ell " is a one-dimensional vector subspace"}. $

A nonzero vector $(X,Y,Z) in RR^3$ determines the one-dimensional subspace
$ RR (X,Y,Z) = {lambda (X,Y,Z) : lambda in RR}. $
This projective point is written in *homogeneous coordinates* as
$ [X : Y : Z] $
and
$ [X : Y : Z] = [lambda X : lambda Y : lambda Z] $
for every nonzero real number $lambda$.

Thus the three triples
$ [2 : 3 : 1], quad [4 : 6 : 2], quad [-2 : -3 : -1] $
represent the same projective point.

Projective lines are defined similarly. A projective line is the set of one-dimensional subspaces contained in a fixed two-dimensional vector subspace of $RR^3$. Equivalently, projective lines are the solution sets of homogeneous linear equations
$ alpha X + beta Y + gamma Z = 0, quad (alpha,beta,gamma) != (0,0). $

The usual affine plane sits inside the projective plane by the map
$ (x,y) mapsto [x : y : 1]. $
Thus projective points with $Z != 0$ form an affine chart: after rescaling, every such point can be written uniquely as $[x : y : 1]$.

The remaining projective points have $Z = 0$. They form the *line at infinity*
$ L_infinity = {[X : Y : 0] : (X,Y) != (0,0)}. $
These points do not correspond to coordinate pairs in $RR^2$.

Each point of $L_infinity$ records a direction in the affine plane. If an affine line has direction vector $(u,v) != (0,0)$, then its projective completion contains the point at infinity $[u : v : 0]$. Therefore all vertical affine lines, whose direction is $(0,1)$, meet at $[0 : 1 : 0]$, while all horizontal affine lines, whose direction is $(1,0)$, meet at $[1 : 0 : 0]$.

=== Homogenizing an Affine Equation

Projective coordinates only determine a point up to nonzero scalar multiplication, so equations in projective space must be *homogeneous*: every term must have the same total degree.

Let $f(x,y)$ be a polynomial of total degree $d$. Its homogenization is
$ F(X,Y,Z) = Z^d f(X / Z, Y / Z), $
after simplifying so that $F$ is a polynomial in $X,Y,Z$.

The projective equation
$ F(X,Y,Z) = 0 $
extends the affine equation $f(x,y)=0$. Indeed, on the affine chart $Z = 1$, it becomes
$ F(X,Y,1) = f(X,Y). $

The extra solutions with $Z = 0$ are the points at infinity of the affine curve.

=== The Short Weierstrass Equation

Now consider the affine equation
$ y^2 = x^3 + a x + b. $
At first, this equation describes only its affine solutions: the pairs $(x,y) in AA^2(RR)$ that satisfy the equation.

To understand whether this affine equation has points at infinity, we pass from the affine plane to the projective plane.

=== Homogenizing the Equation

Start with the affine short Weierstrass equation
$ y^2 = x^3 + a x + b. $

The polynomial $y^2 - x^3 - a x - b$ has total degree $3$, so we homogenize to degree $3$. This gives
$ Y^2 Z = X^3 + a X Z^2 + b Z^3. $

The projective curve is therefore
$ E: Y^2 Z = X^3 + a X Z^2 + b Z^3 quad "in" PP^2(RR). $

If $Z != 0$, we can rescale to $Z = 1$, and the equation becomes
$ Y^2 = X^3 + a X + b, $
which is exactly the original affine equation.

=== Finding the Point at Infinity

To find the points at infinity on the projective curve, set $Z = 0$ in the homogeneous equation:
$ Y^2 dot 0 = X^3 + a X dot 0^2 + b dot 0^3. $

Hence
$ 0 = X^3, $
so $X = 0$.

The coordinate $Y$ cannot also be zero, because $[0 : 0 : 0]$ is not a projective point. Therefore $Y != 0$, and all such triples are equivalent:
$ [0 : Y : 0] = [0 : 1 : 0]. $

Thus the short Weierstrass curve has exactly one point at infinity:
$ cal(O) = [0 : 1 : 0]. $

This is the formal meaning of the symbol $cal(O)$ used in the main text.

=== Vertical Lines and $cal(O)$

A vertical affine line $x = c$ becomes, in projective coordinates,
$ X = c Z. $

At infinity, $Z = 0$, so this equation forces $X = 0$. The only possible projective point with $Z = 0$ and $X = 0$ is
$ [0 : 1 : 0] = cal(O). $

So every vertical affine line has the same point at infinity, namely $cal(O)$. This statement is purely projective-geometric: it says where vertical affine lines meet the line at infinity after passing to $PP^2(RR)$.

=== Computational Remark

In affine coordinates, $cal(O)$ is not stored as a coordinate pair because it is not an element of $RR^2$. Implementations that work only with affine coordinate pairs must therefore represent this projective point separately, for example by a sentinel value such as `None`.
