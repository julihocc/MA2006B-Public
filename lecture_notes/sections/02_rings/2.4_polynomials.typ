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
  Finite fields of order $p^n$, denoted $"GF"(p^n)$, are constructed as $ZZ_p[x] / angle.l P(x) angle.r$ where $P(x)$ is an irreducible polynomial of degree $n$ over $ZZ_p$.
  #proof[
    Let $F = ZZ_p[x] / angle.l P(x) angle.r$. $F$ is a commutative ring with unity.
    Let $f(x) in F$ be non-zero (meaning it is not a multiple of $P(x)$). Since $P(x)$ is irreducible and $deg(f) < deg(P)$, $gcd(f, P) = 1$.
    By EEA for polynomials, there exist $a(x), b(x)$ such that $a(x) f(x) + b(x) P(x) = 1$.
    Taking this equation modulo $P(x)$, we get $a(x) f(x) equiv 1$.
    Thus every non-zero element has an inverse, making $F$ a field.
  ]
]

#example[
  *Cryptography*:
  - *AES*: Operates in $"GF"(2^8)$ constructed with the irreducible polynomial $x^8 + x^4 + x^3 + x + 1$.
  - *ECC*: Uses fields $"GF"(2^m)$ or $"GF"(p)$.
]

=== Solved Problems

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

=== Supplementary Problems

#supplementary[
  List all irreducible polynomials of degree 2 in $ZZ_2[x]$.
]

#supplementary[
  Construct the multiplication table for the field $"GF"(4)$ constructed as $ZZ_2[x] / angle.l x^2+x+1 angle.r$.
]
