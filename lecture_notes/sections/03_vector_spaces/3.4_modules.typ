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





#definition("Submodule")[
  A subset $N$ of an $R$-module $M$ is a *submodule* if $N$ is a subgroup of $(M, +)$ and is closed under scalar multiplication by elements of $R$ (i.e., $r in R, n in N => r n in N$).
]

=== Solved Problems

=== Solved Problems

#solved_problem[
  Contrast Vector Spaces and Modules. What is their primary structural difference?
]
#solution[
  Every vector space over a field $K$ is a $K$-module. The primary difference is that in a module, the scalars come from a ring (which may not have division), whereas in a vector space they come from a field.
]

#solved_problem[
  Explain how every Abelian group $G$ can be viewed as a module over $ZZ$.
]
#solution[
  For $n in ZZ$ and $g in G$, scalar multiplication $n g$ is defined as repeated addition (if $n > 0$) or subtraction (if $n < 0$).
]

#solved_problem[
  Explain why $ZZ$ is a $ZZ$-module, but not a vector space over $QQ$.
]
#solution[
  $ZZ$ is a ring. Any ring $R$ is an module over itself (with scalar multiplication being the ring multiplication). Thus $ZZ$ is a $ZZ$-module.
  However, for $ZZ$ to be a vector space over $QQ$, we would need to be able to multiply integers by rationals and stay in $ZZ$.
  For example, take scalar $1/2 in QQ$ and vector $3 in ZZ$. Then $(1/2) dot 3 = 3/2$, which is not in $ZZ$.
  Thus, $ZZ$ is not closed under scalar multiplication by $QQ$, so it is not a $QQ$-vector space.
]

=== Supplementary Problems

#supplementary[
  Let $G$ be an abelian group. Show that $G$ becomes a $ZZ$-module if we define $n dot g$ (for $n in ZZ, g in G$) as $g + ... + g$ ($n$ times) if $n > 0$, and as $- (g + ... + g)$ ($-n$ times) if $n < 0$.
]

#supplementary[
  Consider the set of integers modulo 6, $ZZ_6$, as a $ZZ$-module. Find a submodule of $ZZ_6$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [A module is to a ring as a vector space is to a:],
    (
      "Field",
      "Group",
      "Module",
      "Ring",
    ),
    0,
  )

  #question(
    [Every abelian group can be viewed as a module over:],
    (
      "$ZZ$",
      "$QQ$",
      "$RR$",
      "$CC$",
    ),
    0,
  )

  #question(
    [The main difference between modules and vector spaces is:],
    (
      "Modules have scalars from a ring, vector spaces from a field",
      "Modules are finite, vector spaces are infinite",
      "Modules have no addition",
      "Vector spaces have no scalar multiplication",
    ),
    0,
  )

  #question(
    [A submodule of an $R$-module $M$ must be:],
    (
      "A subgroup closed under scalar multiplication by $R$",
      "Any subset of $M$",
      "A ring",
      "A field",
    ),
    0,
  )

  #question(
    [If $R$ is a commutative ring with unity, then $R$ itself is:],
    (
      "An $R$-module",
      "Not a module",
      "A field",
      "A vector space over $QQ$",
    ),
    0,
  )

  #question(
    [A module homomorphism $f: M arrow N$ between $R$-modules satisfies:],
    (
      "$f(r m) = r f(m)$ for all $r in R, m in M$",
      "$f(r m) = f(r) f(m)$",
      "$f(m + n) = f(m) f(n)$",
      "$f(r) = r$ for all $r in R$",
    ),
    0,
  )

  #question(
    [The quotient module $M slash N$ (where $N$ is a submodule) consists of:],
    (
      "Cosets $m + N$ for $m in M$",
      "Elements $m - n$ for $m in M, n in N$",
      "Products $m n$",
      "All submodules of $M$",
    ),
    0,
  )

  #question(
    [A free module over $R$ is one that:],
    (
      "Has a basis (linearly independent spanning set)",
      "Has no elements",
      "Is a field",
      "Has only one element",
    ),
    0,
  )

  #question(
    [The rank of a free module is:],
    (
      "The number of elements in a basis",
      "Always infinite",
      "The number of submodules",
      "Zero",
    ),
    0,
  )

  #question(
    [A finitely generated module is one that:],
    (
      "Can be spanned by finitely many elements",
      "Has finitely many elements",
      "Is a finite ring",
      "Has no generators",
    ),
    0,
  )
]

=== Supplementary Problems

#supplementary[
  Show that $ZZ slash n ZZ$ is a $ZZ$-module for any positive integer $n$.
]

#supplementary[
  Prove that the intersection of two submodules is a submodule.
]

#supplementary[
  Let $M = ZZ times ZZ$ as a $ZZ$-module. Is $N = {(a, 0) : a in ZZ}$ a submodule?
]

#supplementary[
  Show that any vector space over a field $F$ is a free $F$-module.
]

#supplementary[
  Give an example of a $ZZ$-module that is not free.
]

#supplementary[
  Let $f: ZZ arrow ZZ_6$ be defined by $f(n) = n mod 6$. Show that $f$ is a $ZZ$-module homomorphism.
]

#supplementary[
  Prove that the kernel of a module homomorphism is a submodule.
]

#supplementary[
  Determine if $QQ$ is a finitely generated $ZZ$-module.
]

#supplementary[
  Show that $M_n (R)$ (the set of $n times n$ matrices over ring $R$) is an $R$-module.
]

#supplementary[
  Prove the First Isomorphism Theorem for modules: If $f: M arrow N$ is a module homomorphism, then $M slash "ker"(f) tilde.equiv "im"(f)$.
]
