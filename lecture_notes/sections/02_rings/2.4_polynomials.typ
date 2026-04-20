#import "../../utils.typ": *
== Polynomial Rings

=== Theory
#definition("Polynomial Ring")[
  A *Polynomial Ring* $R[x]$ consists of polynomials with coefficients in a ring $R$.
  The division algorithm for polynomials holds if $R$ is a field.
]




#definition("Irreducible Polynomial")[
  A polynomial $P(x)$ is *irreducible* over a field $F$ if it cannot be factored into two non-constant polynomials in $F[x]$.
]



#theorem("Finite Field Construction")[
  Finite fields of order $p^n$, denoted $"GF"(p^n)$, are constructed as $(ZZ_(p))[x] slash (P(x))$, where $ZZ_(p) = ZZ slash p ZZ$ and $P(x)$ is an irreducible polynomial of degree $n$.
]

#proof[
  Let $F = (ZZ_(p))[x] slash (P(x))$. $F$ is a commutative ring with unity.
  Let $f(x) in F$ be non-zero (meaning it is not a multiple of $P(x)$). Since $P(x)$ is irreducible and $deg(f) < deg(P)$, $gcd(f, P) = 1$.
  By EEA for polynomials, there exist $a(x), b(x)$ such that $a(x) f(x) + b(x) P(x) = 1$.
  Taking this equation modulo $P(x)$, we get $a(x) f(x) equiv 1$.
  Thus every non-zero element has an inverse, making $F$ a field.
]



=== Solved Problems

#solved_problem[
  Identify two polynomial rings with different coefficient systems and state how arithmetic differs.
]
#solution[
  *Input*:
  - Coefficient set 1: $ZZ$
  - Coefficient set 2: $RR$

  *Procedure*:
  1. Build polynomials in $x$ with coefficients from each set.
  2. Compare coefficient arithmetic in each case.

  *Result*:
  - $ZZ[x]$: coefficients are integers, so arithmetic uses integer operations.
  - $RR[x]$: coefficients are real numbers, so arithmetic uses real-number operations.
]

#solved_problem[
  Determine whether $x^2 + 1$ is reducible over $RR$, $CC$, and $ZZ_(2)$.
]
#solution[
  *Input*: polynomial $f(x) = x^2 + 1$.

  *Procedure*:
  1. Over $RR$: solve $x^2 + 1 = 0$. No real solution exists.
  2. Over $CC$: roots are $x = i$ and $x = -i$, so factorization exists.
  3. Over $ZZ_(2)$: evaluate candidate roots.
    - $f(0) = 1 != 0$
     - $f(1) = 1 + 1 = 0$ in $ZZ_(2)$
     Hence $x+1$ is a factor.

  *Result*:
  - Over $RR$: irreducible.
  - Over $CC$: reducible, $x^2 + 1 = (x-i)(x+i)$.
  - Over $ZZ_(2)$: reducible, $x^2 + 1 = (x+1)^2$.
]

#solved_problem[
  State the finite-field models used by AES and ECC and identify their defining polynomial or modulus.
]
#solution[
  *Input*: cryptographic systems AES and ECC.

  *Procedure*:
  1. For AES, identify byte arithmetic field representation.
  2. For ECC, list the standard field families used for curve arithmetic.

  *Result*:
  - *AES*: arithmetic in $"GF"(2^8)$, represented via the irreducible polynomial $x^8 + x^4 + x^3 + x + 1$.
  - *ECC*: arithmetic over $"GF"(p)$ or $"GF"(2^m)$ depending on curve family.
]

#solved_problem[
  Compute $f(x) + g(x)$ and $f(x) g(x)$ in $(ZZ_(2))[x]$ for
  $f(x) = x^2 + x + 1$ and $g(x) = x + 1$.
]
#solution[
  *Input*: $f(x) = x^2 + x + 1$, $g(x) = x + 1$, coefficients mod 2.

  *Procedure*:
  1. Add termwise:
    $f+g = x^2 + x + 1 + x + 1 = x^2 + 2x + 2$.
  2. Reduce coefficients mod 2:
    $2 equiv 0$, so $f+g = x^2$.
  3. Multiply and collect terms:
    $f(x)g(x) = (x^2 + x + 1)(x+1) = x^3 + x^2 + x^2 + x + x + 1$.
  4. Reduce mod 2:
    $x^2 + x^2 = 0$, $x + x = 0$.

  *Result*:
  - $f(x)+g(x) = x^2$
  - $f(x)g(x) = x^3 + 1$
]

