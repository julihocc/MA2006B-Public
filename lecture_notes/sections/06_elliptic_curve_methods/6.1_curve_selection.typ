#import "../../utils.typ": *

== Elección de curvas elípticas

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

=== Supplementary Problems

#supplementary[
  Research and describe the properties of "Safe Curves" criteria (e.g., as defined by DJB and Lange).
]

#supplementary[
  What is the "Rigidity" of a curve, and why is it desirable?
]
