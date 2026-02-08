#import "../../utils.typ": *

== Standard MQV Protocol

=== Theory

#definition("NIST SP 800-56A Scheme")[
  The *standardized MQV* (as in NIST SP 800-56A / SEC 1) refines the basic protocol to ensure security properties like Key-Compromise Impersonation (KCI) resilience and Unknown Key Share (UKS) resilience.

  Parties compute an implicit certificate $s = (k + overline(R) a) mod n$, where $k$ is ephemeral private, $R$ is ephemeral public, $a$ is static private, and $overline(R)$ is a truncated hash of the ephemeral public key.
]

#theorem("Efficiency")[
  Standard MQV is highly efficient, requiring roughly 1.5 times the cost of a standard Diffie-Hellman exchange per party, but providing full mutual authentication.
]

=== Solved Problems

#solved_problem[
  What is the purpose of the truncation function $overline(R)$ in standard MQV?
]
#solution[
  The function $overline(R)$ (often taking the lower half of the x-coordinate bits) serves to bind the ephemeral key to the static key computation in a way that is mathematically efficient. It acts similarly to a hash function but preserves algebraic structure, reducing the computational load compared to a full cryptographic hash while preventing certain algebraic attacks.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [Which NIST publication defines the standardized MQV scheme?],
    ("SP 800-53", "SP 800-56A", "FIPS 140-2", "SP 800-90A"),
    1,
  )

  #question(
    [What is the main security goal achieved by standard MQV?],
    ("Confidentiality only", "Authenticated Key Agreement", "Digital Signatures", "Data Integrity"),
    1,
  )

  #question(
    [In the MQV certificate $s = (k + overline(R) a) mod n$, what does $overline(R)$ represent?],
    (
      "Public key of the CA",
      "Truncated hash of the ephemeral public key",
      "The shared secret",
      "Bob's static private key",
    ),
    1,
  )

  #question(
    [Resilience to which attack prevents an attacker from impersonating others to a compromised user?],
    ("Brute force", "UKS", "KCI", "Replay"),
    2,
  )

  #question(
    [Standard MQV is approximately how many times as expensive as basic Diffie-Hellman?],
    ("0.5x", "1.5x", "2x", "5x"),
    1,
  )

  #question(
    [What type of keys are mathematically combined in the MQV protocol?],
    ("Symmetric only", "Static and Ephemeral public keys", "Identity strings", "One-time pads"),
    1,
  )

  #question(
    [What does "Implicit Authentication" mean in MQV?],
    (
      "Auth is verified by successful use of the resulting key",
      "Parties send certificates",
      "A third party verifies signatures",
      "Encryption is not used",
    ),
    0,
  )

  #question(
    [Which cryptographic standard includes MQV alongside ECDSA?],
    ("SEC 1", "IEEE 754", "RFC 1918", "PKCS #1"),
    0,
  )

  #question(
    [The session key $S$ is typically derived from the shared secret $K$ using:],
    ("RSA", "A Key Derivation Function (KDF)", "Simple addition", "Discarding bits"),
    1,
  )

  #question(
    [The modulus $n$ used in MQV is usually:],
    ("A prime order of the group", "Any composite number", "The x-coordinate", "A random seed"),
    0,
  )
]

=== Supplementary Problems

#supplementary[
  Explain Key-Compromise Impersonation (KCI) and how MQV prevents an adversary from impersonating others to Alice even if they know Alice's static private key.
]

#supplementary[
  Detail the computation of the shared secret $K$ for Bob using his certificate $s_B$: $K = s_B (R_A + overline(R_A) A)$.
]

#supplementary[
  Why is the truncation function $overline(R)$ often implemented as taking the lower half of the bits of the x-coordinate?
]

#supplementary[
  Contrast the efficiency of standard MQV with RSA-signed Diffie-Hellman in terms of number of exponentiations.
]

#supplementary[
  Discuss the role of the cofactor $h$ in MQV security when working on elliptic curves.
]

#supplementary[
  Research the "Unknown Key Share" (UKS) attack and how standard MQV's design specifically mitigates this risk.
]

#supplementary[
  What are the technical requirements for the prime $n$ (the order of the subgroup) in a secure MQV implementation?
]

#supplementary[
  Explain the difference between the "Two-Pass" and "Three-Pass" variants of MQV.
]

#supplementary[
  Analyze how standard MQV maintains "Forward Secrecy" for past sessions if static keys are compromised in the future.
]

#supplementary[
  Calculate the value of $overline(R)$ for a 256-bit prime if the ephemeral public key coordinate is $R=2^{128} + 7$.
]
