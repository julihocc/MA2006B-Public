#import "../../utils.typ": *
== Appendix: The Point at Infinity <appendix-point-at-infinity>

The phrase *point at infinity* is not meant to describe a very large affine point. It means that we have moved from the affine plane $RR^2$ to the projective plane $PP^2(RR)$, where parallel directions are represented by points with a zero homogenizing coordinate.

=== Projective Coordinates

A point of the real projective plane $PP^2(RR)$ is an equivalence class of nonzero triples
$ [X : Y : Z] $
where
$ [X : Y : Z] = [lambda X : lambda Y : lambda Z] $
for every nonzero real number $lambda$.

The usual affine plane sits inside $PP^2(RR)$ by the map
$ (x,y) mapsto [x : y : 1]. $
Thus points with $Z != 0$ are ordinary affine points: after rescaling, every such point can be written as $[x : y : 1]$.

The points with $Z = 0$ are the points at infinity. They do not correspond to coordinate pairs in $RR^2$.

=== Homogenizing the Curve

Start with the affine short Weierstrass equation
$ y^2 = x^3 + a x + b. $

To place it in projective space, replace $x$ by $X / Z$ and $y$ by $Y / Z$, then multiply by $Z^3$ to clear denominators. This gives the homogeneous equation
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

This is the formal meaning of the symbol $cal(O)$ in the definition of $E(RR)$.

=== Why Vertical Lines Meet at $cal(O)$

A vertical affine line $x = c$ becomes, in projective coordinates,
$ X = c Z. $

At infinity, $Z = 0$, so this equation forces $X = 0$. The only possible projective point with $Z = 0$ and $X = 0$ is
$ [0 : 1 : 0] = cal(O). $

So every vertical line meets the projective closure of the curve at the same point $cal(O)$. This explains the geometric rule
$ P + (-P) = cal(O), $
because $P$ and $-P$ lie on the same vertical line.

=== Computational Remark

In affine formulas, $cal(O)$ is not stored as a coordinate pair because it is not an element of $RR^2$. Implementations therefore represent it separately, for example by a sentinel value such as `None`. The formulas for point addition then handle $cal(O)$ as the identity:
$ P + cal(O) = cal(O) + P = P. $
