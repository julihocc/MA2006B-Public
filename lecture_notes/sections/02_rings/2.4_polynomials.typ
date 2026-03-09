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
  Finite fields of order $p^n$, denoted $"GF"(p^n)$, are constructed as $ZZ_p[x] / chevron.l P(x) chevron.r$ where $P(x)$ is an irreducible polynomial of degree $n$ over $ZZ_p$.
]

#proof[
  Let $F = ZZ_p[x] / chevron.l P(x) chevron.r$. $F$ is a commutative ring with unity.
  Let $f(x) in F$ be non-zero (meaning it is not a multiple of $P(x)$). Since $P(x)$ is irreducible and $deg(f) < deg(P)$, $gcd(f, P) = 1$.
  By EEA for polynomials, there exist $a(x), b(x)$ such that $a(x) f(x) + b(x) P(x) = 1$.
  Taking this equation modulo $P(x)$, we get $a(x) f(x) equiv 1$.
  Thus every non-zero element has an inverse, making $F$ a field.
]



=== Solved Problems

#solved_problem[
  Give two examples of polynomial rings with different coefficient structures.
]
#solution[
  - $ZZ[x]$ is the ring of polynomials with integer coefficients.
  - $RR[x]$ is the ring of polynomials with real coefficients.
]

#solved_problem[
  Analyze the reducibility of the polynomial $x^2 + 1$ over the fields $RR$, $CC$, and $ZZ_2$.
]
#solution[
  The polynomial $x^2 + 1$ is irreducible over the reals $RR$ because it has no real roots.
  However, it is reducible over the complex numbers $CC$ as $(x-i)(x+i)$ and over $ZZ_2$ as $(x+1)^2 = x^2+1$.
]

#solved_problem[
  Which finite fields constructed from polynomials are used in modern cryptography (e.g., AES and ECC)?
]
#solution[
  - *AES*: Operates in $"GF"(2^8)$ constructed with the irreducible polynomial $x^8 + x^4 + x^3 + x + 1$.
  - *ECC*: Uses fields $"GF"(2^m)$ or $"GF"(p)$.
]

#solved_problem[
  In $ZZ_2[x]$, perform addition and multiplication of $f(x) = x^2 + x + 1$ and $g(x) = x + 1$.
]
#solution[
  Coefficients are in $ZZ_2 = {0, 1}$.

  *Addition*:
  $f(x) + g(x) = (x^2 + x + 1) + (x + 1) = x^2 + 2x + 2$.
  Since $2 equiv 0 (mod 2)$,
  $f(x) + g(x) = x^2$.

  *Multiplication*:
  $f(x) dot g(x) = (x^2 + x + 1)(x + 1)$
  $= x^3 + x^2 + x + x^2 + x + 1$
  $= x^3 + 2x^2 + 2x + 1$
  $= x^3 + 1$.
]

#solved_problem[
  Factor $x^2 - 1$ in $ZZ_5[x]$.
]
#solution[
  We use the difference of squares formula:
  $x^2 - 1 = (x - 1)(x + 1)$.
  In $ZZ_5$, $-1 equiv 4$.
  So $x^2 - 1 = (x + 4)(x + 1)$.
]

#solved_problem[
  Determine if $x^3 + x + 1$ is irreducible in $ZZ_2[x]$.
]
#solution[
  A polynomial of degree 2 or 3 is reducible over a field if and only if it has a root in that field.
  Test elements of $ZZ_2 = {0, 1}$:
  - $x=0: 0^3 + 0 + 1 = 1 != 0$.
  - $x=1: 1^3 + 1 + 1 = 3 equiv 1 != 0$.

  Since there are no roots, the polynomial is irreducible.
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
    [The number of elements in the quotient ring $ZZ_p[x] / chevron.l P(x) chevron.r$ where $deg(P)=n$ is:],
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
  List all irreducible polynomials of degree 2 in $ZZ_2[x]$.
]

#supplementary[
  Construct the multiplication table for the field $"GF"(4)$ constructed as $ZZ_2[x] / chevron.l x^2+x+1 chevron.r$.
]

#supplementary[
  Factor $x^4 - 1$ over $ZZ_5$.
]

#supplementary[
  Determine if $x^3 + 2x + 1$ is irreducible over $ZZ_3$.
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
  Use the Remainder Theorem to find the remainder when $x^3 + 2x^2 + 2$ is divided by $x-1$ in $ZZ_3[x]$.
]

#supplementary[
  Find a polynomial $f(x) in ZZ_5[x]$ of degree 2 that has roots 1 and 3.
]

#supplementary[
  Prove that if $F$ is a field, then $F[x]$ is a Principal Ideal Domain.
]
