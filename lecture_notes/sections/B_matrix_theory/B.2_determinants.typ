#import "../../utils.typ": *
== Determinants and Inverses

=== Theory

#definition("Determinant")[
  The *determinant* of a square matrix $A in M_n(F)$, denoted $det(A)$ or $|A|$, is a scalar that encodes key information about $A$.

  For the $2 times 2$ case: $det mat(a, b; c, d) = a d - b c$.

  For the $3 times 3$ case (cofactor expansion along row 1):
  $ det mat(a, b, c; d, e, f; g, h, i) = a(e i - f h) - b(d i - f g) + c(d h - e g) $

  In general, $det(A)$ is computed by cofactor expansion along any row or column.
]

#theorem("Properties of Determinants")[
  For $A, B in M_n(F)$:
  + $det(A B) = det(A) det(B)$ (multiplicativity).
  + $det(A^T) = det(A)$.
  + $det(c A) = c^n det(A)$ for scalar $c$.
  + Swapping two rows (or columns) negates the determinant.
  + Adding a multiple of one row to another does not change the determinant.
  + $det(I_n) = 1$.
]

#definition("Invertible Matrix")[
  A square matrix $A in M_n(F)$ is *invertible* (or *non-singular*) if there exists a matrix $A^{-1}$ such that:
  $ A A^{-1} = A^{-1} A = I_n $

  *Invertibility criterion*: $A$ is invertible if and only if $det(A) != 0$.
]

#definition("Inverse Formula for $2 times 2$ Matrices")[
  For $A = mat(a, b; c, d)$ with $det(A) = a d - b c != 0$:
  $ A^{-1} = 1/(a d - b c) mat(d, -b; -c, a) $
]

#theorem("General Linear Group")[
  The set of invertible $n times n$ matrices over a field $F$:
  $ "GL"(n, F) = {A in M_n(F) : det(A) != 0} $
  forms a *group* under matrix multiplication, called the *general linear group*. This group is non-abelian for $n >= 2$.
]

#note[
  *Hill cipher decryption*: The Hill cipher encrypts $bold(c) = K bold(p) space (mod 26)$. Decryption requires $K^{-1} mod 26$, the matrix inverse computed over $ZZ_{26}$. This requires $det(K)$ to be coprime to 26 (i.e., $gcd(det(K), 26) = 1$).
]

=== Solved Problems

#solved_problem[
  Compute $det mat(3, 5; 2, 4)$ and $det mat(1, 2, 0; 3, -1, 2; 0, 1, 4)$.
]
#solution[
  *2×2*: $det mat(3,5;2,4) = 12 - 10 = 2$.

  *3×3* (expand along row 1):
  $det = 1 dot det mat(-1,2;1,4) - 2 dot det mat(3,2;0,4) + 0$
  $= 1 dot (-4-2) - 2 dot (12-0) = -6 - 24 = -30$.
]

#solved_problem[
  Find the inverse of $A = mat(2, 1; 5, 3)$ and verify.
]
#solution[
  $det(A) = 6 - 5 = 1$.
  $A^{-1} = 1/1 mat(3, -1; -5, 2) = mat(3, -1; -5, 2)$.

  Verify: $A A^{-1} = mat(2,1;5,3) mat(3,-1;-5,2) = mat(6-5, -2+2; 15-15, -5+6) = mat(1,0;0,1) = I_2$. ✓
]

#solved_problem[
  Find the inverse of $K = mat(3, 3; 2, 5)$ over $ZZ_(26)$ for the Hill cipher.
]
#solution[
  $det(K) = 15 - 6 = 9$. Check: $gcd(9, 26) = 1$ ✓ (so inverse exists over $ZZ_{26}$).

  $9^{-1} mod 26$: $9 dot 3 = 27 equiv 1 space (mod 26)$, so $9^{-1} = 3$.

  $K^{-1} = 3 dot mat(5, -3; -2, 3) equiv 3 dot mat(5, 23; 24, 3) = mat(15, 69; 72, 9) equiv mat(15, 17; 20, 9) space (mod 26)$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [$det mat(a,b;c,d) =$],
    ([$a c - b d$], [$a d - b c$], [$a b - c d$], [$a d + b c$]),
    1,
  )

  #question(
    [A matrix $A$ is invertible iff:],
    (["$A$ is symmetric"], ["$det(A) != 0$"], ["$A$ is square"], ["$det(A) = 1$"]),
    1,
  )

  #question(
    [For $A, B$ square, $det(A B) =$],
    ([$det(A) + det(B)$], [$det(A) dot det(B)$], [$det(A - B)$], [$1$]),
    1,
  )

  #question(
    [The general linear group $"GL"(n, F)$ is:],
    (["All $n times n$ matrices"], ["All invertible $n times n$ matrices"], ["Diagonal matrices only"], ["Symmetric matrices only"]),
    1,
  )

  #question(
    [Swapping two rows of a matrix:],
    (["Does not change $det$"], ["Negates $det$"], ["Doubles $det$"], ["Sets $det = 0$"]),
    1,
  )

  #question(
    [$det(I_n) =$],
    (["0"], ["$n$"], ["1"], ["$-1$"]),
    2,
  )

  #question(
    [For the Hill cipher, $K^{-1}$ over $ZZ_{26}$ exists iff:],
    (["$det(K)$ is prime"], ["$gcd(det(K), 26) = 1$"], ["$K$ is symmetric"], ["$det(K) = 1$"]),
    1,
  )

  #question(
    [The inverse of $mat(2,1;5,3)$ is:],
    ([$mat(3,-1;-5,2)$], [$mat(3,1;5,2)$], [$mat(-3,1;5,-2)$], [$mat(2,-1;-5,3)$]),
    0,
  )

  #question(
    [$det(A^T) =$],
    ([$-det(A)$], [$1/det(A)$], [$det(A)$], [$0$]),
    2,
  )

  #question(
    [Is $"GL"(2, RR)$ abelian?],
    (["Yes"], ["No — matrix multiplication is non-commutative"], ["Only for diagonal matrices"], ["Yes, for $2 times 2$ only"]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Compute the determinant of $mat(1, 2, 3; 0, 4, 5; 1, 0, 6)$ by cofactor expansion along column 1.
]

#supplementary[
  Find the inverse of $mat(1, 2; 3, 7)$ over $RR$ and verify.
]

#supplementary[
  Show that if $det(A) = 0$, then $A$ has no inverse. (Hint: use $det(A B) = det(A)det(B)$.)
]

#supplementary[
  For the Hill cipher with $K = mat(6, 24; 1, 13)$ over $ZZ_{26}$, verify that $det(K) = 54 equiv 2 space (mod 26)$ and check whether $K$ is invertible.
]

#supplementary[
  Prove that $"GL"(n, F)$ is closed under matrix multiplication.
]

#supplementary[
  Compute the determinant of a $3 times 3$ lower triangular matrix and show it equals the product of diagonal entries.
]
