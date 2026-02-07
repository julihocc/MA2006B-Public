#import "../../utils.typ": *

== Inner Product Spaces

=== Theory

#definition("Inner Product")[
  Let $V$ be a vector space over field $F$ (where $F$ is $RR$ or $CC$). An *inner product* on $V$ is a function $chevron.l dot, dot chevron.r: V times V arrow F$ such that for all $u, v, w in V$ and scalar $c in F$:
  + *Linearity in first argument*: $chevron.l u + v, w chevron.r = chevron.l u, w chevron.r + chevron.l v, w chevron.r$ and $chevron.l c u, v chevron.r = c chevron.l u, v chevron.r$.
  + *Symmetry* (or Conjugate Symmetry): $chevron.l u\, v chevron.r = overline(chevron.l v\, u chevron.r)$ (for $RR$, $chevron.l u\, v chevron.r = chevron.l v\, u chevron.r$).
  + *Positive Definiteness*: $chevron.l v, v chevron.r >= 0$, and $chevron.l v, v chevron.r = 0$ if and only if $v = 0$.
]

#definition("Norm")[
  The *norm* (or length) of a vector $v$ induced by the inner product is $||v|| = sqrt(chevron.l v\, v chevron.r)$.
]

#theorem("Cauchy-Schwarz Inequality")[
  For all $u, v in V$:
  $ |chevron.l u, v chevron.r| <= ||u|| ||v|| $
]

#definition("Orthogonality")[
  Two vectors $u, v$ are *orthogonal* if $chevron.l u, v chevron.r = 0$.
  A set of vectors is *orthogonal* if all pairs of distinct vectors are orthogonal.
  A set is *orthonormal* if it is orthogonal and every vector has norm 1.
]

#algorithm("Gram-Schmidt Process")[
  Given a basis ${v_1, ..., v_n}$, we can construct an orthogonal basis ${u_1, ..., u_n}$ as follows:
  $ u_1 = v_1 $
  $ u_2 = v_2 - (chevron.l v_2, u_1 chevron.r)/(||u_1||^2) u_1 $
  $ ... $
  $ u_k = v_k - sum_(j=1)^(k-1) (chevron.l v_k, u_j chevron.r)/(||u_j||^2) u_j $
  To get an orthonormal basis ${e_1, ..., e_n}$, set $e_i = u_i / ||u_i||$.
]

=== Solved Problems

#solved_problem[
  Let $V = RR^2$ with inner product $chevron.l x, y chevron.r = 2x_1 y_1 + x_2 y_2$. Verify this is an inner product.
]
#solution[
  Let $x = (x_1, x_2), y = (y_1, y_2), z = (z_1, z_2)$.
  1. *Symmetry*: $chevron.l x, y chevron.r = 2x_1 y_1 + x_2 y_2 = 2y_1 x_1 + y_2 x_2 = chevron.l y, x chevron.r$.
  2. *Linearity*: $chevron.l x+z, y chevron.r = 2(x_1+z_1)y_1 + (x_2+z_2)y_2 = (2x_1 y_1 + x_2 y_2) + (2z_1 y_1 + z_2 y_2)$.
  3. *Positive Definite*: $chevron.l x, x chevron.r = 2x_1^2 + x_2^2$. Since squares are non-negative, this is $>= 0$. It is 0 iff $x_1=0$ and $x_2=0$, i.e., $x=0$.
  So it is an inner product.
]

#supplementary[
  Use the Gram-Schmidt process to find an orthogonal basis for $RR^2$ starting with basis vectors $(1, 1)$ and $(0, 2)$.
]

