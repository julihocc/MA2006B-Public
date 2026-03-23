#import "../../utils.typ": *
== Symmetric Groups <appendix-c-symmetric>

=== Theory

#definition("Permutation Group")[
  A *permutation group* is a group $G$ whose elements are permutations of a given set $M$ and whose group operation is function composition.
]

#definition("Symmetric and Alternating Groups")[
  The *symmetric group* $S_n$ consists of all permutations of a finite set of $n$ elements. Its order is $|S_n| = n!$.

  Every permutation in $S_n$ can be expressed as a product of transpositions (cycles of length 2). A permutation is *even* if it can be written as the product of an even number of transpositions, and *odd* otherwise.
  The set of all even permutations in $S_n$ forms a normal subgroup called the *alternating group* $A_n$, with order $|A_n| = n!/2$.
]

#definition("Cycle Notation")[
  A *cycle* $(a_1 space a_2 space dots.c space a_k)$ is the permutation that sends $a_1 |-> a_2 |-> dots.c |-> a_k |-> a_1$ and fixes all other elements. Its *length* is $k$; a cycle of length 2 is a *transposition*.

  Every permutation decomposes uniquely (up to order of disjoint factors) into *disjoint cycles*. The *order* of a permutation equals the least common multiple of its cycle lengths.
]

#note[
  $S_n$ is non-abelian for $n >= 3$. For example in $S_3$:
  $(1 space 2)(1 space 3) = (1 space 3 space 2)$ but $(1 space 3)(1 space 2) = (1 space 2 space 3)$.
]

=== Solved Problems

#solved_problem[
  For the symmetric group $S_3$, list its 6 elements in cycle notation, state the order of each, and identify an isomorphism.
]
#solution[
  The six elements of $S_3$ are:
  - $e$ (identity): order 1.
  - $(1 space 2), (1 space 3), (2 space 3)$ (transpositions): order 2.
  - $(1 space 2 space 3), (1 space 3 space 2)$ (3-cycles): order 3.

  $S_3 tilde.eq D_3$, the dihedral group of symmetries of an equilateral triangle. The three transpositions correspond to reflections and the two 3-cycles to non-trivial rotations.
]

#solved_problem[
  Compute the composition $(1 space 2 space 3)(1 space 2)$ in $S_3$ and determine whether the result is even or odd.
]
#solution[
  Apply right-to-left: first $(1 space 2)$, then $(1 space 2 space 3)$. Track each element:
  - $1 -> 2 -> 3$, so $1 |-> 3$.
  - $2 -> 1 -> 2$, so $2 |-> 2$.
  - $3 -> 3 -> 1$, so $3 |-> 1$.

  Result: $(1 space 3)$, a single transposition. Since it is the product of an *odd* number of transpositions, it is an *odd* permutation.
]

#solved_problem[
  How many elements does $S_4$ have? List one element of each cycle type and state its order.
]
#solution[
  $|S_4| = 4! = 24$.

  #table(
    columns: 3,
    table.header([*Cycle type*], [*Example*], [*Order*]),
    [$1+1+1+1$], [$e$], [1],
    [$2+1+1$], [$(1 space 2)$], [2],
    [$2+2$], [$(1 space 2)(3 space 4)$], [2],
    [$3+1$], [$(1 space 2 space 3)$], [3],
    [$4$], [$(1 space 2 space 3 space 4)$], [4],
  )
]

#solved_problem[
  Verify that $A_3$ is a subgroup of $S_3$ and identify it as a familiar group.
]
#solution[
  The even permutations of $S_3$ are:
  - $e$: zero transpositions (even).
  - $(1 space 2 space 3) = (1 space 3)(1 space 2)$: two transpositions (even).
  - $(1 space 3 space 2) = (1 space 2)(1 space 3)$: two transpositions (even).

  So $A_3 = {e, (1 space 2 space 3), (1 space 3 space 2)}$. Closed under composition, contains the identity, and each element's inverse is present, so $A_3 <= S_3$.

  Since $|A_3| = 3$ is prime, $A_3$ is cyclic: $A_3 tilde.eq ZZ_3$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [The order of the symmetric group $S_n$ is:],
    ([$n$], [$n^2$], [$n!$], [$2^n$]),
    2,
  )

  #question(
    [A transposition is a cycle of length:],
    ([$1$], [$2$], [$3$], [$n$]),
    1,
  )

  #question(
    [The order of the permutation $(1 space 2 space 3)(4 space 5)$ in $S_5$ is:],
    ([$2$], [$3$], [$5$], [$6$]),
    3,
  )

  #question(
    [For $n >= 3$, the group $S_n$ is:],
    ("Abelian", "Cyclic", "Non-abelian", "Trivial"),
    2,
  )

  #question(
    [The alternating group $A_n$ consists of:],
    (
      [All permutations of $n$ elements],
      [All even permutations of $n$ elements],
      [All odd permutations of $n$ elements],
      [All transpositions of $n$ elements],
    ),
    1,
  )

  #question(
    [The order of $A_n$ is:],
    ([$n!$], [$n!/2$], [$(n-1)!$], [$n!/4$]),
    1,
  )

  #question(
    [The order of the permutation $(1 space 2 space 3 space 4)$ in $S_4$ is:],
    ([$2$], [$3$], [$4$], [$6$]),
    2,
  )

  #question(
    [Which of the following is an even permutation in $S_4$?],
    (
      [$(1 space 2)$],
      [$(1 space 2)(3 space 4)$],
      [$(1 space 2 space 3 space 4)$],
      [$(2 space 3)$],
    ),
    1,
  )

  #question(
    [True or False: The factorization of a permutation into transpositions is unique.],
    (
      ["True -- the factorization is always unique"],
      ["False -- the factorization is not unique, but the parity (even/odd) is invariant"],
      ["True -- but only for $n <= 4$"],
      ["False -- parity also changes depending on the decomposition"],
    ),
    1,
  )

  #question(
    [$S_3$ is isomorphic to which familiar group?],
    ([$ZZ_6$], [$ZZ_2 times ZZ_3$], [$D_3$ (dihedral group of order 6)], [$A_4$]),
    2,
  )
]

=== Supplementary Problems

#supplementary[
  Write the following permutations in $S_5$ in cycle notation and determine the order of each:
  $sigma = mat(1, 2, 3, 4, 5; 3, 1, 4, 5, 2)$ and $tau = mat(1, 2, 3, 4, 5; 2, 1, 5, 3, 4)$.
]

#supplementary[
  In $S_5$, compute the products $sigma tau$ and $tau sigma$ for the permutations above, and confirm that $S_5$ is non-abelian.
]

#supplementary[
  Show that $A_n$ is a normal subgroup of $S_n$ for all $n >= 2$.
]

#supplementary[
  List all 12 elements of $A_4$ and count how many belong to each cycle type.
]

#supplementary[
  Find the order of every element of $S_3$ and verify that each order divides $|S_3| = 6$ (Lagrange's Theorem).
]

#supplementary[
  Show that the sign map $"sgn" : S_n -> ({+1, -1}, times)$, defined by $"sgn"(sigma) = +1$ if $sigma$ is even and $-1$ if $sigma$ is odd, is a group homomorphism with kernel $A_n$.
]

#supplementary[
  For $n >= 3$, prove that the center of $S_n$ is trivial: $Z(S_n) = {e}$.
]
