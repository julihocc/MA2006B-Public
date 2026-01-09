#import "../../utils.typ": solution, proof, definition, theorem, proposition, corollary, example, solution
== Permutation Groups

=== Theory
#definition("Permutation Group")[
  A *permutation group* is a group $G$ whose elements are permutations of a given set $M$ and whose group operation is function composition. The symmetric group $S_n$ consists of all permutations of a set of $n$ elements and has order $n!$.
]

#proposition("Cycle Decomposition")[
  Any permutation can be decomposed into disjoint cycles. The order of a permutation is the least common multiple (LCM) of the lengths of these disjoint cycles.
  #proof[
    Consider the limit of the sequence $x, sigma(x), sigma^2(x), ...$ for any $x$. Since the set is finite, it must loop back to $x$. This forms a cycle. Removing these elements and repeating the process decomposes the entire permutation into disjoint cycles.
    For disjoint cycles, operations commute. Order is the smallest $k$ such that $"LCM"(l_1, ..., l_m)$ divides $k$.
  ]
]

=== Examples
#example[
  In $S_5$, let $sigma = (1 space 2 space 3)(4 space 5)$.
  This is a composition of a 3-cycle and a 2-cycle.
  Order of $sigma = "lcm"(3, 2) = 6$.
  Computing $sigma^2$:
  $sigma^2 = (1 space 2 space 3)^2 (4 space 5)^2 = (1 space 3 space 2)(e) = (1 space 3 space 2)$.
]

#example[
  *Ciphers*: Permutation groups are the basis of many classical ciphers (like the Enigma machine, which used complex permutations). In modern design, substitution-permutation networks (SPNs) used in block ciphers like AES rely heavily on mixing (permutations) and substitution (S-boxes, which are often defined via other algebraic properties) to achieve confusion and diffusion.
]

=== Exercises
+ Calculate the product of permutations $pi = (1 space 3 space 4)$ and $sigma = (1 space 2)(3 space 4)$ in $S_4$.
#solution[
  Compute from right to left (standard function composition): $pi sigma$.
  - $1 arrow^sigma 2 arrow^pi 2$
  - $2 arrow^sigma 1 arrow^pi 3$
  - $3 arrow^sigma 4 arrow^pi 1$
  - $4 arrow^sigma 3 arrow^pi 4$
  Result: $(1 space 2 space 3)$.
]
+ Find the order of the permutation $(1 space 2 space 4)(3 space 5 space 6)$ in $S_6$.
#solution[
  It's a product of disjoint cycles of length 3 and 3.
  Order = $"lcm"(3, 3) = 3$.
]
+ How many elements does $S_4$ have? List 5 different elements.
#solution[
  $|S_4| = 4! = 24$.
  Examples: $e, (1 space 2), (1 space 3), (1 space 2 space 3), (1 space 2)(3 space 4)$.
]
