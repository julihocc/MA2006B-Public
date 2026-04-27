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



=== Solved Problems

#solved_problem[
  Give examples of a standard commutative ring, a ring without unity, and a non-commutative ring.
]
#solution[
  - The set of integers $ZZ$ with standard addition and multiplication is a commutative ring.
  - The set of even integers $2ZZ$ is a ring but has no multiplicative identity (unity).
  - The set of $n times n$ matrices $M_n(RR)$ is a non-commutative ring.
]

#solved_problem[
  Compare the rings $ZZ$, $2ZZ$, and $M_2(RR)$ in terms of commutativity and having a multiplicative unity.
]
#solution[
  - The ring of integers $ZZ$ is a commutative ring with unity $1$.
  - The ring of even integers $2ZZ$ is a commutative ring but has no multiplicative identity.
  - The ring of $2 times 2$ matrices $M_2(RR)$ has a unity (the identity matrix $I$) but is not commutative.
]

#solved_problem[
  Give an example of a finite field and a commonly used ring in cryptography.
]
#solution[
  - *Finite Fields*: $"GF"(p)$ (or $ZZ_p$) where $p$ is prime, are fields widely used in ECC (Elliptic Curve Cryptography).
  - *Integers modulo n*: $ZZ_n$ is a ring used in RSA encryption.
]

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

  The group of units is $ZZ_(10)^* = \{1, 3, 7, 9\}$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [Which set is NOT a ring under standard addition and multiplication?],
    ("Integers", "Natural Numbers", "Rational Numbers", "Complex Numbers"),
    1,
  )

  #question(
    [A ring $(R, +, dot)$ must form which structure under addition?],
    ("Semigroup", "Monoid", "Abelian Group", "Cyclic Group"),
    2,
  )

  #question(
    [In a ring, the distributive law connects which two operations?],
    (
      "Addition and Subtraction",
      "Multiplication and Division",
      "Multiplication over Addition",
      "Addition over Multiplication",
    ),
    2,
  )

  #question(
    [Which element is the multiplicative identity in a ring with unity?],
    ("0", "1", "-1", "e"),
    1,
  )

  #question(
    [A Commutative Ring requires which operation to be commutative?],
    ("Addition", "Subtraction", "Multiplication", "Division"),
    2,
  )

  #question(
    [A Field is a commutative ring with unity where every non-zero element has a:],
    ("Additive inverse", "Multiplicative inverse", "Zero divisor", "Polynomial root"),
    1,
  )

  #question(
    [Which of the following is a finite field?],
    ([$ZZ_(12)$], [$ZZ_(10)$], [$ZZ_(7)$], [$ZZ$]),
    2,
  )

  #question(
    [Zero divisors are non-zero elements $a, b$ such that:],
    ([$a + b = 0$], [$a dot b = 1$], [$a dot b = 0$], [$a = b$]),
    2,
  )

  #question(
    [An Integral Domain is a commutative ring with unity and no:],
    ("Inverses", "Ideals", "Zero Divisors", "Subrings"),
    2,
  )

  #question(
    [The characteristic of a ring is the smallest positive integer $n$ such that:],
    ([$n dot 1 = 0$], [$n dot a = 1$], [$a^n = 0$], [$a^n = 1$]),
    0,
  )
]

=== Supplementary Problems

#supplementary[
  Determine if the set of even integers $2ZZ$ is a ring under standard addition and multiplication. Is it a ring with unity?
]

#supplementary[
  Solve the equation $x^2 - 5x + 6 = 0$ in the ring $ZZ_(12)$. (Hint: There may be more than 2 solutions).
]

#supplementary[
  Prove that in any ring $R$, $0 dot x = 0$ for all $x in R$.
]

#supplementary[
  Show that the set of matrices of the form $mat(a, b; 0, c)$ forms a subring of $M_2(RR)$.
]

#supplementary[
  Determine the units of the ring $ZZ_(12)$.
]

#supplementary[
  Give an example of a ring that is not commutative and has no unity.
]

#supplementary[
  Prove that if $R$ is a ring with unity, then $(-1) dot a = -a$ for all $a in R$.
]

#supplementary[
  Find all zero divisors in the ring $ZZ_(12)$.
]

#supplementary[
  An element $a$ in a ring is *idempotent* if $a^2 = a$. Find all idempotent elements in $ZZ_(10)$.
]

#supplementary[
  Prove that the intersection of two subrings of $R$ is also a subring of $R$.
]
