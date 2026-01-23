#import "../../utils.typ": *

== Bases normales óptimas de tipo I y II

=== Theory

#definition("Optimal Normal Basis (ONB)")[
  An *Optimal Normal Basis (ONB)* is a normal basis where the multiplication table is as sparse as possible. The number of non-zero terms in the multiplication matrix is maximized at $2n - 1$.
  There are two types of ONB:
  - *Type I*: Constructed from $n+1$ roots of unity.
  - *Type II*: Constructed from $2n+1$ roots of unity.
]

#theorem("Complexity Benefit")[
  Using an ONB allows for field multiplication with complexity roughly proportional to $n$, significantly faster than standard bases for large $n$. This is standard in IEEE 1363 and NIST standards for ECDSA.
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

=== Supplementary Problems

#supplementary[
  Determine if a Type I ONB exists for $n=4$ in $"GF"(2^4)$.
]

#supplementary[
  Compare the hardware gate count for a multiplier using Polynomial Basis vs Optimal Normal Basis.
]
