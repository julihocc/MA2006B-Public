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

