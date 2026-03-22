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
