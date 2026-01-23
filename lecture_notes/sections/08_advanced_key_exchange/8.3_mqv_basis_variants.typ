#import "../../utils.typ": *

== MQV Protocols with Normal and Polynomial Basis

=== Theory

#definition("Basis Representation Impact")[
  The implementation of MQV can be optimized based on the field representation:
  - *Polynomial Basis* (PB): Standard for software implementations. Good performance for general multiplication.
  - *Normal Basis* (NB): Optimal for hardware (FPGA/ASIC). Squaring is free (cyclic shift).
]

#theorem("Protocol Adaptation")[
  The algebraic steps of MQV remain the same, but the underlying arithmetic operations ($+$, $dot$, squaring) are adapted. Using *Optimal Normal Bases (ONB)* of Type I or II can significantly speed up the ephemeral key generation and shared secret computation phases in hardware environments.
]

=== Solved Problems

#solved_problem[
  Which basis is preferred for a high-speed hardware encryptor implementing MQV?
]
#solution[
  A *Normal Basis* (specifically an Optimal Normal Basis) is generally preferred. This is because the frequent squaring operations in finite field arithmetic (used in exponentiation for point multiplication) become simple cyclic shifts of bits, which consumes negligible logic area and clock cycles compared to polynomial basis squaring.
]

=== Supplementary Problems

#supplementary[
  If a software library only supports polynomial basis arithmetic, what is the cost of converting keys to normal basis for transmission?
]

#supplementary[
  Analyze the impact of "basis conversion" attacks if the parties misunderstand the basis representation of the transmitted public keys.
]
