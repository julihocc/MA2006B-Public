#import "../../utils.typ": *
== Automorphisms

=== Theory
#definition("Automorphism")[
  An *automorphism* of a group $G$ is an isomorphism from $G$ to itself. That is, a bijection $phi: G arrow G$ that is also a homomorphism.
]

#example[
  For the additive group of integers $ZZ$, the only automorphisms are $id(x)=x$ and $phi(x)=-x$.
  - $phi(x)=-x$ is a homomorphism: $-(x+y) = (-x) + (-y)$.
  - It is bijective (its own inverse).
  - Mappings like $f(x)=2x$ are homomorphisms but not surjective (onto), so not automorphisms.
]

#proposition[
  The set of all automorphisms of $G$, denoted $"Aut"(G)$, forms a group under function composition.
]

#proof[
  1. *Closure*: The composition of two isomorphisms is an isomorphism.
  2. *Associativity*: Function composition is associative.
  3. *Identity*: The identity map $id(x) = x$ is an automorphism.
  4. *Inverse*: The inverse function of an isomorphism is also an isomorphism.
]

#definition(title: "Inner Automorphism")[
  For any $g in G$, the conjugation map $phi_g(x) = g x g^(-1)$ is an automorphism of $G$ called an *inner automorphism*.
]

#example[
  In the symmetric group $S_3$, conjugation by $g=(1 space 2)$ acts as an inner automorphism $phi_g(x) = g x g^(-1)$.
  - If $x=(1 space 3)$, then $phi_g(x) = (1 space 2)(1 space 3)(1 space 2)^(-1) = (1 space 2)(1 space 3)(1 space 2) = (2 space 3)$.
  - Conjugation generally "relabels" the elements in the cycle notation.
]

#example[
  *Structure Weaknesses*: Automorphisms describe the symmetries of the algebraic structure. In cryptography, understanding the automorphism group of the underlying structure (like an elliptic curve) is vital for understanding potential weaknesses or for optimizing arithmetic (e.g., using Frobenius automorphisms for faster scalar multiplication on Koblitz curves).
]

=== Solved Problems

#solved_problem[
  Let $G = ZZ_5$ (additive). Find all automorphisms of $ZZ_5$.
]
#solution[
  An automorphism $sigma: ZZ_5 arrow ZZ_5$ is determined by where it maps a generator, and it must map a generator to another generator.
  1. Identify generators of $ZZ_5$: Since 5 is prime, all non-zero elements $\{1, 2, 3, 4\}$ are generators.
  2. Define the possible maps $sigma_k(x) = k x \pmod 5$:
    - $sigma_1(x) = 1x$: Identity map.
    - $sigma_2(x) = 2x$: Bijective because $gcd(2, 5)=1$.
    - $sigma_3(x) = 3x$: Bijective because $gcd(3, 5)=1$.
    - $sigma_4(x) = 4x$: Bijective because $gcd(4, 5)=1$.
  Since there are 4 generators, there are exactly 4 automorphisms.
  $"Aut"(ZZ_5) tilde.eq ZZ_5^* tilde.eq ZZ_4$.
]

#solved_problem[
  Determine all automorphisms of the group $ZZ_6$.
]
#solution[
  Automorphisms of the cyclic group $ZZ_n$ are of the form $f(x) = k x$, where $gcd(k, n) = 1$.
  For $n=6$:
  1. Find integers $k in \{1, ..., 5\}$ coprime to 6.
  2. Check GCDs:
    - $gcd(1, 6) = 1$ (Generator)
    - $gcd(2, 6) = 2$
    - $gcd(3, 6) = 3$
    - $gcd(4, 6) = 2$
    - $gcd(5, 6) = 1$ (Generator)
  3. The valid maps are $x mapsto 1x$ and $x mapsto 5x$.
  Thus, there are only 2 automorphisms. The group $"Aut"(ZZ_6)$ is isomorphic to $ZZ_2$.
]

