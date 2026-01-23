#import "../../utils.typ": *

== Modules

=== Theory

#definition("Module")[
  Let $R$ be a ring. A *left $R$-module* $M$ is an abelian group $(M, +)$ equipped with an operation $dot: R times M arrow M$ (scalar multiplication) such that for all $r, s in R$ and $m, n in M$:
  + $r dot (m + n) = r dot m + r dot n$
  + $(r + s) dot m = r dot m + s dot m$
  + $(r s) dot m = r dot (s dot m)$
  + $1_R dot m = m$ (if $R$ has a multiplicative identity $1_R$)
]

#example[
  *Vector Spaces*: Every vector space cover a field $K$ is a $K$-module. The difference is just that in a module, the scalars come from a ring (which may not have division), whereas in a vector space they come from a field.
]

#example[
  *Abelian Groups*: Every abelian group $G$ can be viewed as a $ZZ$-module.
  For $n in ZZ$ and $g in G$, $n g$ is defined as repeated addition (if $n > 0$) or subtraction (if $n < 0$).
]

#definition("Submodule")[
  A subset $N$ of an $R$-module $M$ is a *submodule* if $N$ is a subgroup of $(M, +)$ and is closed under scalar multiplication by elements of $R$ (i.e., $r in R, n in N => r n in N$).
]

=== Solved Problems

#solved_problem[
  Explain why $ZZ$ is a $ZZ$-module, but not a vector space over $QQ$.
]
#solution[
  $ZZ$ is a ring. Any ring $R$ is an module over itself (with scalar multiplication being the ring multiplication). Thus $ZZ$ is a $ZZ$-module.
  However, for $ZZ$ to be a vector space over $QQ$, we would need to be able to multiply integers by rationals and stay in $ZZ$.
  For example, take scalar $1/2 in QQ$ and vector $3 in ZZ$. Then $(1/2) dot 3 = 3/2$, which is not in $ZZ$.
  Thus, $ZZ$ is not closed under scalar multiplication by $QQ$, so it is not a $QQ$-vector space.
]
