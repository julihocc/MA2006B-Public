#import "../../utils.typ": *

== Inner Product Spaces

=== Theory

#definition("Inner Product")[
  Let $V$ be a vector space over a field $K$ (where $K$ is $RR$ or $CC$). An *inner product* on $V$ is a function $chevron.l dot, dot chevron.r: V times V arrow K$ that satisfies the following axioms for all $u, v, w in V$ and $c in K$:
  + *Linearity*: $chevron.l u + v, w chevron.r = chevron.l u, w chevron.r + chevron.l v, w chevron.r$ and $chevron.l c u, v chevron.r = c chevron.l u, v chevron.r$.
  + *Symmetry (Real)*: $chevron.l u, v chevron.r = chevron.l v, u chevron.r$ (if $K=RR$).
  + *Hermitian Symmetry (Complex)*: $chevron.l u, v chevron.r = overline({chevron.l v, u chevron.r})$ (if $K=CC$).
  + *Positive Definiteness*: $chevron.l v, v chevron.r >= 0$ and $chevron.l v, v chevron.r = 0$ if and only if $v = 0$.
]

#definition("Norm")[
  The *norm* (or length) of a vector $v$ induced by the inner product is defined as:
  $ ||v|| = sqrt({chevron.l v, v chevron.r}) $
]

#definition("Orthogonality")[
  Two vectors $u$ and $v$ are *orthogonal* if $chevron.l u, v chevron.r = 0$.
  A set of vectors is *orthogonal* if every pair of distinct vectors is orthogonal. It is *orthonormal* if it is orthogonal and every vector has norm 1.
]

#theorem("Gram-Schmidt Process")[
  Every finite-dimensional inner product space has an orthonormal basis. The Gram-Schmidt process constructs such a basis from an arbitrary basis.
]

=== Solved Problems

#solved_problem[
  In $RR^2$ with the standard dot product, let $u = (1, 2)$. Find a vector $v$ orthogonal to $u$.
]
#solution[
  Let $v = (x, y)$. We require $chevron.l u, v chevron.r = 0$.
  $ 1(x) + 2(y) = 0 => x + 2y = 0 $
  We can choose $y = 1$, then $x = -2$.
  So $v = (-2, 1)$ is orthogonal to $u$.
  Check: $1(-2) + 2(1) = -2 + 2 = 0$.
]

#solved_problem[
  Compute the norm of $v = (3, 4)$ in $RR^2$ with the standard Euclidean inner product.
]
#solution[
  $ ||v|| = sqrt(3^2 + 4^2) = sqrt(9 + 16) = sqrt(25) = 5 $
]

=== Supplementary Problems

#supplementary[
  Use the Gram-Schmidt process to find an orthogonal basis for $RR^2$ starting with basis vectors $(1, 1)$ and $(0, 2)$.
]

#supplementary[
  Show that if $u$ is orthogonal to $v$, then $||u + v||^2 = ||u||^2 + ||v||^2$. (Pythagorean Theorem)
]
