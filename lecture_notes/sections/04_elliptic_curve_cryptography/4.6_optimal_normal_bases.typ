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

=== Supplementary Problems

#supplementary[
  Determine if a Type I ONB exists for $n=4$ in $"GF"(2^4)$.
]

#supplementary[
  Compare the hardware gate count for a multiplier using Polynomial Basis vs Optimal Normal Basis.
]
