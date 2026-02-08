#import "../../utils.typ": *

== Trace Functions

=== Theory

#definition("Field Trace")[
  The *trace* of an element $alpha in upright("GF")(q^n)$ to the subfield $upright("GF")(q)$ is defined as the sum of its distinct conjugates:
  $ upright("Tr")(alpha) = alpha + alpha^q + alpha^(q^2) + ... + alpha^(q^(n-1)) $
  distribution of values maps $upright("GF")(q^n)$ to $upright("GF")(q)$.
]

#definition("Trace of Frobenius")[
  For an elliptic curve $E$, the *trace of Frobenius* $t$ is related to the number of points by Hasse's Theorem:
  $ \#E(upright("GF")(q)) = q + 1 - t $
  The integer $t$ is the trace of the Frobenius endomorphism $phi: (x, y) arrow.bar (x^q, y^q)$.
]

#theorem("Property of Trace")[
  The Trace function is a linear map:
  $ upright("Tr")(a alpha + b beta) = a upright("Tr")(alpha) + b upright("Tr")(beta) $
  for $a, b in upright("GF")(q)$.
  Also, $upright("Tr")(alpha^q) = upright("Tr")(alpha)$.
]

=== Solved Problems

#solved_problem[
  Calculate the Trace of $alpha = x$ in $"GF"(2^2)$ defined by $P(x) = x^2 + x + 1$ over $"GF"(2)$.
]
#solution[
  In $"GF"(2^2)$, $q=2, n=2$. $"Tr"(alpha) = alpha + alpha^2$.
  Since $alpha^2 + alpha + 1 = 0 => alpha^2 = alpha + 1$.
  $"Tr"(alpha) = alpha + (alpha + 1) = 2alpha + 1 = 1$.
  So the trace is $1$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [The field trace of $alpha in upright("GF")(q^n)$ to $upright("GF")(q)$ is defined as:],
    (
      "The sum of all elements in the field",
      "The sum of the distinct conjugates of $alpha$",
      "The product of the conjugates",
      "The trace of the identity matrix",
    ),
    1,
  )

  #question(
    [The trace function is which type of map?],
    ("Exponential", "Linear", "Logarithmic", "Quadratic"),
    1,
  )

  #question(
    [The Trace of Frobenius $t$ for a curve over $upright("GF")(q)$ is related to the group order $N$ by:],
    ("$N = q + 1 - t$", "$N = q + t$", "$N = t^2 + q$", "$N = 1 - t$"),
    0,
  )

  #question(
    [Which property is true for the trace function in $upright("GF")(q^n)$?],
    (
      "$upright(\"Tr\")(alpha^q) = upright(\"Tr\")(alpha)$",
      "$upright(\"Tr\")(alpha^q) = alpha$",
      "$upright(\"Tr\")(alpha^q) = 0$",
      "$upright(\"Tr\")(alpha dot beta) = upright(\"Tr\")(alpha) dot upright(\"Tr\")(beta)$",
    ),
    0,
  )

  #question(
    [The Trace functionality maps $upright("GF")(q^n)$ onto which field?],
    ("$upright(\"GF\")(q)$", "$upright(\"GF\")(q^n)$", "$upright(\"GF\")(2)$", "The complex numbers"),
    0,
  )

  #question(
    [Hasse's Theorem states that the Trace of Frobenius satisfies:],
    ("$|t| <= 2 sqrt(q)$", "$|t| <= q$", "$t = q + 1$", "$t > 0$"),
    0,
  )

  #question(
    [In $upright("GF")(2^n)$, the trace of an element $c$ must be what for $x^2 + x = c$ to have a solution?],
    ("0", "1", "Prime", "Non-zero"),
    0,
  )

  #question(
    [Schoof's algorithm counts points by calculating the trace of Frobenius modulo:],
    ("All small primes $l$", "The field characteristic", "The group order", "The RSA modulus"),
    0,
  )

  #question(
    [The Frobenius endomorphism $phi$ is defined as:],
    ("$phi(x, y) = (x^q, y^q)$", "$phi(x, y) = (x/y, y/x)$", "$phi(x, y) = (x+y, y)$", "$phi(x, y) = (x^2, y^2)$"),
    0,
  )

  #question(
    [The trace of an element $alpha in upright("GF")(2^n)$ to $upright("GF")(2)$ is:],
    ("$alpha + alpha^2 + alpha^4 + ... + alpha^(2^(n-1))$", "$n alpha$", "$alpha^n$", "Always 0"),
    0,
  )
]

=== Supplementary Problems

#supplementary[
  Show that in characteristic 2, the equation $x^2 + x = c$ has a solution if and only if $upright("Tr")(c) = 0$.
]

#supplementary[
  How is the Trace of Frobenius used in Schoof's algorithm for point counting?
]

#supplementary[
  Calculate the trace of $alpha = 1$ in $upright("GF")(q^n)$ to $upright("GF")(q)$.
]

#supplementary[
  Prove that $upright("Tr")(alpha^q) = upright("Tr")(alpha)$ for any $alpha in upright("GF")(q^n)$.
]

#supplementary[
  Let $E$ be a curve over $upright("GF")(7)$ with $N=10$ points. Calculate the trace of Frobenius $t$.
]

#supplementary[
  Research the "Norm" function in finite fields and compare it to the "Trace" function.
]

#supplementary[
  Prove the linearity of the trace function: $upright("Tr")(a alpha + b beta) = a upright("Tr")(alpha) + b upright("Tr")(beta)$ for $a, b in upright("GF")(q)$.
]

#supplementary[
  In $upright("GF")(2^3)$ defined by $x^3 + x + 1 = 0$, calculate $upright("Tr")(x^2)$.
]

#supplementary[
  How does the trace of Frobenius relate to the eigenvalues of the Frobenius endomorphism?
]

#supplementary[
  Research "Trace-zero subgroups" in elliptic curve cryptography and their applications.
]
