#import "../../utils.typ": *

== Elliptic Curves and their Importance

=== Theory

#definition("Elliptic Curve Cryptography (ECC)")[
  *Elliptic Curve Cryptography (ECC)* is a public-key cryptography approach based on the algebraic structure of elliptic curves over finite fields. ECC requires smaller keys compared to non-ECC cryptography (like RSA) to provide equivalent security.

  ECC was independently proposed by *Neal Koblitz* and *Victor Miller* in 1985. Since then, it has become widely adopted and is now the preferred choice for modern security protocols.
]

#theorem("Key Size Comparison")[
  Security levels (in bits of strength) roughly compare as follows:
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      inset: 10pt,
      align: horizon,
      fill: (_, row) => if row == 0 { rgb("e3f2fd") } else { none },
      [*Symmetric Key Size*], [*RSA Key Size*], [*ECC Key Size*], [*Ratio (RSA:ECC)*],
      [80], [1024], [160-224], [~6:1],
      [112], [2048], [224-255], [~9:1],
      [128], [3072], [256-383], [~12:1],
      [256], [15360], [512+], [~30:1],
    )
  ]
  ECC offers high security with significantly smaller key sizes, reducing storage and transmission requirements. The gap between RSA and ECC key sizes grows exponentially as the security level increases.
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
