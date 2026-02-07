#import "../../utils.typ": *

== Polynomial Arithmetic over Finite Fields

=== Theory

#definition("Finite Field GF(p^n)")[
  A *finite field* (or Galois Field) with $p^n$ elements, denoted $"GF"(p^n)$ or $FF_(p^n)$, consists of polynomial classes over $"GF"(p)$ modulo an irreducible polynomial $P(x)$ of degree $n$.
  Elements are polynomials $a_{n-1}x^(n-1) + ... + a_1 x + a_0$ where $a_i in ZZ_p$.
]

#definition("Irreducible Polynomial")[
  A polynomial $P(x)$ is *irreducible* over a field $K$ if it cannot be factored into two non-constant polynomials over $K$. It plays the role of a prime number for polynomial arithmetic. To check if a polynomial of degree $n$ is irreducible, one must verify it has no factors of degree up to $n/2$.
]

#definition("Generator Polynomial")[
  A *primitive polynomial* or *generator polynomial* is an irreducible polynomial $P(x)$ of degree $n$ such that $x$ is a generator of the multiplicative group $"GF"(p^n)^*$. Using a primitive polynomial ensures that powers of $x$ generate all non-zero elements of the field.
]

#theorem("Field Arithmetic")[
  - *Addition*: Performed coefficient-wise in $ZZ_p$. (For $p=2$, this is XOR).
  - *Multiplication*: Polynomial multiplication modulo $P(x)$.
  - *Division*: Performed using the Extended Euclidean Algorithm for polynomials to find the multiplicative inverse.
]

#example("Polynomial Division")[
  Divide $A(x) = x^3 + x + 1$ by $B(x) = x + 1$ over $ZZ_2$:
  1. $x^3 / x = x^2$. Multiply $B(x)$ by $x^2$: $x^2(x+1) = x^3 + x^2$.
  2. Subtract (XOR): $(x^3 + x + 1) - (x^3 + x^2) = x^2 + x + 1$.
  3. $x^2 / x = x$. Multiply $B(x)$ by $x$: $x(x+1) = x^2 + x$.
  4. Subtract (XOR): $(x^2 + x + 1) - (x^2 + x) = 1$.
  5. Quotient is $x^2 + x$, Remainder is $1$.
  So $x^3 + x + 1 = (x^2 + x)(x + 1) + 1$.
]

=== Solved Problems

#solved_problem[
  In $"GF"(2^3)$ represented by polynomials modulo $P(x) = x^3 + x + 1$, compute the sum of $(x^2 + 1)$ and $(x^2 + x)$.
]
#solution[
  Coefficients are in $ZZ_2$ (binary).
  $(x^2 + 1) + (x^2 + x) = (1+1)x^2 + (0+1)x + (1+0)$
  $ = 0x^2 + x + 1 = x + 1 $
  (Note: $1+1=0$ in $ZZ_2$).
]

#solved_problem[
  Multiply $x$ by $(x^2 + 1)$ in $"GF"(2^3)$ with $P(x) = x^3 + x + 1$.
]
#solution[
  $ x(x^2 + 1) = x^3 + x $.
  Since $x^3 equiv x + 1 (mod x^3 + x + 1)$ (because $x^3 + x + 1 = 0 => x^3 = -x - 1 = x + 1$ over $ZZ_2$),
  $ x^3 + x = (x + 1) + x = 2x + 1 = 1 $.
  So the result is $1$.
]

=== Supplementary Problems

#supplementary[
  List all irreducible polynomials of degree 2 over $ZZ_2$.
]

#supplementary[
  Construct the multiplication table for $"GF"(2^2)$ using the irreducible polynomial $x^2 + x + 1$.
]

#supplementary[
  Determine if $x^3 + x^2 + 1$ is irreducible over $ZZ_2$.
]

#supplementary[
  Compute the sum and product of $(x^2 + x + 1)$ and $(x + 1)$ in $"GF"(2^4)$ with reduction polynomial $P(x) = x^4 + x + 1$.
]

#supplementary[
  Find the multiplicative inverse of $x$ modulo $x^3 + x + 1$ over $ZZ_2$.
]

#supplementary[
  Show that $x^4 + 1$ is reducible over $ZZ_2$. (Hint: $(x+1)^4$).
]

#supplementary[
  In $"GF"(2^8)$ (AES field), the reduction polynomial is $x^8 + x^4 + x^3 + x + 1$. Write the byte 0x53 (ASCII 'S') as a polynomial in this field.
]

#supplementary[
  Perform long division of $x^5 + x^2 + 1$ by $x^2 + x + 1$ over $ZZ_2$. What is the remainder?
]

#supplementary[
  Explain why we use irreducible polynomials to construct finite fields (analogy to prime numbers).
]

#supplementary[
  Find a generator polynomial for $"GF"(2^3)$. Show that it generates all 7 non-zero elements.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [A Finite Field $"GF"(p^n)$ contains exactly how many elements?],
    (
      "$p times n$",
      "$p^n$",
      "$n^p$",
      "Infinite",
    ),
    1,
  )

  #question(
    [A polynomial is called irreducible if:],
    (
      "It has no factors other than constants (and itself)",
      "It has only even coefficients",
      "It has degree 0",
      "It can be divided by $x$",
    ),
    0,
  )

  #question(
    [Addition of polynomials over $"GF"(2^n)$ corresponds to which bitwise operation?],
    (
      "AND",
      "OR",
      "XOR",
      "NOT",
    ),
    2,
  )

  #question(
    [Multiplication in a finite field involves polynomial multiplication followed by:],
    (
      "Integer division",
      "Modulo reduction by an irreducible polynomial",
      "Square root extraction",
      "Bit shifting only",
    ),
    1,
  )

  #question(
    [The degree of an irreducible polynomial used to construct $"GF"(2^n)$ must be:],
    (
      "$n$",
      "$n-1$",
      "$2n$",
      "Any integer",
    ),
    0,
  )

  #question(
    [In $"GF"(2)$, $1 + 1 =$ ?],
    (
      "2",
      "0",
      "1",
      "-1",
    ),
    1,
  )

  #question(
    [A generator (or primitive element) of a finite field generates:],
    (
      "The additive group of the field",
      "The multiplicative group of non-zero elements",
      "Only the prime subfield",
      "All irreducible polynomials",
    ),
    1,
  )

  #question(
    [To find the multiplicative inverse of a polynomial $A(x)$ modulo $P(x)$, we use:],
    (
      "Long division",
      "Extended Euclidean Algorithm for polynomials",
      "Synthetic division",
      "Factoring",
    ),
    1,
  )

  #question(
    [Which of these is NOT a property of a field?],
    (
      "Commutativity of addition",
      "Existence of multiplicative inverses for non-zero elements",
      "Distributivity of multiplication over addition",
      "Non-associativity of multiplication",
    ),
    3,
  )

  #question(
    [If $P(x)$ is reducible, the structure $"GF"(p)[x] \/ P(x)$ forms a:],
    (
      "Field",
      "Ring (with zero divisors)",
      "Group",
      "Vector Space",
    ),
    1,
  )
]

