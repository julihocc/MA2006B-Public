#import "../../utils.typ": *
== Cayley's Theorem

=== Theory
#theorem("Cayley's Theorem")[
  Every group $G$ is isomorphic to a subgroup of the symmetric group acting on $G$. In other words, every group can be considered as a group of permutations.
]



#proposition("Permutation Representation")[
  Specifically, for each $g in G$, we can define a permutation $lambda_g: G arrow G$ by $lambda_g(x) = g dot x$. The mapping $g mapsto lambda_g$ is an injective homomorphism from $G$ into $S_G$ (the group of all permutations of the set $G$).
]

#proof[
  1. *Well-defined*: $lambda_g$ is a permutation because it has an inverse $lambda_(g^(-1))$.
  2. *Homomorphism*: $lambda_(g h)(x) = (g h)x = g(h x) = lambda_g(lambda_h(x))$. Thus $g mapsto lambda_g$ preserves operations.
  3. *Injective*: If $lambda_g = lambda_h$, then $lambda_g(e) = lambda_h(e) arrow.double g = h$.
  Thus $G$ is isomorphic to the image ${lambda_g | g in G}$, which is a subgroup of $S_G$.
]



#proposition("Cycle Decomposition")[
  Any permutation can be decomposed into disjoint cycles. The order of a permutation is the least common multiple (LCM) of the lengths of these disjoint cycles.
]

#proof[
  Consider the limit of the sequence $x, sigma(x), sigma^2(x), ...$ for any $x$. Since the set is finite, it must loop back to $x$. This forms a cycle. Removing these elements and repeating the process decomposes the entire permutation into disjoint cycles.
  For disjoint cycles, operations commute. Order is the smallest $k$ such that $"LCM"(l_1, ..., l_m)$ divides $k$.
]



=== Solved Problems

#solved_problem[
  Explain the theoretical and computational significance of Cayley's Theorem.
]
#solution[
  Cayley's theorem is theoretically significant as it allows us to represent abstract groups concretely using permutations. In computational group theory, permutation representations are often easier to store and manipulate in a computer than abstract definitions, allowing for efficient algorithms to determine group properties.
]

#solved_problem[
  How are permutation groups fundamental to block ciphers and cryptography? Give examples.
]
#solution[
  Permutation groups are fundamental to cryptography for scrambling data.
  - *Enigma Machine*: Used a series of rotors to generate a complex, changing permutation for each keystroke.
  - *AES (SPN)*: Uses Substitution-Permutation Networks.
    - *Substitution*: S-Boxes (nonlinear map).
    - *Permutation*: ShiftRows and MixColumns operations permute bits/bytes to diffuse information across the state.
]

#solved_problem[
  Consider the group $G = {1, -1}$ under multiplication. Find its permutation representation.
]
#solution[
  Elements of $G$: $1, -1$.
  Permutations correspond to left multiplication $lambda_g(x) = g dot x$.
  - For $g=1$:
    $1 dot 1 = 1$
    $1 dot (-1) = -1$
    This is the identity map. In cycle notation: $e$ or $(1)(-1)$.
  - For $g=-1$:
    $(-1) dot 1 = -1$
    $(-1) dot (-1) = 1$
    This swaps 1 and -1. In cycle notation: $(1, -1)$.

  The image of $G$ under the Cayley map is the subgroup ${e, (1, -1)}$ of $S_2$.
]

#solved_problem[
  Write down the permutation representation of $ZZ_3 = {0, 1, 2}$ given by Cayley's Theorem.
]
#solution[
  Elements: $0, 1, 2$. Operation is addition modulo 3.
  We calculate $lambda_g(x) = g + x$ for each $g$.
  - $g=0$:
    $0+0=0, 0+1=1, 0+2=2$.
    Cycle: $(0)(1)(2) = e$ (Identity).
  - $g=1$:
    $1+0=1, 1+1=2, 1+2=0$.
    Cycle: $(0 space 1 space 2)$.
  - $g=2$:
    $2+0=2, 2+1=0, 2+2=1$.
    Cycle: $(0 space 2 space 1)$.

  Representation: $\{e, (0 space 1 space 2), (0 space 2 space 1)\}$.
]

#solved_problem[
  Explain why the image of the map $g mapsto lambda_g$ is a subgroup of $S_G$.
]
#solution[
  The map $phi: G arrow S_G$ given by $phi(g) = lambda_g$ is a group homomorphism.
  One of the fundamental theorems of homomorphisms states that the image of a homomorphism $Im(phi)$ is always a subgroup of the codomain.
  Since $S_G$ is the codomain and $G$ is a group, the set of permutations ${lambda_g | g in G}$ forms a subgroup of the symmetric group $S_G$.
]

#solved_problem[
  In $S_5$, let $sigma = (1 space 2 space 3)(4 space 5)$. Find the order of $sigma$ and compute $sigma^2$.
]
#solution[
  The permutation $sigma = (1 space 2 space 3)(4 space 5)$ consists of a 3-cycle and a 2-cycle.
  1. *Order*: Since the cycles are disjoint, the order is the Least Common Multiple (LCM) of their lengths.
    Order $= lcm(3, 2) = 6$.
  2. *Compute $sigma^2$*:
    $sigma^2 = ((1 space 2 space 3)(4 space 5))^2$
    Since disjoint cycles commute:
    $= (1 space 2 space 3)^2 (4 space 5)^2$
    - Square of 3-cycle $(a b c)$ is $(a c b)$: $(1 space 2 space 3)^2 = (1 space 3 space 2)$.
    - Square of 2-cycle $(d e)$ is identity: $(4 space 5)^2 = e$.
    Result: $(1 space 3 space 2)$.
]