#solved_problem[
  Show that for an abelian group $G$, the only inner automorphism is the identity map.
]
#solution[
  Let $G$ be an abelian group. An inner automorphism is defined by conjugation: $phi_g(x) = g x g^(-1)$.
  We simplify the expression using commutativity ($g x = x g$):
  $ phi_g(x) = g x g^(-1) = x g g^(-1) = x (g g^(-1)) = x e = x $
  The map $phi_g$ sends every $x$ to $x$. This is the Identity Map.
  Since this holds for any $g \in G$, the only inner automorphism is the identity.
  (In correct terms, the Inner Automorphism group $"Inn"(G)$ is trivial).
]


=== Self-Evaluation Quiz

#quiz[
  #question(
    [An automorphism is an isomorphism from a group $G$ to:],
    ([A subgroup of $G$], [A quotient group of $G$], [Itself], [The identity group]),
    2,
  )

  #question(
    [For $g in G$, the map $phi_g(x) = g x g^(-1)$ is called:],
    ([Outer automorphism], [Inner automorphism], [Identity automorphism], [Inverse automorphism]),
    1,
  )

  #question(
    [The set of all automorphisms of $G$, denoted $"Aut"(G)$, forms a group under:],
    ([Addition], [Multiplication], [Function composition], [Convolution]),
    2,
  )

  #question(
    [The identity map $id: G arrow G$ defined by $id(x) = x$ is:],
    ([Always an automorphism], [Never an automorphism], [Only for abelian groups], [Only for finite groups]),
    0,
  )

  #question(
    [If $phi, psi in "Aut"(G)$, then their composition $phi circle psi$ is:],
    ([Also in $"Aut"(G)$], [Not in $"Aut"(G)$], [The identity], [Undefined]),
    0,
  )

  #question(
    [The group of inner automorphisms $"Inn"(G)$ is a normal subgroup of:],
    ([$G$], [$"Aut"(G)$], [$Z(G)$], [$\{e\}$]),
    1,
  )

  #question(
    [The automorphism group of the integers, $"Aut"(ZZ)$, is isomorphic to:],
    ([$ZZ$], [$ZZ_2$], [$\{e\}$], [$ZZ_4$]),
    1,
  )

  #question(
    [Which isomorphism relates the central quotient to inner automorphisms?],
    (
      [$G / Z(G) tilde.eq "Inn"(G)$],
      [$G / "Inn"(G) tilde.eq Z(G)$],
      [$G tilde.eq "Inn"(G)$],
      [$Z(G) tilde.eq "Aut"(G)$],
    ),
    0,
  )

  #question(
    [An automorphism $phi$ always preserves which property of element $g$?],
    ([The sign of $g$], [The order of $g$], [The value of $g$], [The inverse as identity]),
    1,
  )

  #question(
    [A subgroup $H$ is called characteristic if it is invariant under:],
    ([All inner automorphisms], [All automorphisms], [Conjugation], [Left multplication]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Prove that the map $phi: CC arrow CC$ given by $phi(z) = overline(z)$ (complex conjugation) is an automorphism of the additive group of complex numbers.
]

#supplementary[
  Let $G = S_3$. Find the inner automorphism defined by $g = (1 2)$.
]

#supplementary[
  Let $G$ be an abelian group. Show that the map $f: G arrow G$ given by $f(x) = x^(-1)$ is an automorphism.
]

#supplementary[
  Let $phi$ be an automorphism of a group $G$. Let $H = {g in G | phi(g) = g}$ be the set of fixed points. Prove that $H$ is a subgroup of $G$.
]

#supplementary[
  Determining the automorphism group of $Z_8$, i.e., find $"Aut"(Z_8)$.
]

#supplementary[
  Prove that the set of inner automorphisms $"Inn"(G)$ is a normal subgroup of the automorphism group $"Aut"(G)$.
]

#supplementary[
  Find the automorphism group of $Z_{10}$. To what familiar group is it isomorphic?
]

#supplementary[
  Show that the automorphism group of the Klein 4-group $V_4 tilde.eq Z_2 times Z_2$ is isomorphic to $S_3$.
]

#supplementary[
  Let $G$ be a non-abelian group. Prove that the group of inner automorphisms $"Inn"(G)$ is non-trivial (i.e., contains more than just the identity map).
]

#supplementary[
  Show that $"Aut"(S_3) tilde.eq S_3$.
]
