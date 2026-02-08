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
  A *Normal Basis* (specifically an Optimal Normal Basis) is generally preferred. This is because the frequent squaring operations in finite field arithmetic (used in exponentiation for point multiplication) become simple cyclic shifts of bits, which consumes negligible logic area and clock cycles compared to denominator basis squaring.
]

#quiz[
  #question([Which basis is generally preferred for general-purpose software implementations of MQV?], ("Normal Basis", "Polynomial Basis", "Dual Basis", "Logarithmic Basis"), 1)

  #question([Why is Normal Basis (NB) particularly advantageous for hardware implementations?], ("Multiplication is easier", "It uses less memory", "Squaring is a simple cyclic shift", "It is more secure"), 2)

  #question([What does the acronym ONB stand for?], ("Orthogonal Normal Basis", "Optimal Normal Basis", "Order-N Basis", "Offset Number Basis"), 1)

  #question([In Polynomial Basis, which operation is typically more complex than its Normal Basis equivalent?], ("Addition", "Subtraction", "Squaring", "Bitwise AND"), 2)

  #question([How many common types of Optimal Normal Bases (ONB) are defined in standards?], ("1", "2", "3", "4"), 1)

  #question([Does changing the field basis change the high-level MQV algebraic formulas?], ("Yes", "No", "Only for signatures", "Only for ElGamal"), 1)

  #question([Squaring a field element in Normal Basis is mathematically equivalent to:], ("A XOR operation", "A cyclic shift of the bit vector", "A modular reduction", "Matrix inversion"), 1)

  #question([The "optimality" of an ONB refers to:], ("The speed of addition", "Having the minimum number of non-zero terms in field multiplication", "The size of the prime", "Resistance to quantum attacks"), 1)

  #question([Which structure is used to convert an element from Polynomial to Normal Basis?], ("A hash function", "A change-of-basis matrix", "A random seed", "An elliptic curve"), 1)

  #question([Normal basis is most often used with which type of finite fields?], ("Prime fields $ZZ_p$", "Binary extension fields $upright("GF")(2^m)$", "Complex fields", "Rational fields"), 1)
]

=== Supplementary Problems

#supplementary[
  Compare the software implementation complexity of Polynomial Basis vs Normal Basis for field multiplication. Why is PB often faster in software?
]

#supplementary[
  Given a normal basis $\{beta, beta^2, ..., beta^{2^{m-1}}\}$, calculate the bit-vector result of squaring a general element $alpha$.
]

#supplementary[
  Explain why the computation of the truncated value $overline(R)$ is independent of the choice of field basis.
]

#supplementary[
  Detail the memory requirements for storing a 233-bit change-of-basis matrix for converting elements between PB and NB.
]

#supplementary[
  Research and explain why Type I Optimal Normal Bases are only available for certain field sizes $m$ (e.g., when $m+1$ is prime).
]

#supplementary[
  Investigate the use of "Gaussian Normal Bases" (GNB) as defined in NIST standards for elliptic curve cryptography.
]

#supplementary[
  Compare the hardware area (gate count) of a "Shift-and-Add" Polynomial Basis multiplier versus a Massey-Omura Normal Basis multiplier.
]

#supplementary[
  Analyze the properties of the "Dual Basis" representation and discuss whether it offers advantages for MQV over PB or NB.
]

#supplementary[
  Discuss whether the choice of basis (PB vs NB) can influence the resistance of an implementation to side-channel timing attacks.
]

#supplementary[
  Provide a pseudo-code algorithm for performing field multiplication in a Normal Basis using a precomputed multiplication table (lambda matrix).
]
