#import "../../utils.typ": *

== Inner Product Spaces

=== Theory

#definition("Inner Product")[
  Let $V$ be a vector space over a field $K$ (where $K$ is $RR$ or $CC$). An *inner product* on $V$ is a function $angle.l dot, dot angle.r: V times V arrow K$ that satisfies the following axioms for all $u, v, w in V$ and $c in K$:
  + *Linearity*: $angle.l u + v, w angle.r = angle.l u, w angle.r + angle.l v, w angle.r$ and $angle.l c u, v angle.r = c angle.l u, v angle.r$.
  + *Symmetry (Real)*: $angle.l u, v angle.r = angle.l v, u angle.r$ (if $K=RR$).
  + *Hermitian Symmetry (Complex)*: $angle.l u, v angle.r = overline({angle.l v, u angle.r})$ (if $K=CC$).
  + *Positive Definiteness*: $angle.l v, v angle.r >= 0$ and $angle.l v, v angle.r = 0$ if and only if $v = 0$.
]

#definition("Norm")[
  The *norm* (or length) of a vector $v$ induced by the inner product is defined as:
  $ ||v|| = sqrt({angle.l v, v angle.r}) $
]

#definition("Orthogonality")[
  Two vectors $u$ and $v$ are *orthogonal* if $angle.l u, v angle.r = 0$.
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
  Let $v = (x, y)$. We require $angle.l u, v angle.r = 0$.
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
