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

=== Self-Evaluation Quiz

#quiz[
  #question(
    [What is the primary goal of Post-Quantum Cryptography (PQC)?],
    (
      [To build quantum computers],
      [To develop algorithms secure against quantum attacks],
      [To use photons for encryption],
      [To eliminate all encryption],
    ),
    1,
  )

  #question(
    [Shor's Algorithm provides a polynomial-time solution for which problem?],
    ([Search in unsorted databases], [Integer Factorization], [Traveling Salesman Problem], [Hash collisions]),
    1,
  )

  #question(
    [Which mathematical structure forms the basis of many leading PQC candidates?],
    ([Elliptic Curves], [Lattices], [Prime Fields], [Finite Groups]),
    1,
  )

  #question(
    [What type of encryption allows performing addition and multiplication directly on encrypted data?],
    ([Symmetric Encryption], [Fully Homomorphic Encryption (FHE)], [Quantum Key Distribution], [Stream Ciphers]),
    1,
  )

  #question(
    [Which PQC family relies on the difficulty of decoding random linear codes?],
    ([Lattice-based], [Code-based], [Multivariate], [Hash-based]),
    1,
  )

  #question(
    [Grover's Algorithm affects symmetric ciphers (like AES) by:],
    (
      [Breaking them completely],
      [Providing a quadratic speedup for brute force],
      [Eliminating the need for keys],
      [Converting them to public-key],
    ),
    1,
  )

  #question(
    [Which of these is NOT considered a major family of PQC?],
    ([Lattice-based], [Isogeny-based], [Prime-factor-based], [Multivariate-based]),
    2,
  )

  #question(
    [NIST's PQC competition recently selected which algorithm as a primary KEM standard?],
    ([Kyber (CRYSTALS-Kyber)], [RSA-2048], [SHA-3], [AES-GCM]),
    0,
  )

  #question(
    [In Homomorphic Encryption, applying an operation to ciphertexts $c_1, c_2$ produces a result that decrypts to:],
    (
      [$m_1 + m_2$ (if additive homomorphic)],
      [A random value],
      [The encryption of the secret key],
      [The original public key],
    ),
    0,
  )

  #question(
    [Hash-based signatures usually rely on which structure to verify multiple signatures?],
    ([Lattice vectors], [Merkle Trees], [Elliptic Curve points], [Inverse matrices]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Research the NIST PQC Standardization process. Which algorithms were selected as the primary standards for KEM and Signatures?
]

#supplementary[
  Describe a potential use case for Fully Homomorphic Encryption (FHE) in cloud computing.
]

#supplementary[
  Explain why doubling the key size of AES (e.g., from 128 to 256 bits) is considered sufficient to maintain security against Grover's Algorithm.
]

#supplementary[
  Contrast the "Learning With Errors" (LWE) problem with the "Shortest Vector Problem" (SVP).
]

#supplementary[
  What are the disadvantages of Homomorphic Encryption in terms of computational overhead and ciphertext size?
]

#supplementary[
  Explain the difference between "Levelled" Homomorphic Encryption and "Fully" Homomorphic Encryption.
]

#supplementary[
  Discuss the security of McEliece cryptosystem (code-based) in a post-quantum world.
]

#supplementary[
  What is "Side-Channel Resistance" in the context of PQC implementations?
]

#supplementary[
  Describe how a Lamport signature works and why it is considered quantum-resistant.
]

#supplementary[
  Evaluate the impact of quantum computing on modern blockchain technologies that rely on ECDSA.
]
