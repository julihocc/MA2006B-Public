#import "../../utils.typ": solution, proof, definition, theorem, proposition, corollary, example, solution
== Polynomial Rings

=== Theory
#definition(title: "Polynomial Ring")[
  A *Polynomial Ring* $R[x]$ consists of polynomials with coefficients in a ring $R$.
  The division algorithm for polynomials holds if $R$ is a field.
]

#definition(title: "Irreducible Polynomial")[
  A polynomial $P(x)$ is *irreducible* over $F$ if it cannot be factored into two non-constant polynomials in $F[x]$.
]

#theorem(title: "Finite Field Construction")[
  Finite fields of order $p^n$, denoted $"GF"(p^n)$, are constructed as $ZZ_p[x] slash angle.l P(x) angle.r$ where $P(x)$ is an irreducible polynomial of degree $n$.
  #proof[
    Let $F = ZZ_p[x] slash angle.l P(x) angle.r$. $F$ is a commutative ring with unity.
    Let $f(x) in F$ be non-zero. Since $P(x)$ is irreducible and $deg(f) < deg(P)$, $gcd(f, P) = 1$.
    By EEA, there exist $a(x), b(x)$ such that $a(x)f(x) + b(x)P(x) = 1$.
    In the quotient ring (mod $P(x)$), this implies $a(x)f(x) equiv 1$.
    Thus every non-zero element has an inverse, making $F$ a field.
  ]
]

=== Examples
#example[
  In $ZZ_2[x]$, perform addition and multiplication.
  Let $f(x) = x^2 + x + 1$ and $g(x) = x + 1$.
  $f(x) + g(x) = (x^2 + x + 1) + (x + 1) = x^2 + 2x + 2 = x^2$ (coefficients mod 2).
  $f(x) dot g(x) = (x^2 + x + 1)(x + 1) = x^3 + x^2 + x + x^2 + x + 1 = x^3 + 2x^2 + 2x + 1 = x^3 + 1$.
]

#example[
  *Cryptography*:
  - *AES*: Operates in $"GF"(2^8)$ constructed with the irreducible polynomial $x^8 + x^4 + x^3 + x + 1$.
  - *ECC*: Uses fields $"GF"(2^m)$ or $"GF"(p)$.
]

=== Exercises
+ Factor $x^2 - 1$ in $ZZ_5[x]$.
#solution[
  $x^2 - 1 = (x - 1)(x + 1) = (x + 4)(x + 1)$ in $ZZ_5$.
]
+ Determine if $x^3 + x + 1$ is irreducible in $ZZ_2[x]$.
#solution[
  For degree 3, it is reducible iff it has a root.
  Test elements of $ZZ_2$:
  $0: 0^3 + 0 + 1 = 1 eq.not 0$.
  $1: 1^3 + 1 + 1 = 3 equiv 1 eq.not 0$.
  No roots, so it is irreducible.
]
