#import "../../utils.typ": *
== Homomorphisms

=== Theory
#definition("Homomorphism")[
  A *homomorphism* is a structure-preserving map between two algebraic structures. Let $(G, dot)$ and $(H, *)$ be groups. A function $phi: G arrow H$ is a group homomorphism if for all $a, b in G$:
  $ phi(a dot b) = phi(a) * phi(b) $
]

#example[
  The map $exp: (RR, +) arrow (RR^+, dot)$ defined by $x |-> e^x$ is a homomorphism. The operation in the domain is the standard addition of real numbers, while the operation in the codomain is the standard multiplication of positive real numbers. We can verify the homomorphism property by observing that for any $x, y in RR$, we have
  $ exp(x+y) = e^(x+y) = e^x dot e^y = exp(x) dot exp(y). $
]

#proposition("Properties of Homomorphisms")[
  Let $phi: G arrow H$ be a group homomorphism. Then the following properties hold:
  1. $phi(e_G) = e_H$, meaning $phi$ maps the identity of $G$ to the identity of $H$.
  2. $phi(a^(-1)) = phi(a)^(-1)$ for all $a in G$, meaning $phi$ maps inverses to inverses.
]

#proof[
  For the first property, observe that $e_G = e_G dot e_G$. Applying $phi$ to both sides yields $phi(e_G) = phi(e_G dot e_G) = phi(e_G) * phi(e_G)$. Right-multiplying both sides by the inverse $phi(e_G)^(-1)$ in $H$ gives $e_H = phi(e_G)$.

  For the second property, we use the fact that $a dot a^(-1) = e_G$. Applying $phi$ yields $phi(a dot a^(-1)) = phi(e_G)$. Since $phi$ is a homomorphism and preserves the identity, we have $phi(a) * phi(a^(-1)) = e_H$. Therefore, $phi(a^(-1))$ is the inverse of $phi(a)$ in $H$, which means $phi(a^(-1)) = phi(a)^(-1)$.
]

#definition("Normal Subgroup")[
  A subgroup $N$ of a group $G$ is *normal* in $G$ if for every $g in G$ and $n in N$, we have
  $ g dot n dot g^(-1) in N $.
]

#proposition("Equivalent Characterization of Normality")[
  A subgroup $N subset.eq G$ is normal if and only if $g N g^(-1) = N$ for all $g in G$.
]

#proof[
  $(arrow.r.double)$ Assume $N$ is normal. Then for any $g in G$ and $n in N$, we have $g n g^(-1) in N$, so $g N g^(-1) subset.eq N$.
  Applying the same property to $g^(-1)$ gives $g^(-1) N g subset.eq N$. Conjugating by $g$ yields $N subset.eq g N g^(-1)$.
  Hence $g N g^(-1) = N$.

  $(arrow.l.double)$ If $g N g^(-1) = N$ for all $g in G$, then every element of the form $g n g^(-1)$ (with $n in N$) lies in $N$.
  Therefore $N$ is normal by definition.
]

#definition("Kernel")[
  The *Kernel* of $phi$, denoted $ker(phi)$, is the set ${g in G | phi(g) = e_H}$.
]

#proposition("Kernel is Normal")[
  For a group homomorphism $phi: G arrow H$, the subgroup $ker(phi)$ is normal in $G$.
]

#proof[
  Let $k in ker(phi)$ and $g in G$. Then $phi(k) = e_H$.
  Since $phi$ is a homomorphism,
  $ phi(g dot k dot g^(-1)) = phi(g) * phi(k) * phi(g)^(-1) = phi(g) * e_H * phi(g)^(-1) = e_H $.
  Hence $g dot k dot g^(-1) in ker(phi)$.
  By the definition of normal subgroup, $ker(phi)$ is normal in $G$.
]

#definition("Image")[
  The *Image* of a homomorphism $phi: G arrow H$, denoted $"Im"(phi)$ or $phi(G)$, is the set ${phi(g) | g in G}$.
]

