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

#example[
  *Homomorphic Encryption*: Homomorphisms are implicit in many reduction steps in cryptography. For example, the security reduction of many protocols relies on mapping a complex problem instance to another structure where relations are preserved. They are also fundamental in constructing "Homomorphic Encryption" schemes, where computations can be performed on encrypted data ($phi("enc"(m_1) dot "enc"(m_2)) = phi("enc"(m_1 dot m_2))$), allowing operations on the ciphertext to map to operations on the plaintext.
]

=== Solved Problems

#solved_problem[
  Consider $phi: ZZ arrow ZZ_n$ defined by $phi(x) = x mod n$. Prove it is a homomorphism.
]
#solution[
  We need to check the homomorphism property $phi(x+y) = phi(x) +_n phi(y)$.

  $phi(x+y) = (x+y) mod n$

  From modular arithmetic properties: $(x+y) mod n = ((x mod n) + (y mod n)) mod n$.

  This is exactly the definition of addition in $ZZ_n$, i.e., $phi(x) +_n phi(y)$.
  Thus, $phi$ is a homomorphism.
]

#solved_problem[
  Let $phi: RR^* arrow RR^*$ be defined by $phi(x) = |x|$. Is $phi$ a homomorphism under multiplication?
]
#solution[
  Check if $phi(x y) = phi(x)phi(y)$.

  LHS: $phi(x y) = |x y|$.

  RHS: $phi(x)phi(y) = |x| dot |y|$.

  Since $|x y| = |x||y|$ for all real numbers, $phi$ is a homomorphism.
]

#solved_problem[
  Find the kernel of the homomorphism $phi: ZZ_(12) arrow ZZ_4$ defined by $phi(x) = x mod 4$.
]
#solution[
  We need to find all $x in ZZ_(12) = {0, 1, ..., 11}$ such that $phi(x) = 0$ in $ZZ_4$ (i.e., $x$ is a multiple of 4).

  Testing elements:
  - $0 mod 4 = 0$ (in Kernel)
  - $4 mod 4 = 0$ (in Kernel)
  - $8 mod 4 = 0$ (in Kernel)

  Any other element is not divisible by 4.
  Thus, $ker(phi) = {0, 4, 8}$.
]

=== Supplementary Problems

#supplementary[
  Determine if $phi: ZZ arrow ZZ$ defined by $phi(x) = 2x + 1$ is a group homomorphism.
]

#supplementary[
  Let $G$ be abelian and $n$ be an integer. Show that $phi: G arrow G$ defined by $phi(x) = x^n$ is a homomorphism.
]
