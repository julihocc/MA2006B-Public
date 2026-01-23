#import "../../utils.typ": *

== Elliptic Curves and their Importance

=== Theory

#definition("Elliptic Curve Cryptography (ECC)")[
  *Elliptic Curve Cryptography (ECC)* is a public-key cryptography approach based on the algebraic structure of elliptic curves over finite fields. ECC requires smaller keys compared to non-ECC cryptography (like RSA) to provide equivalent security.
]

#theorem("Key Size Comparison")[
  Security levels (in bits of strength) roughly compare as follows:
  #table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: horizon,
    [*Symmetric Key Size*], [*RSA Key Size*], [*ECC Key Size*],
    [80], [1024], [160-224],
    [112], [2048], [224-255],
    [128], [3072], [256-383],
    [256], [15360], [512+],
  )
  ECC offers high security with significantly smaller key sizes, reducing storage and transmission requirements.
]

=== Solved Problems

#solved_problem[
  Why is ECC preferred over RSA for mobile devices?
]
#solution[
  Mobile devices often have limited processing power, battery life, and bandwidth.
  1. *Key Size*: ECC keys are much smaller (e.g., 256 bits vs 3072 bits for 128-bit security), leading to faster key generation and smaller certificates.
  2. *Computation*: ECC operations (signatures, handshakes) are generally faster and consume less energy than RSA for equivalent security levels.
]

=== Supplementary Problems

#supplementary[
  Research and list three major internet protocols that use ECC today (e.g., TLS, SSH, Bitcoin).
]

#supplementary[
  If an RSA key length doubles, does the security level double? Compare this behavior with ECC key lengths.
]
