#import "../../utils.typ": *
== Permutation Groups

=== Theory
#definition("Permutation Group")[
  A *permutation group* is a group $G$ whose elements are permutations of a given set $M$ and whose group operation is function composition.
]

#definition("Symmetric and Alternating Groups")[
  The *symmetric group* $S_n$ consists of all permutations of a finite set of $n$ elements. Its order is $|S_n| = n!$.

  Every permutation in $S_n$ can be expressed as a product of transpositions (cycles of length 2). A permutation is *even* if it can be written as the product of an even number of transpositions, and *odd* otherwise.
  The set of all even permutations in $S_n$ forms a normal subgroup called the *alternating group* $A_n$, with order $|A_n| = n!/2$.
]

#example[
  The group $S_3$ contains $6$ elements:
  - Identity: $e$ (order 1).
  - Transpositions (2-cycles): $(1 space 2), (1 space 3), (2 space 3)$ (order 2).
  - 3-Cycles: $(1 space 2 space 3), (1 space 3 space 2)$ (order 3).
  Isomorphism: $S_3 tilde.eq D_3$ (symmetries of a triangle).
]

#proposition("Cycle Decomposition")[
  Any permutation can be decomposed into disjoint cycles. The order of a permutation is the least common multiple (LCM) of the lengths of these disjoint cycles.
]

#proof[
  Consider the limit of the sequence $x, sigma(x), sigma^2(x), ...$ for any $x$. Since the set is finite, it must loop back to $x$. This forms a cycle. Removing these elements and repeating the process decomposes the entire permutation into disjoint cycles.
  For disjoint cycles, operations commute. Order is the smallest $k$ such that $"LCM"(l_1, ..., l_m)$ divides $k$.
]

#example[
  *Ciphers*: Permutation groups are fundamental to cryptography.
  - *Enigma Machine*: Used a series of rotors to generate a complex, changing permutation for each keystroke.
  - *AES (SPN)*: Uses Substitution-Permutation Networks.
    - *Substitution*: S-Boxes (nonlinear map).
    - *Permutation*: ShiftRows and MixColumns operations permute bits/bytes to diffuse information across the state.
]

=== Solved Problems

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

#solved_problem[
  How many elements does $S_4$ have? List 5 different elements.
]
#solution[
  The order of the symmetric group $S_n$ is $n!$.
  For $n=4$: $|S_4| = 4! = 4 times 3 times 2 times 1 = 24$.

  Five distinct elements (by cycle structure):
  1. Identity: $e$
  2. Transpositions (2-cycles): $(1 space 2)$
  3. 3-cycles: $(1 space 2 space 3)$
  4. 4-cycles: $(1 space 2 space 3 space 4)$
  5. Product of disjoint transpositions: $(1 space 2)(3 space 4)$
]


=== Self-Evaluation Quiz

#quiz[
  #question(
    [The order of the symmetric group $S_n$ is:],
    ([$n^2$], [$2^n$], [$n!$], [$n(n-1)$]),
    2,
  )

  #question(
    [Every permutation can be written uniquely (up to order) as a product of:],
    ("Transpositions", "Disjoint cycles", "3-cycles", "Inversions"),
    1,
  )

  #question(
    [A permutation is called 'even' if it can be written as a product of an even number of:],
    ("Cycles", "Transpositions", "Inversions", "Fixed points"),
    1,
  )

  #question(
    [Two disjoint cycles in a permutation always:],
    ([Commute], [Invert each other], [Cancel out], [Have the same length]),
    0,
  )

  #question(
    [The order of a permutation written as a product of disjoint cycles is the:],
    ([Sum of lengths], [Product of lengths], [Least Common Multiple (LCM) of lengths], [Maximum length]),
    2,
  )

  #question(
    [The order of the Alternating Group $A_n$ (for $n >= 2$) is:],
    ([$n!$], [$n! / 2$], [$(n-1)!$], [$n^2$]),
    1,
  )

  #question(
    [A group is called simple if it has no non-trivial:],
    ([Subgroups], [Normal subgroups], [Abelian subgroups], [Cyclic subgroups]),
    1,
  )

  #question(
    [A transposition is a cycle of length:],
    ([1], [2], [3], [n]),
    1,
  )

  #question(
    [The identity permutation is always:],
    ([Even], [Odd], [Both], [Neither]),
    0,
  )

  #question(
    [The product of two odd permutations is:],
    ([Odd], [Even], [Undefined], [Identity]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Express the permutation $mat(1, 2, 3, 4, 5; 3, 5, 4, 1, 2)$ as a product of disjoint cycles.
]

#supplementary[
  Find the inverse of the permutation $(1 space 2 space 3)(4 space 5)$.
]

#supplementary[
  Determine if the permutation $sigma = (1 space 2 space 3 space 4)(5 space 6)$ is even or odd.
]

#supplementary[
  Calculate the order of the permutation $tau = (1 space 2)(3 space 4 space 5)(6 space 7 space 8 space 9)$ in $S_9$.
]

#supplementary[
  Find the number of elements of order 2 in $S_3$.
]

#supplementary[
  Show that the set of even permutations $A_n$ forms a subgroup of $S_n$. This subgroup is called the *Alternating Group*.
]

#supplementary[
  Calculate the number of distinct 3-cycles in $S_5$.
]

#supplementary[
  Prove that any two disjoint cycles commute. That is, if $alpha = (a_1 ... a_k)$ and $beta = (b_1 ... b_m)$ have no common elements, then $alpha beta = beta alpha$.
]

#supplementary[
  Show that the permutations $(1 space 2)$ and $(1 space 2 space 3)$ generate the entire group $S_3$.
]

#supplementary[
  Find the largest possible order of an element in $S_5$. (Hint: Consider the possible cycle structures that sum to 5).
]
