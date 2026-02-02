#import "../../utils.typ": *
== Homomorphisms

=== Theory
#definition("Homomorphism")[
  A *homomorphism* is a structure-preserving map between two algebraic structures. Let $(G, dot)$ and $(H, *)$ be groups. A function $phi: G arrow H$ is a group homomorphism if for all $a, b in G$:
  $ phi(a dot b) = phi(a) * phi(b) $
]

#example[
  The map $exp: (RR, +) arrow (RR^+, dot)$ defined by $x mapsto e^x$ is a homomorphism.
  - Domain operation is addition ($+$).
  - Codomain operation is multiplication ($dot$).
  - Property check: $exp(x+y) = e^(x+y) = e^x dot e^y = exp(x) dot exp(y)$.
]

#proposition("Properties of Homomorphisms")[
  - $phi(e_G) = e_H$ (maps identity to identity)
  - $phi(a^(-1)) = phi(a)^(-1)$ (maps inverses to inverses)
]

#proof[
  1. $phi(e_G) = phi(e_G dot e_G) = phi(e_G) * phi(e_G)$. Multiplying by $phi(e_G)^(-1)$ gives $e_H = phi(e_G)$.
  2. $e_H = phi(e_G) = phi(a dot a^(-1)) = phi(a) * phi(a^(-1))$. Thus $phi(a^(-1))$ is the inverse of $phi(a)$.
]

#definition(title: "Kernel")[
  The *Kernel* of $phi$, denoted $ker(phi)$, is the set ${g in G | phi(g) = e_H}$. It is always a normal subgroup of $G$.
]

#example[
  For the homomorphism $phi: ZZ arrow ZZ_2$ given by $phi(x) = x mod 2$:
  - $phi(0) = 0, phi(1) = 1, phi(2) = 0, phi(3) = 1$.
  - The kernel is $ker(phi) = {x in ZZ | phi(x) = 0} = {..., -2, 0, 2, ...} = 2ZZ$.
  - This kernel is a normal subgroup of $ZZ$.
]

#example[
  *Homomorphic Encryption (HE)*: Allows computation on encrypted data.
  If $E$ is an encryption function that is homomorphic with respect to operation $+$, then:
  $ E(m_1) +_{"cipher"} E(m_2) = E(m_1 +_{"plain"} m_2) $
  This allows a server to compute the sum of encrypted numbers without knowing the numbers themselves.
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


=== Self-Evaluation Quiz

#quiz[
  #question(
    [A function $phi: G arrow H$ is a homomorphism if for all $x, y in G$:],
    (
      [$phi(x + y) = phi(x) dot phi(y)$],
      [$phi(x y) = phi(x) phi(y)$],
      [$phi(x y) = phi(x) + phi(y)$],
      [$phi(x) = phi(y)$],
    ),
    1,
  )

  #question(
    [The kernel of a homomorphism $phi: G arrow H$ consists of element mapping to:],
    ([The identity of $G$], [The identity of $H$], [Any element of $H$], [The generators of $G$]),
    1,
  )

  #question(
    [An isomorphism is a homomorphism that is also:],
    ("Injective only", "Surjective only", "Bijective", "Constant"),
    2,
  )

  #question(
    [For any homomorphism $phi: G arrow H$, which property always holds?],
    ([$phi(e_G) = e_H$], [$phi(e_G) = phi(e_H)$], [$phi(e_H) = e_G$], [$phi(x) = x$]),
    0,
  )

  #question(
    [For any homomorphism $phi: G arrow H$, the inverse maps as:],
    ([$phi(x^(-1)) = phi(x)$], [$phi(x^(-1)) = phi(x)^(-1)$], [$phi(x^(-1)) = e_H$], [$phi(x^(-1)) = x$]),
    1,
  )

  #question(
    [The image of a homomorphism $phi(G)$ is always a subgroup of:],
    ([$G$], [$H$], [$"Ker"(phi)$], [$G times H$]),
    1,
  )

  #question(
    [The kernel of a homomorphism is always which type of subgroup?],
    ([Cyclic], [Abelian], [Normal], [Finite]),
    2,
  )

  #question(
    [The First Isomorphism Theorem states that if $phi: G arrow H$ is a homomorphism, then:],
    (
      [$G / "Ker"(phi) tilde.eq "Im"(phi)$],
      [$G / "Im"(phi) tilde.eq "Ker"(phi)$],
      [$G tilde.eq "Im"(phi)$],
      [$G tilde.eq H$],
    ),
    0,
  )

  #question(
    [The canonical homomorphism $pi: ZZ arrow ZZ_n$ is defined by:],
    ([$pi(x) = x$], [$pi(x) = x "mod" n$], [$pi(x) = n x$], [$pi(x) = 1$]),
    1,
  )

  #question(
    [An embedding of a group $G$ into $H$ is a homomorphism that is:],
    ([Surjective], [Injective], [Bijective], [Constant]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Determine if $phi: ZZ arrow ZZ$ defined by $phi(x) = 2x + 1$ is a group homomorphism.
]

#supplementary[
  Let $G$ be abelian and $n$ be an integer. Show that $phi: G arrow G$ defined by $phi(x) = x^n$ is a homomorphism.
]

#supplementary[
  Let $phi: G arrow H$ and $psi: H arrow K$ be group homomorphisms. Show that their composition $psi circle phi: G arrow K$ is also a group homomorphism.
]

#supplementary[
  Prove that if $phi: G arrow H$ is a homomorphism, then $phi(e_G) = e_H$.
]

#supplementary[
  Let $phi: G arrow H$ be a group homomorphism. Prove that the kernel $ker(phi)$ is a normal subgroup of $G$.
]

#supplementary[
  Show that the determinant map $det: "GL"(n, RR) arrow RR^*$ is a group homomorphism.
]

#supplementary[
  Prove that if $G$ is abelian and $phi: G arrow H$ is a surjective homomorphism, then $H$ is abelian.
]

#supplementary[
  Determine if the map $phi: ZZ arrow ZZ$ defined by $phi(x) = x^2$ is a homomorphism.
]

#supplementary[
  Give an example of a homomorphism $phi: G arrow H$ where $H$ is abelian but $G$ is non-abelian.
]

#supplementary[
  Let $N$ be a normal subgroup of $G$. Show that the map $pi: G arrow G/N$ defined by $pi(g) = g N$ is a surjective homomorphism (called the canonical homomorphism) and find its kernel.
]
