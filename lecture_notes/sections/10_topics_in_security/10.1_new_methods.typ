#import "../../utils.typ": *

== New Cryptographic Methods

=== Theory

#definition("Post-Quantum Cryptography (PQC)")[
  *Post-Quantum Cryptography* refers to cryptographic algorithms (usually public-key) that are thought to be secure against an attack by a quantum computer.

  Major families include:
  - *Lattice-based cryptography*: Security based on Shortest Vector Problem (SVP).
  - *Code-based cryptography*: Security based on decoding random linear codes.
  - *Multivariate cryptography*: Solving systems of multivariate equations.
  - *Hash-based signatures*: Merkle trees.
]

#definition("Homomorphic Encryption")[
  A form of encryption that allows computation on ciphertexts, generating an encrypted result which, when decrypted, matches the result of the operations as if they had been performed on the plaintext.
]

=== Solved Problems

#solved_problem[
  Why are current ECC and RSA schemes considered vulnerable to quantum computers?
]
#solution[
  Shor's Algorithm (1994) can solve the *Integer Factorization Problem* (RSA) and the *Discrete Logarithm Problem* (Diffie-Hellman, DSA, ECC) in polynomial time on a sufficiently large quantum computer. This breaks the security foundation of almost all currently deployed public-key infrastructure.
]

=== Supplementary Problems

#supplementary[
  Research the NIST PQC Standardization process. Which algorithms were selected as the primary standards for KEM and Signatures?
]

#supplementary[
  Describe a potential use case for Fully Homomorphic Encryption (FHE) in cloud computing.
]
