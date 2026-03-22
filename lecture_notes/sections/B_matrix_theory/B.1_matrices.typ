#import "../../utils.typ": *
== Matrices and Operations

=== Theory

#definition("Matrix")[
  An *$m times n$ matrix* over a field $F$ is a rectangular array of $m$ rows and $n$ columns of elements from $F$:
  $ A = mat(a_(11), a_(12), ..., a_(1n); a_(21), a_(22), ..., a_(2n); dots.v, dots.v, dots.down, dots.v; a_(m 1), a_(m 2), ..., a_(m n)) $
  We write $A in M_(m times n)(F)$. The element in row $i$ and column $j$ is denoted $A_(i j)$ or $[A]_(i j)$.
]

#definition("Special Matrices")[
  - *Square matrix*: $m = n$; we write $A in M_n(F)$.
  - *Zero matrix* $bold(0)$: All entries are zero.
  - *Identity matrix* $I_n$: Square matrix with $[I_n]_(i j) = 1$ if $i = j$ and $0$ otherwise.
  - *Diagonal matrix*: Square matrix with $A_(i j) = 0$ for $i != j$.
  - *Transpose* $A^T$: $(A^T)_(i j) = A_(j i)$; rows and columns are swapped.
  - *Symmetric matrix*: $A = A^T$.
]

#definition("Matrix Addition and Scalar Multiplication")[
  For matrices $A, B in M_(m times n)(F)$ and scalar $c in F$:
  - *Addition*: $(A + B)_(i j) = A_(i j) + B_(i j)$. (Defined only when dimensions match.)
  - *Scalar multiplication*: $(c A)_(i j) = c dot A_(i j)$.

  Under these operations, $M_(m times n)(F)$ forms a vector space.
]

#definition("Matrix Multiplication")[
  For $A in M_(m times k)(F)$ and $B in M_(k times n)(F)$, the *product* $C = A B in M_(m times n)(F)$ is defined by:
  $ C_(i j) = sum_{l=1}^{k} A_(i l) B_(l j) $
  The "inner dimensions" must match. Matrix multiplication is *associative* but generally *not commutative* ($A B != B A$ in general).
]

#theorem("Ring Structure of $M_n(F)$")[
  The set of $n times n$ matrices $M_n(F)$ with matrix addition and multiplication forms a *non-commutative ring with unity* $I_n$. It is not an integral domain for $n >= 2$ because zero divisors exist (non-zero matrices whose product is zero).
]

=== Solved Problems

#solved_problem[
  Let $A = mat(1, 2; 3, 4)$ and $B = mat(0, 1; 1, 0)$. Compute $A B$, $B A$, and show $A B != B A$.
]
#solution[
  $A B = mat(1 dot 0 + 2 dot 1, 1 dot 1 + 2 dot 0; 3 dot 0 + 4 dot 1, 3 dot 1 + 4 dot 0) = mat(2, 1; 4, 3)$.

  $B A = mat(0 dot 1 + 1 dot 3, 0 dot 2 + 1 dot 4; 1 dot 1 + 0 dot 3, 1 dot 2 + 0 dot 4) = mat(3, 4; 1, 2)$.

  Since $mat(2,1;4,3) != mat(3,4;1,2)$, matrix multiplication is non-commutative.
]

#solved_problem[
  Show that the Hill cipher matrix $K = mat(3, 3; 2, 5)$ over $ZZ_(26)$ can be applied to the plaintext vector $bold(p) = mat(7; 8)$ to produce a ciphertext.
]
#solution[
  Compute $bold(c) = K bold(p) mod 26$:
  $ bold(c) = mat(3, 3; 2, 5) mat(7; 8) = mat(21 + 24; 14 + 40) = mat(45; 54) equiv mat(19; 2) space (mod 26) $
  The ciphertext vector is $(19, 2)$, corresponding to letters "TC".
]

#solved_problem[
  Prove that $(A B)^T = B^T A^T$ for matrices $A$ and $B$ of compatible dimensions.
]
#solution[
  Let $C = A B$, so $C_(i j) = sum_l A_(i l) B_(l j)$.
  Then $(C^T)_(i j) = C_(j i) = sum_l A_(j l) B_(l i) = sum_l (B^T)_(i l) (A^T)_(l j) = (B^T A^T)_(i j)$.
  Thus $(A B)^T = B^T A^T$. $square$
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [An $m times n$ matrix has:],
    (["$m$ columns and $n$ rows"], ["$m$ rows and $n$ columns"], ["$m n$ rows"], ["$m + n$ entries"]),
    1,
  )

  #question(
    [Matrix multiplication $A B$ requires:],
    (["$A$ and $B$ to be square"], ["The number of columns of $A$ to equal rows of $B$"], ["$A = B$"], ["$A$ and $B$ to have the same dimensions"]),
    1,
  )

  #question(
    [$(A B)^T$ equals:],
    ([$A^T B^T$], [$B^T A^T$], [$A B$], [$B A$]),
    1,
  )

  #question(
    [The identity matrix $I_n$ satisfies $A I_n =$],
    ([$I_n$], [$A$], [$0$], [$A^T$]),
    1,
  )

  #question(
    [True or False: Matrix multiplication is commutative.],
    (["True"], ["False — $A B != B A$ in general"], ["Only for diagonal matrices"], ["Only for symmetric matrices"]),
    1,
  )

  #question(
    [The ring $M_n(F)$ for $n >= 2$ is:],
    (["A field"], ["An integral domain"], ["A non-commutative ring with zero divisors"], ["An abelian group only"]),
    2,
  )

  #question(
    [A symmetric matrix satisfies:],
    ([$A = -A^T$], [$A = A^T$], [$A^2 = I$], [$A = A^{-1}$]),
    1,
  )

  #question(
    [In the Hill cipher, the key is a:],
    (["Prime number"], ["Matrix over $ZZ_{26}$"], ["Polynomial"], ["Vector"]),
    1,
  )

  #question(
    [Scalar multiplication $(c A)_(i j) =$],
    ([$c + A_(i j)$], [$c dot A_(i j)$], [$A_(i j) / c$], [$c^2 dot A_(i j)$]),
    1,
  )

  #question(
    [The zero matrix $bold(0)$ satisfies $A + bold(0) =$],
    ([$bold(0)$], [$A$], [$I$], [$-A$]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Compute $A + B$, $A - B$, and $2A$ for $A = mat(1, -1; 0, 2)$ and $B = mat(3, 1; -1, 0)$.
]

#supplementary[
  Show that $(A + B)C = A C + B C$ (distributivity) for $2 times 2$ matrices.
]

#supplementary[
  Find all $2 times 2$ matrices that commute with every $2 times 2$ matrix (i.e., the center of $M_2(RR)$).
]

#supplementary[
  In the Hill cipher over $ZZ_{26}$, apply key $K = mat(6, 24; 1, 13)$ to plaintext vector $mat(0; 2)$ (letters "AC").
]

#supplementary[
  Prove that matrix addition makes $M_(m times n)(F)$ an abelian group.
]

#supplementary[
  Give an example of two non-zero $2 times 2$ matrices $A, B$ over $ZZ_5$ such that $A B = bold(0)$.
]
