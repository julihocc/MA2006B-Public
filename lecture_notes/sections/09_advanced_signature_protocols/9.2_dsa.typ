#import "../../utils.typ": *

== Digital Signature Algorithm (DSA)

=== Theory

#definition("DSA")[
  The *Digital Signature Algorithm (DSA)* is a Federal Information Processing Standard (FIPS 186). It is a variant of the ElGamal signature scheme.

  *Parameters*:
  - $p$: A large prime.
  - $q$: A prime factor of $p-1$.
  - $g$: A generator of a subgroup of order $q$ in $ZZ_p^*$.

  *Signature*: To sign hash $H(m)$:
  1. Choose random $k$.
  2. Compute $r = (g^k mod p) mod q$.
  3. Compute $s = k^(-1) (H(m) + x r) mod q$.
  Signature is $(r, s)$.

  *Verification*:
  1. Compute $w = s^(-1) mod q$.
  2. $u_1 = H(m) w mod q$, $u_2 = r w mod q$.
  3. $v = (g^(u_1) y^(u_2) mod p) mod q$.
  Verify $v = r$.
]

#theorem("Security")[
  DSA relies on the hardness of the Discrete Logarithm Problem in the subgroup of order $q$. Use of a proper random $k$ (nonce) is critical; key leakage occurs if $k$ is leaked or reused.
]

=== Solved Problems

#solved_problem[
  Why is it critical that the nonce $k$ is unique and secret for every DSA signature?
]
#solution[
  If $k$ is known, the private key $x$ can be computed from $s = k^(-1) (H(m) + x r)$ as $x = (s k - H(m)) r^(-1) mod q$.
  If $k$ is reused for two different messages $m_1, m_2$, the two signatures $(r, s_1)$ and $(r, s_2)$ allow an attacker to eliminate $k$ and solve for $x$.
]

=== Supplementary Problems

#supplementary[
  Compare DSA (finite field) with ECDSA (elliptic curve). What are the main efficiency gains of ECDSA?
]

#supplementary[
  Investigate the "Sony PS3 Hack" which resulted from proper ECDSA implementation but static $k$ usage.
]
