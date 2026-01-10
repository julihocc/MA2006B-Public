#import "../../utils.typ": *
== Automorphisms

=== Theory
#definition("Automorphism")[
  An *automorphism* of a group $G$ is an isomorphism from $G$ to itself. That is, a bijection $phi: G arrow G$ that is also a homomorphism.
]

#proposition[
  The set of all automorphisms of $G$, denoted $"Aut"(G)$, forms a group under function composition.
  #proof[
    1. *Closure*: The composition of two isomorphisms is an isomorphism.
    2. *Associativity*: Function composition is associative.
    3. *Identity*: The identity map $id(x) = x$ is an automorphism.
    4. *Inverse*: The inverse function of an isomorphism is also an isomorphism.
  ]
]

#definition(title: "Inner Automorphism")[
  For any $g in G$, the conjugation map $phi_g(x) = g x g^(-1)$ is an automorphism of $G$ called an *inner automorphism*.
]

#example[
  *Structure Weaknesses*: Automorphisms describe the symmetries of the algebraic structure. In cryptography, understanding the automorphism group of the underlying structure (like an elliptic curve) is vital for understanding potential weaknesses or for optimizing arithmetic (e.g., using Frobenius automorphisms for faster scalar multiplication on Koblitz curves).
]

=== Solved Problems

#solved_problem[
  Let $G = ZZ_5$ (additive). Find all automorphisms of $ZZ_5$.
]
#solution[
  Any automorphism must map a generator to a generator.
  Generators of $ZZ_5$ are ${1, 2, 3, 4}$ (since 5 is prime).
  Maps $phi(x) = k x$ where $k$ is a generator:
  - $sigma_1(x) = 1 x = x$ (Identity)
  - $sigma_2(x) = 2 x mod 5$
  - $sigma_3(x) = 3 x mod 5$
  - $sigma_4(x) = 4 x mod 5$

  Each of these is an automorphism. Thus $|"Aut"(ZZ_5)| = 4$.
]

#solved_problem[
  Determine all automorphisms of the group $ZZ_6$.
]
#solution[
  Automorphisms of $ZZ_n$ are determined by where they map $1$. Since $1$ generates $ZZ_n$, $phi(1)$ must be a generator of $ZZ_n$.
  The generators of $ZZ_6$ are elements coprime to 6: ${1, 5}$.
  Two possible maps:
  - $sigma_1(x) = 1 dot x = x$ (Identity)
  - $sigma_5(x) = 5 dot x equiv -x mod 6$.

  Thus, $"Aut"(ZZ_6) tilde.eq Z_2$.
]

#solved_problem[
  Show that for an abelian group $G$, the only inner automorphism is the identity map.
]
#solution[
  Let $G$ be abelian. An inner automorphism is defined by $phi_g(x) = g x g^(-1)$ for some $g in G$.
  Since $G$ is abelian, $g x = x g$.
  Therefore, $phi_g(x) = (x g) g^(-1) = x (g g^(-1)) = x e = x$.
  This is the identity map for all $g in G$.
]

=== Supplementary Problems

#supplementary[
  Prove that the map $phi: C arrow C$ given by $phi(z) = overline(z)$ (complex conjugation) is an automorphism of the additive group of complex numbers.
]

#supplementary[
  Let $G = S_3$. Find the inner automorphism defined by $g = (1 2)$.
]
