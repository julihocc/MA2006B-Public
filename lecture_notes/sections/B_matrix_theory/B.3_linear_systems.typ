#import "../../utils.typ": *
== Systems of Linear Equations

=== Theory

#definition("System of Linear Equations")[
  A *system of $m$ linear equations in $n$ unknowns* over a field $F$ is:
  $
    a_(11) x_1 + a_(12) x_2 + ... + a_(1n) x_n &= b_1 \
    a_(21) x_1 + a_(22) x_2 + ... + a_(2n) x_n &= b_2 \
    &dots.v \
    a_(m 1) x_1 + a_(m 2) x_2 + ... + a_(m n) x_n &= b_m
  $
  In matrix form: $A bold(x) = bold(b)$, where $A in M_(m times n)(F)$, $bold(x) in F^n$, $bold(b) in F^m$.
]

#definition("Augmented Matrix and Row Reduction")[
  The *augmented matrix* $[A | bold(b)]$ encodes the full system. *Elementary row operations* are:
  + Swap two rows.
  + Multiply a row by a non-zero scalar.
  + Add a scalar multiple of one row to another.

  These operations preserve the solution set and are used in *Gaussian elimination* to reduce $[A | bold(b)]$ to *row echelon form (REF)* or *reduced row echelon form (RREF)*.
]

#theorem("Solution Structure")[
  The system $A bold(x) = bold(b)$ has:
  - *No solution* if the system is inconsistent (a row $[0 space 0 ... 0 | c]$ with $c != 0$ appears in REF).
  - *Exactly one solution* if the system is consistent and has no free variables.
  - *Infinitely many solutions* if the system is consistent and has at least one free variable.
]

#definition("Homogeneous System")[
  The system $A bold(x) = bold(0)$ is called *homogeneous*. It always has at least the *trivial solution* $bold(x) = bold(0)$.

  If $A$ is square and $det(A) != 0$, the only solution is trivial. If $det(A) = 0$, there are infinitely many.
]

#theorem("Solving Square Systems via Inverses")[
  If $A in M_n(F)$ is invertible ($det(A) != 0$), the unique solution to $A bold(x) = bold(b)$ is:
  $ bold(x) = A^{-1} bold(b) $
]

#note[
  Systems of linear equations over $ZZ_p$ (a finite field) are solved exactly as over $RR$, using modular arithmetic throughout. This appears in lattice-based cryptography and other advanced topics.
]

=== Solved Problems

#solved_problem[
  Solve the system:
  $2x + y = 5$, $4x + 3y = 11$.
]
#solution[
  Augmented matrix $[A | bold(b)] = mat(2, 1, 5; 4, 3, 11; augment: #(-1))$.

  $R_2 arrow.l R_2 - 2 R_1$: $mat(2, 1, 5; 0, 1, 1; augment: #(-1))$.

  Back-substitute: $y = 1$; $2x + 1 = 5 => x = 2$.

  Solution: $(x, y) = (2, 1)$.
]

#solved_problem[
  Solve using matrix inverse: $3x + 2y = 7$, $x + y = 3$.
]
#solution[
  $A = mat(3, 2; 1, 1)$, $det(A) = 3 - 2 = 1$.
  $A^{-1} = mat(1, -2; -1, 3)$.
  $bold(x) = A^{-1} bold(b) = mat(1,-2;-1,3) mat(7;3) = mat(7-6;-7+9) = mat(1;2)$.
  Solution: $(x, y) = (1, 2)$.
]

