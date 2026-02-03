#import "../../utils.typ": *

== Dual Spaces

=== Theory

#definition("Linear Functional")[
  Let $V$ be a vector space over a field $K$. A *linear functional* (or linear form) is a linear map $f: V arrow K$. That is, for all $u, v in V$ and $c in K$:
  $ f(u + v) = f(u) + f(v) $
  $ f(c v) = c f(v) $
]

#definition("Dual Space")[
  The set of all linear functionals on $V$ forms a vector space called the *dual space* of $V$, denoted by $V^*$.
  $ V^* = "Hom"(V, K) $
]

#definition("Dual Basis")[
  Let $B = {v_1, ..., v_n}$ be a basis for a finite-dimensional vector space $V$. The *dual basis* $B^* = {f_1, ..., f_n}$ of $V^*$ is the unique set of linear functionals such that:
  $ f_i (v_j) = delta_(i j) = cases(1 "if" i = j, 0 "if" i != j) $
  where $delta_(i j)$ is the Kronecker delta.
]

#theorem("Dimension of Dual Space")[
  If $V$ is finite-dimensional, then $dim(V^*) = dim(V)$.
]

=== Solved Problems

#solved_problem[
  Let $V = RR^2$ with basis $B = {v_1=(1,0), v_2=(1,1)}$. Find the dual basis $f_1, f_2$.
]
#solution[
  Let $v = (x, y) in RR^2$. We can write $v$ as a linear combination of $B$:
  $ (x, y) = c_1 v_1 + c_2 v_2 = c_1(1, 0) + c_2(1, 1) = (c_1 + c_2, c_2) $
  So $y = c_2$ and $x = c_1 + c_2 => c_1 = x - y$.
  Thus, $(x, y) = (x-y)v_1 + y v_2$.

  By definition of dual basis:
  $ f_1(v) = c_1 = x - y $
  $ f_2(v) = c_2 = y $

  So the linear functionals are $f_1(x,y) = x - y$ and $f_2(x,y) = y$.
]

=== Supplementary Problems

#supplementary[
  Let $V = P_1[x]$ (polynomials of degree at most 1). Let basis $B = {1, x}$. Find the dual basis relative to the functionals $phi_1(p) = p(0)$ and $phi_2(p) = p(1)$. verify if they form a dual basis.
]

#supplementary[
  Prove that for any $v in V$ (finite dimensional), $v = 0$ if and only if $f(v) = 0$ for all $f in V^*$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [A linear functional is a linear map from:],
    ("$V$ to its field $K$", "$K$ to $V$", "$V$ to $V$", "$K$ to $K$"),
    0,
  )

  #question(
    [The dual space $V^*$ consists of:],
    ("All linear functionals on $V$", "All vectors in $V$", "All subspaces of $V$", "All bases of $V$"),
    0,
  )

  #question(
    [If $dim(V) = n$ (finite), then $dim(V^*) =$ :],
    ("$n$", "$n-1$", "$2n$", "Infinite"),
    0,
  )

  #question(
    [The dual basis ${f_1, ..., f_n}$ satisfies $f_i (v_j) =$ :],
    ("$delta_(i j)$ (Kronecker delta)", "1 for all $i, j$", "0 for all $i, j$", "$i + j$"),
    0,
  )

  #question(
    [The double dual $V^(**)$ is isomorphic to $V$ when:],
    ("$V$ is finite-dimensional", "$V$ is infinite-dimensional", "Never", "Always, regardless of dimension"),
    0,
  )

  #question(
    [The annihilator of a subspace $W subset.eq V$ is:],
    ("${f in V^* : f(w) = 0 \"for all\" w in W}$", "${w in W : f(w) = 0}$", "The zero vector", "The dual of $W$"),
    0,
  )

  #question(
    [If $f in V^*$ and $f != 0$, then $\"ker\"(f)$ has dimension:],
    ("$dim(V) - 1$", "$dim(V)$", "0", "1"),
    0,
  )

  #question(
    [The transpose (or dual) of a linear map $T: V arrow W$ is:],
    ("$T^*: W^* arrow V^*$", "$T^*: V^* arrow W^*$", "$T^*: V arrow W$", "$T^*: K arrow K$"),
    0,
  )

  #question(
    [For $f, g in V^*$ and $c in K$, $(f + g)(v) =$ :],
    ("$f(v) + g(v)$", "$f(v) g(v)$", "$f(v) - g(v)$", "$f(g(v))$"),
    0,
  )

  #question(
    [The evaluation map $"ev"_v: V^* arrow K$ defined by $"ev"_v (f) = f(v)$ is:],
    ("Linear", "Nonlinear", "Undefined", "Bijective only"),
    0,
  )
]

=== Supplementary Problems

#supplementary[
  Let $V = RR^3$ with standard basis. Find the dual basis ${f_1, f_2, f_3}$ and verify $f_i (e_j) = delta_(i j)$.
]

#supplementary[
  Define $f: P_2[x] arrow RR$ by $f(p) = integral_0^1 p(t) dif t$. Show that $f$ is a linear functional.
]

#supplementary[
  Let $W = "span"{(1, 0, 0), (0, 1, 0)}$ in $RR^3$. Find the annihilator $W^0$ in $(RR^3)^*$.
]

#supplementary[
  Prove that if $T: V arrow W$ is injective, then $T^*: W^* arrow V^*$ is surjective.
]

#supplementary[
  Show that the map $Phi: V arrow V^(**)$ defined by $Phi(v)(f) = f(v)$ is linear and injective.
]

#supplementary[
  Let $f, g in V^*$ be linearly independent. Prove that $"ker"(f) inter "ker"(g)$ has dimension $dim(V) - 2$.
]

#supplementary[
  Find a basis for the dual space of $M_2(RR)$ (the space of $2 times 2$ matrices).
]

#supplementary[
  If $dim(V) = 4$ and $W$ is a 2-dimensional subspace, what is $dim(W^0)$?
]

#supplementary[
  Prove that $(W_1 + W_2)^0 = W_1^0 inter W_2^0$ for subspaces $W_1, W_2$ of $V$.
]

#supplementary[
  Let $T: RR^3 arrow RR^2$ be defined by $T(x, y, z) = (x+y, y+z)$. Find the matrix of $T^*$ with respect to the standard bases.
]

