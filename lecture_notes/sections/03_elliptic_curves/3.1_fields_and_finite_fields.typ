#import "../../utils.typ": *
== Fields and Finite Fields

=== Theory

#definition("Field")[
  A *field* is a set $F$ with two operations, addition and multiplication, where we can add, subtract, multiply, and divide by any nonzero element.

  More precisely:
  - $(F, +)$ is an abelian group with additive identity $0$.
  - The nonzero elements $F^* = F without {0}$ form an abelian group under multiplication, with multiplicative identity $1$.
  - Multiplication distributes over addition:
    $ a(b+c) = a b + a c. $
]

#note[
  The important practical point is division. In a field, every nonzero element $a$ has an inverse $a^(-1)$, so division by $a$ means multiplication by $a^(-1)$.
]

#example[
  The familiar number systems $QQ$, $RR$, and $CC$ are fields. For example, in $RR$, every nonzero real number $a$ has inverse $a^(-1)$.

  The integers $ZZ$ are not a field because most nonzero integers do not have integer inverses. For instance, there is no integer $x$ such that $2x = 1$.
]

#definition("Finite Field")[
  Let $p$ be prime. The set
  $ FF_p = ZZ_p = {0, 1, 2, ..., p-1} $
  with addition and multiplication performed modulo $p$ is a *finite field*. It has exactly $p$ elements.

  When working in $FF_p$, two numbers that differ by a multiple of $p$ are treated as the same element.
]

#example[
  In $FF_5$, the elements are ${0,1,2,3,4}$. Arithmetic is done modulo 5:
  $ 3 + 4 equiv 7 equiv 2 space (mod 5), $
  $ 3 dot 4 equiv 12 equiv 2 space (mod 5). $
]

#definition("Modular Inverse")[
  In $FF_p$, the *inverse* of a nonzero element $a$ is an element $a^(-1)$ satisfying
  $ a dot a^(-1) equiv 1 space (mod p). $
  Therefore, division by $a$ modulo $p$ means multiplying by $a^(-1)$.
]

#example[
  In $FF_7$, the inverse of $3$ is $5$ because
  $ 3 dot 5 = 15 equiv 1 space (mod 7). $
  Hence
  $ 4 / 3 equiv 4 dot 3^(-1) equiv 4 dot 5 = 20 equiv 6 space (mod 7). $
]

#theorem("Prime Moduli Give Fields")[
  If $p$ is prime, then every nonzero element of $ZZ_p$ has a multiplicative inverse. Therefore $ZZ_p$ is a field.
]

#proof[
  Let $a$ be a nonzero element of $ZZ_p$. Since $p$ is prime and $a$ is not congruent to $0$ modulo $p$, we have $"gcd"(a,p) = 1$. By Bézout's identity (@bezouts-identity), there exist integers $u,v$ such that
  $ a u + p v = 1. $
  Reducing modulo $p$ gives $a u equiv 1 space (mod p)$. Thus $u$ is a multiplicative inverse of $a$ modulo $p$.
]

#example[
  $ZZ_6$ is not a field. The nonzero element $2$ has no inverse modulo 6 because
  $ 2 dot 0 equiv 0, quad 2 dot 1 equiv 2, quad 2 dot 2 equiv 4, quad 2 dot 3 equiv 0, quad 2 dot 4 equiv 2, quad 2 dot 5 equiv 4 space (mod 6). $
  The value $1$ never appears.
]

#definition("Characteristic")[
  The *characteristic* of a field is the smallest positive integer $n$ such that adding $1$ to itself $n$ times gives $0$:
  $ underbrace(1 + 1 + ... + 1)_(n " times") = 0. $
  If no such positive integer exists, the field has characteristic $0$.
]

#example[
  The fields $QQ$, $RR$, and $CC$ have characteristic $0$ because repeated addition of $1$ never gives $0$.

  The finite field $FF_7$ has characteristic $7$ because
  $ 1 + 1 + 1 + 1 + 1 + 1 + 1 equiv 7 equiv 0 space (mod 7). $
]

#note[
  In elliptic-curve formulas we often divide by quantities such as $2y$ or use coefficients involving $3x^2$. For the short Weierstrass form
  $ y^2 = x^3 + a x + b, $
  it is simplest to work over fields where $2$ and $3$ behave like nonzero invertible elements. That is why the finite-field sections assume $p > 3$.
]

=== Solved Problems

