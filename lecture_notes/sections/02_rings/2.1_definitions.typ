#import "../../utils.typ": solution, proof, definition, theorem, proposition, corollary, example, solution
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

#definition(title: "Field")[
  A *field* is a commutative ring with unity where every non-zero element has a multiplicative inverse.
]

=== Examples
#example[
  In $ZZ_(12)$, arithmetic is done modulo 12.
  $ 5 times 7 = 35 equiv 11 (mod 12) $
  Note that $ZZ_(12)$ is not a field because not all elements have inverses (e.g., $2$ has no inverse).
]

#example[
  - *Finite Fields*: $"GF"(p)$ (or $ZZ_p$) where $p$ is prime, are fields widely used in ECC.
  - *Integers modulo n*: $ZZ_n$ is a ring used in RSA.
]

=== Exercises
+ Is $ZZ$ under component-wise addition and multiplication a ring?
#solution[
  The phrasing "component-wise" usually applies to vectors. If referring to $ZZ$, standard addition and multiplication form a ring. If referring to $ZZ times ZZ$, then yes, component-wise operations make it a ring. $ZZ$ itself is a ring.
]
+ Find all units (invertible elements) in the ring $ZZ_(10)$.
#solution[
  Units in $ZZ_n$ are elements coprime to $n$.
  For $n=10$, units are ${1, 3, 7, 9}$.
]
