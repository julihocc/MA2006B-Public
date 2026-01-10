#import "../../utils.typ": *
== Definition and Examples of Groups

=== Theory
#definition("Group")[
  A *group* is a set $G$ equipped with a binary operation $dot: G times G arrow G$ satisfying the following axioms:
  + *Closure*: For all $a, b in G$, the result $a dot b$ is also in $G$.
  + *Associativity*: For all $a, b, c in G$, $(a dot b) dot c = a dot (b dot c)$.
  + *Identity Element*: There exists an element $e in G$ such that for every element $a in G$, $e dot a = a dot e = a$.
  + *Inverse Element*: For each $a in G$, there exists an element $b in G$, commonly denoted $a^(-1)$, such that $a dot b = b dot a = e$.

  If the operation is also commutative (i.e., $a dot b = b dot a$ for all $a, b in G$), the group is called an *abelian group*.
]

#example[
  The set of integers $ZZ$ under addition is an infinite abelian group. The identity is $0$, and the inverse of $a$ is $-a$.
]

#example[
  The set $ZZ_n = {0, 1, ..., n-1}$ under addition modulo $n$ is a finite abelian group of order $n$.
]

#example[
  *Cryptography*: Groups are the foundation of many cryptographic primitives.
  - *Diffie-Hellman Key Exchange* relies on the difficulty of the Discrete Logarithm Problem in a cyclic group.
  - *RSA* uses the multiplicative group of integers modulo $n$, denoted $ZZ_n^*$.
]

=== Solved Problems

#solved_problem[
  *Modular Addition*

  In $ZZ_(26)$ (often used for classical ciphers), compute $15 + 18 mod 26$.
]
#solution[
  $ 15 + 18 = 33 $
  Dividing by 26: $33 = 1 dot 26 + 7$.
  $ 33 equiv 7 (mod 26) $
]

#solved_problem[
  Verify if the set of non-zero real numbers $RR^*$ under multiplication forms a group.
]
#solution[
  Yes, $(RR^*, dot)$ is a group.
  - *Closure*: The product of two non-zero real numbers is non-zero ($a != 0, b != 0 => a b != 0$).
  - *Associativity*: Multiplication is associative in $RR$.
  - *Identity*: $1 in RR^*$ satisfies $1 dot a = a$.
  - *Inverse*: For every $a in RR^*$, $1/a in RR^*$ is the inverse ($a dot 1/a = 1$).
]

#solved_problem[
  Compute the inverse of $3$ in the group $ZZ_(11)$ under multiplication.
]
#solution[
  We need $x$ such that $3x equiv 1 (mod 11)$.
  Testing values:
  $3(1)=3, 3(2)=6, 3(3)=9, 3(4)=12$.
  Since $12 equiv 1 (mod 11)$, then $3(4) equiv 1$.
  Thus, $3^(-1) = 4$.
]

=== Supplementary Problems

#supplementary[
  Determine if the set of $2 times 2$ matrices with integer entries forms a group under matrix addition.
]

#supplementary[
  Does the set of integers $ZZ$ form a group under subtraction?
]
