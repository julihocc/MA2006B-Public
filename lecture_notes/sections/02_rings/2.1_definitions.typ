#import "../../utils.typ": *
== Definition and Examples of Rings

=== Theory
#definition(title: "Ring")[
  A *ring* is a set $R$ equipped with two binary operations, usually denoted by $+$ (addition) and $dot$ (multiplication), satisfying:
  + $(R, +)$ is an abelian group (additive identity is $0$, inverse of $a$ is $-a$).
  + $(R, dot)$ satisfies associativity ($a dot (b dot c) = (a dot b) dot c$).
  + Distributive Laws hold: $a dot (b + c) = a dot b + a dot c$ and $(a + b) dot c = a dot c + b dot c$.
]

#definition[
  - If there is a multiplicative identity (denoted $1$ such that $1 dot a = a dot 1 = a$), it is a *ring with unity*.
  - If multiplication is commutative, it is a *commutative ring*.
]

#definition("Field")[
  A *field* is a commutative ring with unity where every non-zero element has a multiplicative inverse.
]

#example[
  - *Finite Fields*: $"GF"(p)$ (or $ZZ_p$) where $p$ is prime, are fields widely used in ECC.
  - *Integers modulo n*: $ZZ_n$ is a ring used in RSA.
]

=== Solved Problems

#solved_problem[
  In the ring $ZZ_(12)$, compute $5 times 7$ and explain why $ZZ_(12)$ is not a field.
]
#solution[
  Arithmetic is done modulo 12:
  $ 5 times 7 = 35 $
  $ 35 = 2(12) + 11 equiv 11 (mod 12) $.

  $ZZ_(12)$ is not a field because not every non-zero element has a multiplicative inverse. For example, consider $2$. There is no integer $x$ such that $2x equiv 1 (mod 12)$ because $2x$ is always even, while $1 + 12k$ is always odd (or simply because $"gcd"(2, 12) != 1$).
]

#solved_problem[
  Consider the set $R = ZZ times ZZ$ with component-wise addition and multiplication. Is $R$ a ring?
]
#solution[
  Yes.
  - Addition $(a,b) + (c,d) = (a+c, b+d)$ forms an abelian group (inherited from $ZZ$).
  - Multiplication $(a,b) dot (c,d) = (a c, b d)$ is associative.
  - Distributivity holds:
    $ (a,b) dot ((c,d) + (e,f)) = (a,b) dot (c+e, d+f) = (a c+a e, b d+b f) $
    $ (a,b)(c,d) + (a,b)(e,f) = (a c, b d) + (a e, b f) = (a c+a e, b d+b f) $
  Thus, it is a ring.
]

#solved_problem[
  Find all units (invertible elements) in the ring $ZZ_(10)$.
]
#solution[
  An element $a in ZZ_n$ is a unit if and only if $"gcd"(a, n) = 1$.
  For $n=10$:
  - $"gcd"(1, 10) = 1$ (Unit)
  - $"gcd"(2, 10) = 2$
  - $"gcd"(3, 10) = 1$ (Unit)
  - $"gcd"(4, 10) = 2$
  - $"gcd"(5, 10) = 5$
  - $"gcd"(6, 10) = 2$
  - $"gcd"(7, 10) = 1$ (Unit)
  - $"gcd"(8, 10) = 2$
  - $"gcd"(9, 10) = 1$ (Unit)

  The group of units is $ZZ_(10)^* = {1, 3, 7, 9}$.
]

=== Supplementary Problems

#supplementary[
  Determine if the set of even integers $2ZZ$ is a ring under standard addition and multiplication. Is it a ring with unity?
]

#supplementary[
  Solve the equation $x^2 - 5x + 6 = 0$ in the ring $ZZ_{12}$. (Hint: There may be more than 2 solutions).
]
