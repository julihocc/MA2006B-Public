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

