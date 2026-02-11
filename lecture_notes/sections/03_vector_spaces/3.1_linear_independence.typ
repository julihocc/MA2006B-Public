#import "../../utils.typ": *

== Linear Independence and Bases

=== Theory

#definition("Linear Combination")[
  Let $V$ be a vector space over a field $K$. A vector $v in V$ is a *linear combination* of vectors $v_1, v_2, ..., v_n in V$ if there exist scalars $a_1, a_2, ..., a_n in K$ such that
  $ v = a_1 v_1 + a_2 v_2 + ... + a_n v_n = sum_(i=1)^n a_i v_i $
]

#definition("Span")[
  The *span* of a set of vectors $S = {v_1, ..., v_k}$ is the set of all possible linear combinations of vectors in $S$. It is denoted as $"span"(S)$ or $<S>$, and it forms a subspace of $V$.
]

#definition("Linear Independence")[
  A set of vectors ${v_1, ..., v_k}$ is *linearly independent* if the equation
  $ c_1 v_1 + c_2 v_2 + ... + c_k v_k = 0 $
  has only the trivial solution $c_1 = c_2 = ... = c_k = 0$.

  Otherwise, the set is *linearly dependent*.
]

#definition("Basis")[
  A set $B$ of vectors in $V$ is a *basis* for $V$ if:
  + $B$ is linearly independent.
  + $B$ spans $V$ (i.e., every vector in $V$ can be written as a linear combination of vectors in $B$).
]

#theorem("Dimension")[
  If a vector space $V$ has a basis with $n$ elements, then every basis of $V$ has exactly $n$ elements. This number space $n$ is called the *dimension* of $V$, denoted $dim(V) = n$.
]

=== Solved Problems

#solved_problem[
  Determine if the vectors $v_1 = (1, 2)$ and $v_2 = (3, 4)$ are linearly independent in $RR^2$.
]
#solution[
  We set the linear combination to the zero vector:
  $ c_1 (1, 2) + c_2 (3, 4) = (0, 0) $
  This gives the system:
  $ c_1 + 3c_2 = 0 $
  $ 2c_1 + 4c_2 = 0 $

  From the first equation, $c_1 = -3c_2$. Substituting into the second:
  $ 2(-3c_2) + 4c_2 = -6c_2 + 4c_2 = -2c_2 = 0 => c_2 = 0 $.
  Thus $c_1 = 0$.
  Since the only solution is trivial, the vectors are linearly independent.
]

#solved_problem[
  Find a basis for the subspace of $RR^3$ spanned by $u_1 = (1, 0, 1)$, $u_2 = (1, 1, 1)$, and $u_3 = (2, 1, 2)$.
]

#solution[
  We observe that $u_3 = u_1 + u_2$. Thus, $u_3$ is a linear combination of the others and is redundant for the span.
  The set ${u_1, u_2}$ is linearly independent because $u_2$ is not a scalar multiple of $u_1$.
  Therefore, ${ (1, 0, 1), (1, 1, 1) }$ is a basis for the subspace.
]

=== Supplementary Problems

#supplementary[
  Determine if the polynomials $1, x, x^2$ are linearly independent in the vector space of polynomials $P_2[x]$.
]

#supplementary[
  Find the dimension of the subspace of $RR^4$ spaned by vectors $(1, 0, 0, 1)$, $(0, 1, 1, 0)$, and $(1, 1, 1, 1)$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [A set of vectors is linearly independent if:],
    (
      "The only solution to $c_1 v_1 + ... + c_n v_n = 0$ is all $c_i = 0$",
      "At least one vector is a linear combination of others",
      "All vectors are parallel",
      "The determinant is zero",
    ),
    0,
  )

  #question(
    [The dimension of a vector space is:],
    (
      "The number of vectors in any basis",
      "Always infinite",
      "The number of vectors in the space",
      "The largest coefficient",
    ),
    0,
  )

  #question(
    [If ${v_1, v_2, v_3}$ spans $V$ and is linearly independent, then it is:],
    (
      "A basis for $V$",
      "Not a basis",
      "Linearly dependent",
      "The zero vector",
    ),
    0,
  )

  #question(
    [The standard basis for $RR^3$ consists of:],
    (
      "${(1,0,0), (0,1,0), (0,0,1)}$",
      "${(1,1,1)}$",
      "${(1,0,0), (0,1,0)}$",
      "All unit vectors",
    ),
    0,
  )

  #question(
    [If $dim(V) = n$, then any set of $n+1$ vectors in $V$ is:],
    (
      "Linearly dependent",
      "Linearly independent",
      "A basis",
      "Orthogonal",
    ),
    0,
  )

  #question(
    [The span of the empty set is:],
    (
      "${0}$ (the zero vector)",
      "The entire space",
      "Undefined",
      "The unit sphere",
    ),
    0,
  )

  #question(
    [A basis for $P_2[x]$ (polynomials of degree $<= 2$) has how many elements?],
    ("3", "2", "Infinite", "4"),
    0,
  )

  #question(
    [If $W$ is a subspace of $V$ with $dim(V) = n$, then $dim(W)$:],
    ("$<= n$", "$= n$", "$> n$", "Is always 0"),
    0,
  )

  #question(
    [The coordinate vector of $v$ with respect to basis $B$ is:],
    (
      "The unique scalars expressing $v$ as a linear combination of $B$",
      "The length of $v$",
      "The projection of $v$",
      "Always $(1,1,...,1)$",
    ),
    0,
  )

  #question(
    [The rank of a matrix equals:],
    (
      "The dimension of its column space",
      "The number of rows",
      "The number of columns",
      "The trace",
    ),
    0,
  )
]

=== Supplementary Problems

#supplementary[
  Show that the vectors $(1, 2, 3)$, $(0, 1, 2)$, and $(0, 0, 1)$ form a basis for $RR^3$.
]

#supplementary[
  Find a basis for the null space of the matrix $A = mat(1, 2, 3; 0, 1, 2; 0, 0, 0)$.
]

#supplementary[
  Prove that if ${v_1, ..., v_k}$ is linearly independent and $v_(k+1)$ is not in $"span"{v_1, ..., v_k}$, then ${v_1, ..., v_k, v_(k+1)}$ is linearly independent.
]

#supplementary[
  Determine the dimension of the subspace of $M_2(RR)$ consisting of symmetric $2 times 2$ matrices.
]

#supplementary[
  Express the polynomial $x^2 + 3x + 2$ as a linear combination of the basis ${1, x+1, (x+1)^2}$ for $P_2[x]$.
]

#supplementary[
  Show that the set of all polynomials in $P[x]$ with $p(0) = 0$ forms a subspace and find a basis.
]

#supplementary[
  If $dim(V) = 5$ and $W$ is a 3-dimensional subspace of $V$, what are the possible dimensions of a subspace $U$ such that $V = W plus.circle U$ (direct sum)?
]

#supplementary[
  Prove that any linearly independent set in a finite-dimensional vector space can be extended to a basis.
]

#supplementary[
  Find the coordinate vector of $(5, 7)$ with respect to the basis ${(1, 2), (3, 4)}$ in $RR^2$.
]

#supplementary[
  Show that the functions ${1, cos(x), sin(x)}$ are linearly independent in the vector space of continuous functions on $[0, 2pi]$.
]

