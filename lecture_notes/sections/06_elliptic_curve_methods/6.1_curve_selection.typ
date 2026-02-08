#import "../../utils.typ": *

== Elliptic Curve Selection

=== Theory

#definition("Curve Selection")[
  Curve selection is the process of choosing the parameters $a, b, p$ (and potentially others) for an elliptic curve cryptosystem. Randomly generated curves can be secure if properly validated, but standardized curves are often used for interoperability.
]

#definition("Standard Curves")[
  Organizations like NIST (FIPS 186-4) and SECG (SEC 2) publish recommended curves.
  Examples:
  - *NIST P-256*: A curve over a prime field $"GF"(p)$ with 256-bit characteristic.
  - *Curve25519*: A Montgomery curve used in modern protocols (TLS 1.3, Signal) offering 128-bit security and high performance.
]

#theorem("Security Requirements")[
  To be secure, a chosen curve $E("GF"(q))$ must satisfy:
  1. *Large Prime Order*: The group order $\#E$ (or its largest prime factor) must be sufficiently large to resist Pollard's rho attack.
  2. *MOV Resistance*: The embedding degree must be large enough to resist the MOV attack (which uses the Weil pairing).
  3. *Anomalous Resistance*: The trace of Frobenius should not be 1 (to avoid Smart's attack).
]

=== Solved Problems

#solved_problem[
  Why is it typically considered safer to use a "verifiably random" curve generation process?
]
#solution[
  Verifiably random generation uses a seed and a hash function to generate parameters $a, b$. This provides assurance that the curve parameters were not specifically crafted to belong to a special class of weak curves or to contain a backdoor known only to the designer.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [What is the primary goal of elliptic curve selection in cryptography?],
    ("Interoperability", "Choosing secure parameters $a, b, p$", "Speed optimization", "Compatibility with RSA"),
    1,
  )

  #question(
    [Which organization publishes standard curves in FIPS 186-4?],
    ("ISO", "IEEE", "NIST", "SEC"),
    2,
  )

  #question(
    [What type of curve is Curve25519?],
    ("Weierstrass curve", "Montgomery curve", "Edwards curve", "Binary curve"),
    1,
  )

  #question(
    [Pollard's rho attack is resisted by choosing a curve with:],
    ("A small characteristic", "A large prime group order", "A zero trace of Frobenius", "A specific embedding degree"),
    1,
  )

  #question(
    [The MOV attack reduces the ECDLP to a DLP in a finite field extension using:],
    ("The Frobenius map", "The double-and-add algorithm", "The Weil pairing", "The Pollard's rho algorithm"),
    2,
  )

  #question(
    [A curve is called "anomalous" if its trace of Frobenius is:],
    ("0", "1", "Positive", "Prime"),
    1,
  )

  #question(
    [What is the benefit of using "verifiably random" curve parameters?],
    (
      "They are always faster",
      "They prevent backdoors in parameters",
      "They require less memory",
      "They are compatible with char 2 fields",
    ),
    1,
  )

  #question(
    [NIST P-256 is defined over:],
    ("A binary field", "A prime field", "An extension field", "The real numbers"),
    1,
  )

  #question(
    [What is the "rigidity" property of an elliptic curve?],
    (
      "The inability to change parameters easily",
      "The lack of choice in parameter selection to prevent manipulation",
      "The structural strength against all attacks",
      "The use of fixed-point arithmetic",
    ),
    1,
  )

  #question(
    [Curve25519 offers approximately how many bits of security?],
    ("64 bits", "128 bits", "192 bits", "256 bits"),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Research and describe the properties of "Safe Curves" criteria (e.g., as defined by DJB and Lange).
]

#supplementary[
  What is the "Rigidity" of a curve, and why is it desirable?
]

#supplementary[
  Explain why the embedding degree $k$ must be large for a curve to be secure.
]

#supplementary[
  Compare the Montgomery form with the short Weierstrass form in terms of performance and implementation.
]

#supplementary[
  What are "brainpool" curves, and how do they differ from NIST curves?
]

#supplementary[
  Describe the "Twist Security" property of an elliptic curve.
]

#supplementary[
  Research the SECG (Standards for Efficient Cryptography Group) and their SEC 2 document.
]

#supplementary[
  Why might some applications prefer custom curves over standardized ones?
]

#supplementary[
  Explain the process of "Point Validation" and why it is critical for curve selection.
]

#supplementary[
  Research the impact of the "Curve25519" design on modern cryptography protocols.
]