#solved_problem[
  Determine the solution set of $x + 2y + 3z = 6$, $2x + y + z = 7$, $x - y + 2z = 1$.
]
#solution[
  Augmented matrix:
  $mat(1, 2, 3, 6; 2, 1, 1, 7; 1, -1, 2, 1; augment: #(-1))$.

  $R_2 arrow.l R_2 - 2R_1$, $R_3 arrow.l R_3 - R_1$:
  $mat(1, 2, 3, 6; 0, -3, -5, -5; 0, -3, -1, -5; augment: #(-1))$.

  $R_3 arrow.l R_3 - R_2$:
  $mat(1, 2, 3, 6; 0, -3, -5, -5; 0, 0, 4, 0; augment: #(-1))$.

  From $R_3$: $4z = 0 => z = 0$.
  From $R_2$: $-3y = -5 => y = 5/3$.
  From $R_1$: $x = 6 - 2(5/3) - 0 = 8/3$.

  Solution: $(x, y, z) = (8/3, 5/3, 0)$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [The matrix form of $A bold(x) = bold(b)$ with $A$ invertible has solution:],
    ([$bold(x) = bold(b) A^{-1}$], [$bold(x) = A^{-1} bold(b)$], [$bold(x) = det(A) bold(b)$], [$bold(x) = A bold(b)$]),
    1,
  )

  #question(
    [A homogeneous system $A bold(x) = bold(0)$ always has:],
    (["No solution"], ["The trivial solution $bold(x) = bold(0)$"], ["Infinitely many solutions"], ["Exactly one non-trivial solution"]),
    1,
  )

  #question(
    [Gaussian elimination preserves the solution set of the system because:],
    (["Determinants are unchanged"], ["Elementary row operations are reversible"], ["Augmented matrices are symmetric"], ["Matrices are always invertible"]),
    1,
  )

  #question(
    [A system $A bold(x) = bold(b)$ with a row $[0 space 0 | 5]$ in REF is:],
    (["Inconsistent (no solution)"], ["Consistent with a free variable"], ["Consistent with unique solution"], ["Homogeneous"]),
    0,
  )

  #question(
    [If $A$ is $n times n$ and $det(A) != 0$, the system $A bold(x) = bold(b)$ has:],
    (["No solution"], ["Infinitely many solutions"], ["Exactly one solution"],[" A free variable"]),
    2,
  )

  #question(
    [RREF stands for:],
    (["Row-Reduced Elimination Form"], ["Reduced Row Echelon Form"], ["Real Row Echelon Form"], ["Right-hand Reduction Extended Form"]),
    1,
  )

  #question(
    [Free variables arise when:],
    (["$det(A) != 0$"], ["There are more unknowns than pivot positions"], ["The system is inconsistent"], ["Every row has a pivot"]),
    1,
  )

  #question(
    [Which elementary row operation changes the determinant?],
    (["Add a multiple of one row to another"], ["Swap two rows"], ["Multiply a row by 2"], ["Both swapping and scaling"]),
    3,
  )

  #question(
    [In the solution to $3x+2y=7, x+y=3$, what is $y$?],
    (["1"], ["2"], ["3"], ["0"]),
    1,
  )

  #question(
    [Solving linear systems over $ZZ_p$ uses:],
    (["Floating-point arithmetic"], ["Modular arithmetic throughout"], ["The real number field"], ["Complex numbers"]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Solve the system over $ZZ_7$: $3x + 2y equiv 1 space (mod 7)$, $5x + y equiv 4 space (mod 7)$.
]

#supplementary[
  Show that if $A bold(x) = bold(b)$ has two different solutions $bold(x)_1$ and $bold(x)_2$, then it has infinitely many.
]

#supplementary[
  Find all solutions to the homogeneous system $x - y + z = 0$, $2x + y - z = 0$.
]

#supplementary[
  Express the Hill cipher encryption $bold(c) = K bold(p) space (mod 26)$ as a system of linear equations mod 26, and describe decryption.
]

#supplementary[
  Use Gaussian elimination to find the rank of $mat(1,2,3;4,5,6;7,8,9)$.
]

#supplementary[
  Prove that the solution set of a consistent non-homogeneous system $A bold(x) = bold(b)$ is a coset of the solution set of $A bold(x) = bold(0)$.
]
