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

=== Self-Evaluation Quiz

#quiz[
  #question(
    [ECC stands for:],
    (
      "Error Correction Code",
      "Elliptic Curve Cryptography",
      "Encrypted Communication Channel",
      "Extended Cyclic Code",
    ),
    1,
  )

  #question(
    [Which problem forms the basis of security for ECC?],
    (
      "Integer Factorization Problem",
      "Discrete Logarithm Problem",
      "Elliptic Curve Discrete Logarithm Problem (ECDLP)",
      "Knapsack Problem",
    ),
    2,
  )

  #question(
    [Approximately what RSA key size corresponds to a 256-bit ECC key security?],
    (
      "1024 bits",
      "2048 bits",
      "3072 bits",
      "15360 bits",
    ),
    2,
  )

  #question(
    [Who independently proposed ECC in 1985?],
    (
      "Diffie and Hellman",
      "Rivest, Shamir, and Adleman",
      "Koblitz and Miller",
      "Satoshi Nakamoto",
    ),
    2,
  )

  #question(
    [Which of the following is a primary advantage of ECC over RSA?],
    (
      "Faster encryption speed",
      "Smaller key sizes for equivalent security",
      "Simpler mathematical structure",
      "Resistance to quantum computers",
    ),
    1,
  )

  #question(
    [In the context of ECC, what is a "finite field"?],
    (
      "A field of infinite grass",
      "A mathematical structure with a finite number of elements where add/mult are defined",
      "A limited storage space for keys",
      "A field where only addition is possible",
    ),
    1,
  )

  #question(
    [What is the typical size of an ECC private key for high security (128-bit strength)?],
    (
      "128 bits",
      "256 bits",
      "1024 bits",
      "2048 bits",
    ),
    1,
  )

  #question(
    [ECC is widely used in which cryptocurrency?],
    (
      "Bitcoin",
      "Original RSA-Coin",
      "FactorCoin",
      "None",
    ),
    0,
  )

  #question(
    [What does ECDSA stand for?],
    (
      "Elliptic Curve Digital Signature Algorithm",
      "Extended Code Digital Security Algorithm",
      "Elliptic Curve Decryption Standard Algorithm",
      "Encrypted Curve Data Security Action",
    ),
    0,
  )

  #question(
    [Shor's Algorithm on a quantum computer would solve ECDLP in:],
    (
      "Exponential time",
      "Polynomial time",
      "Factorial time",
      "It cannot solve it",
    ),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Research and list three major internet protocols that use ECC today (e.g., TLS, SSH, Bitcoin).
]

#supplementary[
  If an RSA key length doubles, does the security level double? Compare this behavior with ECC key lengths.
]

#supplementary[
  Calculate the bandwidth saving in percentage when sending a 256-bit ECC public key vs a 3072-bit RSA public key.
]

#supplementary[
  Investigate the "Quantum Threat" to ECC. Roughly how many logical qubits would be needed to break a 256-bit ECC key using Shor's algorithm?
]

#supplementary[
  Describe the "Small Subgroup Attack" on ECC and simply state how it is prevented (validating point order).
]

#supplementary[
  Compare the signature generation speed of RSA-2048 vs ECDSA-256 on a typical embedded microcontroller (e.g., ARM Cortex-M4). Which is faster and why?
]

#supplementary[
  What is "Point Compression" in ECC? How much space does it save for a point $(x, y)$ on a curve over a 256-bit field?
]

#supplementary[
  Explain why ECC is particularly suitable for smart cards and IoT devices compared to RSA.
]

#supplementary[
  Look up the "Curve25519" curve. Who designed it and what specific implementation properties does it optimize for?
]

#supplementary[
  What is the difference between "Prime Field" curves ($"GF"(p)$) and "Binary Field" curves ($"GF"(2^n)$) in terms of hardware implementation efficiency?
]