#proposition("Image is a Subgroup")[
  For a group homomorphism $phi: G arrow H$, the image $"Im"(phi)$ is a subgroup of $H$.
]

#definition("Isomorphism")[
  An *isomorphism* is a bijective group homomorphism. If such a map exists between $G$ and $H$, they are said to be *isomorphic*, denoted $G tilde.eq H$.
]

#theorem("First Isomorphism Theorem")[
  Let $phi: G arrow H$ be a group homomorphism. Then the quotient group $G slash ker(phi)$ is isomorphic to the image of $phi$:
  $ G slash ker(phi) tilde.eq "Im"(phi) $
]

#example[
  For the homomorphism $phi: ZZ arrow ZZ_2$ given by $phi(x) = x mod 2$:
  Sample values are $phi(0) = 0, phi(1) = 1, phi(2) = 0, phi(3) = 1$, so parity is exactly what the map records.

  For addition,
  $ phi(a+b) = (a+b) mod 2 = ((a mod 2) + (b mod 2)) mod 2 = phi(a) +_2 phi(b), $
  so as a map $(ZZ,+) arrow (ZZ_2,+_2)$, $phi$ is a group homomorphism.

  Also,
  $ phi(a b) = (a b) mod 2 = ((a mod 2)(b mod 2)) mod 2 = phi(a) phi(b), $
  so reduction modulo $2$ preserves multiplication as well (hence it is also a ring homomorphism $ZZ arrow ZZ_2$).

  Now compute the kernel:
  $ ker(phi) = {x in ZZ | phi(x) = 0} = {x in ZZ | x mod 2 = 0}. $
  This means $x$ is even, i.e., $x = 2k$ for some $k in ZZ$, so
  $ ker(phi) = 2ZZ = {..., -4, -2, 0, 2, 4, ...}. $

  By the proposition "Kernel is Normal", this kernel is a normal subgroup of $ZZ$.
]

#example[
  *Homomorphic Encryption (HE)* is a cryptographic scheme that allows computation on encrypted data without first decrypting it. If $E$ is an encryption function that is homomorphic with respect to an operation $+$, then the encryption scheme satisfies the property:
  $ E(m_1) +_{"cipher"} E(m_2) = E(m_1 +_{"plain"} m_2). $
  This property allows a server or an untrusted third party to compute the sum of two encrypted numbers without ever having access to the plain text numbers themselves, which forms the basis for secure cloud computing and privacy-preserving data analysis.
]

=== Solved Problems

#solved_problem[
  Consider the map $phi: ZZ arrow ZZ_n$ defined by $phi(x) = x mod n$. Prove that $phi$ is a group homomorphism.
]
#solution[
  We must verify that $phi$ satisfies the homomorphism property, namely that $phi(x+y) = phi(x) +_n phi(y)$ for any integers $x, y in ZZ$.

  By the definition of our map, applying $phi$ to the sum $x+y$ gives:
  $ phi(x+y) = (x+y) mod n. $

  From the fundamental properties of modular arithmetic, we know that the modulo operation distributes over addition, meaning:
  $ (x+y) mod n = ((x mod n) + (y mod n)) mod n. $

  This expression corresponds exactly to the definition of modular addition $+_n$ in the group $ZZ_n$. Substituting our function $phi$ back into this expression yields $phi(x) +_n phi(y)$. Thus, we have shown that $phi(x+y) = phi(x) +_n phi(y)$, establishing that $phi$ is indeed a homomorphism.
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
    [The kernel of a homomorphism $phi: G arrow H$ consists of elements mapping to:],
    ([The identity of $G$], [The identity of $H$], [Any element of $H$], [The generators of $G$]),
    1,
  )

  #question(
    [An isomorphism is a homomorphism that is also:],
    ([Injective only], [Surjective only], [Bijective], [Constant]),
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
