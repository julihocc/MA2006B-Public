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

=== Supplementary Problems

#supplementary[
  Compare the communication overhead of MQV with a signed Diffie-Hellman exchange (where each DH share is signed).
]

#supplementary[
  Investigate the "HMQV" (Hashed MQV) variant and how it addresses potential weaknesses in the original MQV proof of security.
]