#solved_problem[
  Factor $x^2 - 1$ in $(ZZ_(5))[x]$ using modular arithmetic.
]
#solution[
  *Input*: polynomial $x^2 - 1$ over $ZZ_(5)$.

  *Procedure*:
  1. Apply difference of squares: $x^2 - 1 = (x-1)(x+1)$.
  2. Rewrite coefficients in $ZZ_(5)$: $-1 equiv 4$.

  *Result*:
  $x^2 - 1 = (x+4)(x+1)$ in $(ZZ_(5))[x]$.
]

#solved_problem[
  Test irreducibility of $x^3 + x + 1$ in $(ZZ_(2))[x]$.
]
#solution[
  *Input*: $f(x)=x^3+x+1$ over $ZZ_(2)$.

  *Procedure*:
  1. Use the root test for degree 3 polynomials over a field:
     reducible iff there is a root in the field.
  2. Evaluate all elements of $ZZ_(2)=\{0,1\}$:
    - $f(0)=1 != 0$
    - $f(1)=1+1+1=1$ in $ZZ_(2)$, so $f(1) != 0$

  *Result*:
  No root exists in $ZZ_(2)$, so $x^3+x+1$ is irreducible in $(ZZ_(2))[x]$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [A polynomial ring $R[x]$ consists of polynomials with coefficients in a:],
    ("Ring R", "Field F", "Group G", "Vector Space V"),
    0,
  )

  #question(
    [The degree of the zero polynomial is typically defined as:],
    ("0", "1", "-1 or -infinity", "Undefined"),
    2,
  )

  #question(
    [If $R$ is an integral domain, then $deg(f dot g) =$ :],
    ([$deg(f) + deg(g)$], [$deg(f) dot deg(g)$], [$max(deg(f), deg(g))$], [$deg(f) - deg(g)$]),
    0,
  )

  #question(
    [A polynomial $P(x)$ is irreducible over a field $F$ if it cannot be factored into two polynomials of:],
    ("Lower degree", "Same degree", "Higher degree", "Zero degree"),
    0,
  )

  #question(
    [Over $RR$, the polynomial $x^2 + 1$ is:],
    ("Irreducible", "Reducible", "Linear", "Zero"),
    0,
  )

  #question(
    [Finite fields of order $p^n$, denoted $"GF"(p^n)$, are constructed using an irreducible polynomial of degree:],
    ("n", "p", "p^n", "1"),
    0,
  )

  #question(
    [The number of elements in the quotient ring $(ZZ_(p))[x] slash (P(x))$ where $deg(P)=n$ is:],
    ([$p^n$], [$p$], [$n$], [$p n$]),
    0,
  )

  #question(
    [If $f(alpha) = 0$, then which term divides $f(x)$?],
    ([$x - alpha$], [$x + alpha$], [$alpha$], [$f(alpha)$]),
    0,
  )

  #question(
    [AES encryption uses arithmetic in which finite field?],
    ([$"GF"(2^8)$], [$"GF"(2)$], [$"GF"(128)$], [$ZZ_{256}$]),
    0,
  )

  #question(
    [Eisenstein's Criterion is a test for:],
    ("Irreducibility", "Reducibility", "Linearity", "Continuity"),
    0,
  )
]

=== Supplementary Problems

#supplementary[
  List all irreducible polynomials of degree 2 in $(ZZ_(2))[x]$.
]

#supplementary[
  Construct the multiplication table for the field $"GF"(4)$ constructed as $(ZZ_(2))[x] slash (x^2+x+1)$.
]

#supplementary[
  Factor $x^4 - 1$ over $ZZ_(5)$.
]

#supplementary[
  Determine if $x^3 + 2x + 1$ is irreducible over $ZZ_(3)$.
]

#supplementary[
  Find the inverse of $x+1$ in the field $"GF"(2^3)$ defined by modulus $x^3+x+1$.
]

#supplementary[
  Compute $(x^2+1)(x+1)$ in $"GF"(2^4)$ with irreducible polynomial $x^4+x+1$.
]

#supplementary[
  Show that $x^4+1$ is reducible over $ZZ_2$.
]

#supplementary[
  Use the Remainder Theorem to find the remainder when $x^3 + 2x^2 + 2$ is divided by $x-1$ in $(ZZ_(3))[x]$.
]

#supplementary[
  Find a polynomial $f(x) in (ZZ_(5))[x]$ of degree 2 that has roots $1$ and $3$.
]

#supplementary[
  Prove that if $F$ is a field, then $F[x]$ is a Principal Ideal Domain.
]
