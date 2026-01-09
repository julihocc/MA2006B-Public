#import "../../utils.typ": *
== Homomorphisms

=== Theory
#definition("Homomorphism")[
  A *homomorphism* is a structure-preserving map between two algebraic structures. Let $(G, dot)$ and $(H, *)$ be groups. A function $phi: G arrow H$ is a group homomorphism if for all $a, b in G$:
  $ phi(a dot b) = phi(a) * phi(b) $
]

#proposition("Properties of Homomorphisms")[
  - $phi(e_G) = e_H$ (maps identity to identity)
  - $phi(a^(-1)) = phi(a)^(-1)$ (maps inverses to inverses)

  #proof[
    1. $phi(e_G) = phi(e_G dot e_G) = phi(e_G) * phi(e_G)$. Multiplying by $phi(e_G)^(-1)$ gives $e_H = phi(e_G)$.
    2. $e_H = phi(e_G) = phi(a dot a^(-1)) = phi(a) * phi(a^(-1))$. Thus $phi(a^(-1))$ is the inverse of $phi(a)$.
  ]
]

#definition(title: "Kernel")[
  The *Kernel* of $phi$, denoted $ker(phi)$, is the set ${g in G | phi(g) = e_H}$. It is always a normal subgroup of $G$.
]

=== Examples
#example[
  Consider $phi: ZZ arrow ZZ_n$ defined by $phi(x) = x mod n$.
  Check homomorphism property:
  $phi(x+y) = (x+y) mod n = (x mod n + y mod n) mod n = phi(x) +_n phi(y)$.
  Thus, it is a homomorphism.
]

#example[
  *Homomorphic Encryption*: Homomorphisms are implicit in many reduction steps in cryptography. For example, the security reduction of many protocols relies on mapping a complex problem instance to another structure where relations are preserved. They are also fundamental in constructing "Homomorphic Encryption" schemes, where computations can be performed on encrypted data ($phi("enc"(m_1) dot "enc"(m_2)) = phi("enc"(m_1 dot m_2))$), allowing operations on the ciphertext to map to operations on the plaintext.
]

=== Exercises
#exercise[
  Let $phi: RR^* arrow RR^*$ be defined by $phi(x) = |x|$. Is $phi$ a homomorphism under multiplication?
]
#solution[
  Check if $phi(x y) = phi(x)phi(y)$.
  $phi(x y) = |x y| = |x||y| = phi(x)phi(y)$.
  Yes, it is a homomorphism.
]
#exercise[
  Find the kernel of the homomorphism $phi: ZZ_(12) arrow ZZ_4$ defined by $phi(x) = x mod 4$.
]
#solution[
  We need $x in ZZ_(12)$ such that $x mod 4 = 0$.
  The elements in ${0, 1, ..., 11}$ divisible by 4 are $0, 4, 8$.
  $ker(phi) = {0, 4, 8}$.
]
