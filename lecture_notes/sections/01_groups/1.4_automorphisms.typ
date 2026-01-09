#import "../../utils.typ": corollary, definition, example, proof, proposition, solution, theorem
== Automorphisms

=== Theory
#definition(title: "Automorphism")[
  An *automorphism* of a group $G$ is an isomorphism from $G$ to itself. That is, distinct bijection $phi: G arrow G$ that is also a homomorphism.
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
  For any $g in G$, the conjugation map $phi_g(x) = g x g^(-1)$ is an automorphism.
]

=== Examples
#example[
  Let $G = ZZ_5$ (additive). Any automorphism must map a generator to a generator.
  Generators of $ZZ_5$ are ${1, 2, 3, 4}$.
  Maps:
  $sigma_1(x) = 1x = x$ (Identity)
  $sigma_2(x) = 2x mod 5$
  $sigma_3(x) = 3x mod 5$
  $sigma_4(x) = 4x mod 5$
  Each of these is an automorphism.
]

#example[
  *Structure Weaknesses*: Automorphisms describe the symmetries of the algebraic structure. In cryptography, understanding the automorphism group of the underlying structure (like an elliptic curve) is vital for understanding potential weaknesses or for optimizing arithmetic (e.g., using Frobenius automorphisms for faster scalar multiplication on Koblitz curves).
]

=== Exercises
+ Determine all automorphisms of the group $ZZ_6$.
#solution[
  Automorphisms of $ZZ_n$ map generators to generators. Generators of $ZZ_6$ are elements coprime to 6: $1, 5$.
  - $sigma_1(x) = 1x = x$ (Identity)
  - $sigma_5(x) = 5x = -x$
  So $"Aut"(ZZ_6) tilde.eq Z_2$.
]
+ Show that for an abelian group, the only inner automorphism is the identity map.
#solution[
  Inner automorphism: $phi_g(x) = g x g^(-1)$.
  Since $G$ is abelian, $g x = x g$.
  Thus, $phi_g(x) = x g g^(-1) = x e = x$.
  This is the identity map for all $g$.
]