#solved_problem[
  Show that $ZZ_5$ is a field by listing the multiplicative inverses of its nonzero elements.
]
#solution[
  The nonzero elements of $ZZ_5$ are $1,2,3,4$.
  - $1^(-1) = 1$ because $1 dot 1 equiv 1 space (mod 5)$.
  - $2^(-1) = 3$ because $2 dot 3 = 6 equiv 1 space (mod 5)$.
  - $3^(-1) = 2$ because $3 dot 2 = 6 equiv 1 space (mod 5)$.
  - $4^(-1) = 4$ because $4 dot 4 = 16 equiv 1 space (mod 5)$.

  Every nonzero element has an inverse, so $ZZ_5$ is a field.
]

#solved_problem[
  Explain why $ZZ_6$ is not a field.
]
#solution[
  In a field, every nonzero element must have a multiplicative inverse. In $ZZ_6$, the element $2$ is nonzero, but no element $x$ satisfies
  $ 2x equiv 1 space (mod 6). $
  Indeed, $2x$ is always even modulo 6, so it can only be congruent to $0$, $2$, or $4$. Therefore $ZZ_6$ is not a field.
]

#solved_problem[
  Compute $3^(-1) mod 7$ and use it to compute $5 / 3$ in $FF_7$.
]
#solution[
  We need $x$ such that $3x equiv 1 space (mod 7)$. Since
  $ 3 dot 5 = 15 equiv 1 space (mod 7), $
  we have $3^(-1) equiv 5 space (mod 7)$.

  Therefore
  $ 5 / 3 equiv 5 dot 3^(-1) equiv 5 dot 5 = 25 equiv 4 space (mod 7). $
]

#solved_problem[
  Compute $8^(-1) mod 13$.
]
#solution[
  We seek $x$ such that $8x equiv 1 space (mod 13)$. Testing $x=5$:
  $ 8 dot 5 = 40 equiv 1 space (mod 13), $
  so $8^(-1) equiv 5 space (mod 13)$.
]

#solved_problem[
  Determine the characteristic of $RR$ and $FF_7$.
]
#solution[
  In $RR$, repeated addition of $1$ gives $1,2,3,...$ and never equals $0$, so $RR$ has characteristic $0$.

  In $FF_7$,
  $ 7 dot 1 = 1 + 1 + 1 + 1 + 1 + 1 + 1 equiv 0 space (mod 7), $
  and no smaller positive number of copies of $1$ gives $0$. Thus $FF_7$ has characteristic $7$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [What distinguishes a field from a general ring?],
    (["Every element has an additive inverse"], ["Every nonzero element has a multiplicative inverse"], ["Multiplication is always repeated addition only"], ["There is no zero element"]),
    1,
  )

  #question(
    [Which of the following is a field?],
    ([$ZZ$], [$ZZ_6$], [$ZZ_5$], ["The even integers"]),
    2,
  )

  #question(
    [In $FF_p$, division by a nonzero element $a$ means:],
    (["Subtracting $a$"], ["Multiplying by $a^(-1)$"], ["Ordinary real-number division"], ["Ignoring $a$"]),
    1,
  )

  #question(
    [What is $3^(-1) mod 7$?],
    ([$2$], [$3$], [$4$], [$5$]),
    3,
  )

  #question(
    [Why is $ZZ_6$ not a field?],
    (["It has too few elements"], ["It has no addition"], ["Some nonzero elements lack multiplicative inverses"], ["It is finite"]),
    2,
  )

  #question(
    [The finite field $FF_p$ has how many elements?],
    ([$p-1$], [$p$], [$p+1$], [$p^2$]),
    1,
  )

  #question(
    [The characteristic of $RR$ is:],
    ([$0$], [$1$], [$2$], ["Undefined"]),
    0,
  )

  #question(
    [The characteristic of $FF_7$ is:],
    ([$0$], [$1$], [$7$], [$14$]),
    2,
  )

  #question(
    [For elliptic curves in short Weierstrass form over $FF_p$, we usually assume:],
    ([$p = 2$], [$p = 3$], [$p > 3$], ["$p$ is composite"]),
    2,
  )

  #question(
    [In $FF_5$, what is $4 + 3$?],
    ([$1$], [$2$], [$7$], [$12$]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  List the multiplicative inverses of all nonzero elements in $ZZ_7$.
]

#supplementary[
  Explain why $ZZ_8$ is not a field by finding a nonzero element with no inverse.
]

#supplementary[
  Compute $6^(-1) mod 11$ and use it to compute $4 / 6$ in $FF_11$.
]

#supplementary[
  Determine the characteristic of $FF_5$, $FF_13$, and $QQ$.
]

#supplementary[
  Show that in $FF_p$, the element $-y$ can also be written as $p-y$ when $y != 0$.
]

#supplementary[
  Explain why the assumption $p > 3$ is convenient for the formulas used in elliptic-curve point addition and doubling.
]
