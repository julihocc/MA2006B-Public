#import "../../utils.typ": *

== Menezes-Qu-Vanstone (MQV) Protocol

=== Theory

#definition("MQV Protocol")[
  *Menezes-Qu-Vanstone (MQV)* is an authenticated key agreement protocol. It is designed to be implicitly authenticated (users verify each other by successfully computing the session key) and resistant to MITM attacks.

  In MQV, the session key is derived from both long-term (static) keys and ephemeral (short-term) keys.
]

#theorem("Implicit Authentication")[
  Unlike basic Diffie-Hellman, MQV incorporates the parties' public keys into the shared secret computation. If Alice calculates the key successfully, she knows that only Bob (who possesses Bob's private key) could have calculated the same key.
]

=== Solved Problems

#solved_problem[
  In a simplified view of MQV (or DH with static keys), why is using only static keys for the session key undesirable?
]
#solution[
  If only static keys are used (e.g., $S = g^(a b)$ computed once from long-term keys), the generated session key is *static*.
  1. *No Forward Secrecy*: If a private key is compromised later, all past communications encrypted with that static key are compromised.
  2. *Replay Attacks*: An attacker can replay old messages.
  MQV combines static and ephemeral keys to provide both authentication and forward secrecy.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [What does the acronym MQV stand for?],
    ("Massive Quantum Verification", "Message Quiet Validation", "Menezes-Qu-Vanstone", "Modular Quadratic Variable"),
    2,
  )

  #question(
    [MQV is primarily categorized as what type of protocol?],
    ("Authenticated Key Agreement", "Symmetric Encryption", "Public Key Hashing", "Zero-Knowledge Proof"),
    0,
  )

  #question(
    [What does "implicit authentication" mean in the context of MQV?],
    (
      "Users must present ID cards",
      "The session key calculation depends on each party's private key",
      "A third party signs every message",
      "The messages are compressed",
    ),
    1,
  )

  #question(
    [MQV derives session keys from which two types of key pairs?],
    ("Public and Private only", "Static and Ephemeral", "Primary and Secondary", "Master and Slave"),
    1,
  )

  #question(
    [Compared to basic Diffie-Hellman, MQV provides resistance against:],
    ("Denial of Service", "Man-in-the-Middle (MITM) attacks", "Brute force attacks", "Power analysis"),
    1,
  )

  #question(
    [What is a major disadvantage of using only static keys for session key generation?],
    ("It is too complex", "It lacks Forward Secrecy", "It requires too much RAM", "It only works on primes"),
    1,
  )

  #question(
    [In MQV, how are long-term public keys used?],
    (
      "They are discarded after setup",
      "They are included in the session key derivation",
      "They are used to encrypt the entire message",
      "They are only for identity verification",
    ),
    1,
  )

  #question(
    [The use of an ephemeral key pair in MQV ensures:],
    (
      "The protocol is slow enough to be safe",
      "Each session key is unique and random",
      "The password is never stored",
      "The group order is prime",
    ),
    1,
  )

  #question(
    [MQV was originally developed to fix security weaknesses in which protocol?],
    ("RSA", "SHA-256", "Basic Diffie-Hellman", "Elliptic Curve Addition"),
    2,
  )

  #question(
    [MQV is included in which of the following standards?],
    ("IEEE P1363", "AES FIPS 197", "MD5 RFC 1321", "HTTP/1.1"),
    0,
  )
]

=== Supplementary Problems

#supplementary[
  Research the computational cost of MQV compared to a basic Diffie-Hellman exchange. How many exponentiations are required?
]

#supplementary[
  What describes the "Unknown Key Share" (UKS) attack, and does MQV prevent it?
]

#supplementary[
  Research and provide the mathematical formula for the MQV session key derivation between Alice and Bob.
]

#supplementary[
  What is the "integer-to-integer" mapping (often denoted as $underline(x)$) used in the MQV computation?
]

#supplementary[
  Explain why MQV is considered more efficient than DH with separate digital signatures (like RSA-signed DH).
]

#supplementary[
  Describe the "Key-Compromise Impersonation" (KCI) attack and explain how MQV resists it.
]

#supplementary[
  Research the HMQV (Hashed MQV) variant and explain the improvements it proposes over the original MQV.
]

#supplementary[
  Does MQV provide "Perfect Forward Secrecy"? Contrast the standard MQV properties with its "fully forward secret" variants.
]

#supplementary[
  Define "Elliptic Curve MQV" (ECMQV) and explain how the group operations differ from the multiplicative group case.
]

#supplementary[
  Research why the original MQV protocol remained somewhat controversial in terms of its formal security proofs for many years.
]