#supplementary[
  Show that if $u$ is orthogonal to $v$, then $||u + v||^2 = ||u||^2 + ||v||^2$. (Pythagorean Theorem)
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [An inner product on a real vector space $V$ is a function $chevron.l dot, dot chevron.r: V times V arrow RR$ that is:],
    (
      "Symmetric, linear in first argument, and positive definite",
      "Antisymmetric and bilinear",
      "Only linear",
      "A norm",
    ),
    0,
  )

  #question(
    [The Cauchy-Schwarz inequality states that:],
    (
      "$|chevron.l u, v chevron.r| <= ||u|| ||v||$",
      "$chevron.l u, v chevron.r = ||u|| + ||v||$",
      "$||u + v|| <= ||u|| + ||v||$",
      "$chevron.l u, v chevron.r >= 0$",
    ),
    0,
  )

  #question(
    [Two vectors $u$ and $v$ are orthogonal if:],
    (
      "$chevron.l u, v chevron.r = 0$",
      "$||u|| = ||v||$",
      "$u = v$",
      "$u + v = 0$",
    ),
    0,
  )

  #question(
    [The Gram-Schmidt process is used to:],
    (
      "Construct an orthonormal basis from any basis",
      "Find eigenvalues",
      "Solve linear systems",
      "Compute determinants",
    ),
    0,
  )

  #question(
    [An orthonormal basis ${e_1, ..., e_n}$ satisfies:],
    (
      "$chevron.l e_i, e_j chevron.r = delta_(i j)$",
      "$chevron.l e_i, e_j chevron.r = 1$ for all $i, j$",
      "$||e_i|| = i$",
      "$e_i = e_j$ for all $i, j$",
    ),
    0,
  )

  #question(
    [The orthogonal projection of $v$ onto $u$ is:],
    (
      "$\"proj\"_u (v) = (chevron.l v, u chevron.r)/(||u||^2) u$",
      "$\"proj\"_u (v) = chevron.l v, u chevron.r$",
      "$\"proj\"_u (v) = v - u$",
      "$\"proj\"_u (v) = ||v|| u$",
    ),
    0,
  )

  #question(
    [In $RR^n$ with the standard inner product, $chevron.l x, y chevron.r =$ :],
    (
      "$sum_(i=1)^n x_i y_i$",
      "$sum_(i=1)^n (x_i - y_i)$",
      "$max{x_i y_i}$",
      "$x_1 y_1$",
    ),
    0,
  )

  #question(
    [The orthogonal complement $W^perp$ of a subspace $W$ consists of:],
    (
      "All vectors orthogonal to every vector in $W$",
      "All vectors in $W$",
      "The zero vector only",
      "All vectors parallel to $W$",
    ),
    0,
  )

  #question(
    [If $dim(V) = n$ and $dim(W) = k$, then $dim(W^perp) =$ :],
    (
      "$n - k$",
      "$k$",
      "$n + k$",
      "0",
    ),
    0,
  )

  #question(
    [A matrix $A$ is orthogonal if:],
    (
      "$A^T A = I$",
      "$A^2 = I$",
      "$A = A^T$",
      "$det(A) = 0$",
    ),
    0,
  )
]

=== Supplementary Problems

#supplementary[
  Verify that $chevron.l p, q chevron.r = integral_0^1 p(x) q(x) dif x$ defines an inner product on $P[x]$.
]

#supplementary[
  Apply Gram-Schmidt to ${(1, 1, 0), (1, 0, 1), (0, 1, 1)}$ in $RR^3$ with standard inner product.
]

#supplementary[
  Find the orthogonal projection of $v = (1, 2, 3)$ onto $W = "span"{(1, 0, 0), (0, 1, 0)}$ in $RR^3$.
]

#supplementary[
  Prove that if ${u_1, ..., u_k}$ is orthonormal, then $||sum_(i=1)^k c_i u_i||^2 = sum_(i=1)^k c_i^2$ (Parseval's identity).
]

#supplementary[
  Show that the distance from a point $v$ to a subspace $W$ is $||v - "proj"_W (v)||$.
]

#supplementary[
  Let $W = {(x, y, z) in RR^3 : x + y + z = 0}$. Find a basis for $W^perp$.
]

#supplementary[
  Prove that $(W^perp)^perp = W$ for any subspace $W$ of a finite-dimensional inner product space.
]

#supplementary[
  Find an orthonormal basis for the subspace of $RR^4$ spanned by ${(1, 1, 0, 0), (1, 0, 1, 0)}$.
]

#supplementary[
  Show that if $A$ is an orthogonal matrix, then $det(A) = plus.minus 1$.
]

#supplementary[
  Prove the parallelogram law: $||u + v||^2 + ||u - v||^2 = 2(||u||^2 + ||v||^2)$.
]
