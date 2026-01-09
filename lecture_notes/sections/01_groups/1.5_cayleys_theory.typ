#import "../../utils.typ": solution, proof, definition, theorem, proposition, corollary, example, solution
== Cayley's Theory

=== Theory
#theorem("Cayley's Theorem")[
  Every group $G$ is isomorphic to a subgroup of the symmetric group acting on $G$. In other words, every group can be considered as a group of permutations.
]

#proposition("Permutation Representation")[
  Specifically, for each $g in G$, we can define a permutation $lambda_g: G arrow G$ by $lambda_g(x) = g dot x$. The mapping $g mapsto lambda_g$ is an injective homomorphism from $G$ into $S_G$ (the group of all permutations of the set $G$).

  #proof[
    1. *Well-defined*: $lambda_g$ is a permutation because it has an inverse $lambda_(g^(-1))$.
    2. *Homomorphism*: $lambda_(g h)(x) = (g h)x = g(h x) = lambda_g(lambda_h(x))$. Thus $g mapsto lambda_g$ preserves operations.
    3. *Injective*: If $lambda_g = lambda_h$, then $lambda_g(e) = lambda_h(e) arrow.double g = h$.
    Thus $G$ is isomorphic to the image ${lambda_g | g in G}$, which is a subgroup of $S_G$.
  ]
]

=== Examples
#example[
  Consider the group $G = {1, -1}$ under multiplication.
  Elements: $1, -1$.
  Permutations correspondled to left multiplication:
  $lambda_1$: $1 arrow 1$, $-1 arrow -1$ (Identity permutation $(1)(-1)$)
  $lambda_(-1)$: $1 arrow -1$, $-1 arrow 1$ (Transposition $(1, -1)$)
  Thus $G tilde.eq {(1)(-1), (1, -1)} subset.eq S_2$.
]

#example[
  *Significance*: Cayley's theorem is theoretically significant as it allows us to represent abstract groups concretely using permutations. In computational group theory, permutation representations are often easier to store and manipulate in a computer than abstract definitions, allowing for efficient algorithms to determine group properties.
]

=== Exercises
+ Write down the permutation representation of $ZZ_3 = {0, 1, 2}$ given by Cayley's Theorem.
#solution[
  Elements: $0, 1, 2$. Operation is addition mod 3.
  - $lambda_0$: $0 arrow 0, 1 arrow 1, 2 arrow 2$ -> $(0)(1)(2) = e$
  - $lambda_1$: $0 arrow 1, 1 arrow 2, 2 arrow 0$ -> $(0 space 1 space 2)$
  - $lambda_2$: $0 arrow 2, 1 arrow 0, 2 arrow 1$ -> $(0 space 2 space 1)$
]
+ Explain why the image of the map $g mapsto lambda_g$ is a subgroup of $S_G$.
#solution[
  The map is a homomorphism. The image of any group homomorphism is a subgroup of the codomain. Since the codomain is $S_G$, the image is a subgroup of $S_G$.
]
