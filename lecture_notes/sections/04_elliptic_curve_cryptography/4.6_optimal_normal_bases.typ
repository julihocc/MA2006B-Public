#import "../../utils.typ": *

== Optimal Normal Bases Types I and II

=== Theory

#definition("Optimal Normal Basis (ONB)")[
  An *Optimal Normal Basis (ONB)* is a normal basis where the multiplication table is as sparse as possible. The number of non-zero terms in the multiplication matrix is maximized at $2n - 1$.
  There are two types of ONB:
  - *Type I*: Constructed from $n+1$ roots of unity.
  - *Type II*: Constructed from $2n+1$ roots of unity.
]

#theorem("Complexity Benefit")[
  Using an ONB allows for field multiplication with complexity roughly proportional to $n$, significantly faster than standard bases for large $n$.
  This is standard in IEEE 1363 and NIST standards for ECDSA.
  - *Hardware Efficiency*: ONB multiplication mainly involves cyclic shifts and XORs, which are very cheap in hardware (FPGA/ASIC).
  - *Parallelism*: The operations can be highly parallelized.
]

#example("NIST Recommended Fields")[
  Common binary fields with Optimal Normal Bases used in standards:
  - $n=163$ (Type I does not exist, checked for Type II)
  - $n=233$ (Type II)
  - $n=409$ (Type II)
  - $n=571$ (Type II)
]

=== Solved Problems

#solved_problem[
  Identify the condition for a Type I ONB to exist for $"GF"(2^n)$.
]
#solution[
  A Type I optimal normal basis exists for $"GF"(2^n)$ if and only if:
  1. $n+1$ is a prime $p$.
  2. $2$ is a primitive root modulo $p$.
]

#solved_problem[
  Check if a Type I ONB exists for $"GF"(2^4)$.
]
#solution[
  Check conditions for $n=4$:
  1. $n+1 = 5$, which is prime.
  2. Check if 2 is a primitive root mod 5:
    $2^1 equiv 2$
    $2^2 equiv 4$
    $2^3 equiv 8 equiv 3$
    $2^4 equiv 16 equiv 1$
    The order of 2 is 4, which is $phi(5)$.
  Yes, 2 is a primitive root mod 5.
  Therefore, a Type I ONB exists for $"GF"(2^4)$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [An Optimal Normal Basis (ONB) is defined by having a multiplication table with:],
    (
      [Minimum possible number of non-zero terms],
      [Maximum possible number of non-zero terms],
      [Only diagonal elements],
      [All ones],
    ),
    0,
  )

  #question(
    [The number of non-zero terms in the multiplication matrix of an ONB for $"GF"(2^n)$ is:],
    (
      [$n^2$],
      [$2n - 1$],
      [$n$],
      [$n - 1$],
    ),
    1,
  )

  #question(
    [A Type I ONB for $"GF"(2^n)$ exists if $n+1$ is prime and:],
    (
      [2 is a primitive root modulo $n+1$],
      [2 is a quadratic residue modulo $n+1$],
      [$n$ is even],
      [$n+1$ is a perfect square],
    ),
    0,
  )

  #question(
    [A Type II ONB for $"GF"(2^n)$ exists if $2n+1$ is prime and:],
    (
      "2 is a primitive root modulo $2n+1$",
      "2 generates the quadratic residues modulo $2n+1$",
      "$2n+1 \u{2261} 3 \u{0028}mod 4\u{0029}$ and 2 generates the quadratic residues",
      "Always",
    ),
    2,
  )

  #question(
    [If an ONB does not exist for a chosen field size $n$, one might use:],
    (
      "A Gaussian Normal Basis (GNB) of low type",
      "RSA instead",
      "A larger key size",
      "Polynomial basis only",
    ),
    0,
  )

  #question(
    [ONB multiplication is particularly efficient because it uses mostly:],
    (
      "Integer Division",
      "Cyclic shifts and XORs",
      "Floating point arithmetic",
      "Matrix inversion",
    ),
    1,
  )

  #question(
    [Which NIST binary curve uses a Type II ONB?],
    (
      "B-571",
      "P-256 (Prime curve)",
      "Curve25519",
      "RSA-2048",
    ),
    0,
  )

  #question(
    [The complexity of squaring in ONB is:],
    (
      "$O(n^2)$",
      "$O(n)$ (cyclic shift)",
      "$O(1)$ (wired permutation)",
      "$O(n^3)$",
    ),
    2,
  )

  #question(
    [In hardware, ONB multipliers allow for high degrees of:],
    (
      "Serial processing",
      "Parallelism",
      "Recursion",
      "Latencies",
    ),
    1,
  )

  #question(
    [The "Type" of an ONB (I or II) refers to:],
    (
      "The security level",
      "The construction method based on roots of unity",
      "The speed of multiplication",
      "The key size",
    ),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Compare the hardware gate count for a multiplier using Polynomial Basis vs Optimal Normal Basis.
]

#supplementary[
  Determine if a Type I ONB exists for $n=10$ in $"GF"(2^10)$.
]

#supplementary[
  Check if a Type II ONB exists for $n=2$ in $"GF"(2^2)$.
]

#supplementary[
  Verify that for a Type I ONB, the field elements are permuted roots of unity.
]

#supplementary[
  Why are Type II ONBs more common in standards (like NIST) than Type I ONBs?
]

#supplementary[
  Calculate the "Complexity" $C_N$ of a normal basis multiplication for a Type I ONB. (Hint: $C_N = 2n-1$).
]

#supplementary[
  If neither Type I nor Type II ONB exists for a given $n$, what involves using a "Gaussian Normal Basis"?
]

#supplementary[
  Explain the relationship between the condition "$n+1$ is prime" for Type I ONB and Mersenne primes.
]

#supplementary[
  For $n=4$, we found a Type I ONB. Explicitly list the basis elements in terms of $\beta$.
]

#supplementary[
  Discuss the impact of using ONB on power consumption for mobile devices compared to software-based polynomial basis multiplication.
]