#solved_problem[
  Calculate the product of permutations $pi = (1 space 3 space 4)$ and $sigma = (1 space 2)(3 space 4)$ in $S_4$.
]
#solution[
  We compute the composition $pi sigma$ from right to left.
  $sigma = (1 space 2)(3 space 4)$ and $pi = (1 space 3 space 4)$.
  Track each element:
  - $1$: $sigma(1)=2$, then $pi(2)=2$ (since 2 is fixed by $pi$). Result: $1 arrow 2$.
  - $2$: $sigma(2)=1$, then $pi(1)=3$. Result: $2 arrow 3$.
  - $3$: $sigma(3)=4$, then $pi(4)=1$. Result: $3 arrow 1$.
    (Cycle closes: $(1 space 2 space 3)$).
  - $4$: $sigma(4)=3$, then $pi(3)=4$. Result: $4 arrow 4$ (Fixed point).

  Final result in disjoint cycle notation: $(1 space 2 space 3)$.
]

#solved_problem[
  Find the order of the permutation $(1 space 2 space 4)(3 space 5 space 6)$ in $S_6$.
]
#solution[
  The permutation is given as a product of two cycles: $(1 space 2 space 4)$ and $(3 space 5 space 6)$.
  1. Check if they are disjoint: The sets of numbers $\{1, 2, 4\}$ and $\{3, 5, 6\}$ have no common elements. They are disjoint.
  2. Determine lengths:
    - $(1 space 2 space 4)$ has length 3.
    - $(3 space 5 space 6)$ has length 3.
  3. Calculate order:
    Order $= lcm(3, 3) = 3$.
]


=== Self-Evaluation Quiz

#quiz[
  #question(
    [Cayley's Theorem states that every group is isomorphic to a group of:],
    ([Matrices], [Permutations], [Integers], [Complex numbers]),
    1,
  )

  #question(
    [In the proof of Cayley's Theorem, we associate each element $g in G$ with a permutation $lambda_g$ defined by:],
    ([$lambda_g(x) = g + x$], [$lambda_g(x) = g x$], [$lambda_g(x) = x^g$], [$lambda_g(x) = g^(-1) x$]),
    1,
  )

  #question(
    [If $|G|=n$, Cayley's Theorem embeds $G$ into the symmetric group:],
    ([$S_n$], [$S_(2n)$], [$S_(n^2)$], [$S_(n-1)$]),
    0,
  )

  #question(
    [The left regular representation $L: G arrow S_G$ is always:],
    ([Surjective], [Injective], [Bijective], [Constant]),
    1,
  )

  #question(
    [In the left regular representation, the permutation $lambda_g$ has the same order as:],
    ([The group $G$], [The element $g$], [The identity], [$n!$]),
    1,
  )

  #question(
    [For $g != e$, how many fixed points does the permutation $lambda_g(x) = g x$ have?],
    ([0], [1], [2], [$|G|$]),
    0,
  )

  #question(
    [The right regular representation $rho_g(x) = x g^(-1)$ is used because:],
    ([$x g$ is not a permutation], [$x g$ is not a homomorphism], [It matches the left regular rep], [It is simpler]),
    1,
  )

  #question(
    [Cayley's Theorem implies that every finite group of order $n$ is a subgroup of:],
    ([$"GL"(n, RR)$], [$S_n$], [$Z_n$], [$D_n$]),
    1,
  )

  #question(
    [The main significance of Cayley's Theorem is that it allows us to view abstract groups as:],
    ([Matrices], [Concrete permutation groups], [Vector spaces], [Fields]),
    1,
  )

  #question(
    [The size of the symmetric group $S_G$ where $|G|=n$ is:],
    ([$n$], [$n^2$], [$n!$], [$2^n$]),
    2,
  )
]

=== Supplementary Problems

#supplementary[
  Let $G = \{e, a, b, c\}$ be the Klein 4-group where $x^2 = e$ for all $x$. Construct the left regular representation (Cayley representation) for $a$.
]

#supplementary[
  True or False: If $G$ has order $n$, then $G$ is isomorphic to a subgroup of $S_n$.
]

#supplementary[
  Let $G = Z_4 = {0, 1, 2, 3}$. Find the permutation in $S_4$ corresponding to the element $1$ under the left regular representation.
]

#supplementary[
  Prove that the homomorphism $g mapsto lambda_g$ in Cayley's Theorem has a trivial kernel, i.e., it is injective.
]

#supplementary[
  If $G$ is a group of order 3, show explicitly that it is isomorphic to the subgroup $A_3$ of $S_3$.
]

#supplementary[
  Find the left regular representation of the element $2$ in the group $Z_5$. That is, find the permutation $lambda_2$ in $S_5$.
]

#supplementary[
  Let $rho_g: G arrow S_G$ be defined by $rho_g(x) = x g^(-1)$. This is called the *Right Regular Representation*. Show that the map $g mapsto rho_g$ is a group homomorphism.
]

#supplementary[
  Show that for any non-identity element $g != e$, the permutation $lambda_g$ has no fixed points. That is, $lambda_g(x) != x$ for all $x in G$.
]

#supplementary[
  Use Cayley's Theorem to explicitly embed the cyclic group $Z_2 = {0, 1}$ into the symmetric group $S_4$.
]

#supplementary[
  Verify Cayley's theorem for the group of units $U(8) = {1, 3, 5, 7}$ by explicitly writing down the permutation corresponding to the element $3$.
]
