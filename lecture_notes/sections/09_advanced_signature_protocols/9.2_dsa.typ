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

=== Self-Evaluation Quiz

#quiz[
  #question(
    [Which organization standardized the Digital Signature Algorithm (DSA)?],
    ([NIST], [IEEE], [IETF], [ISO]),
    0,
  )

  #question([The modulus $q$ in DSA must be a prime factor of:], ([$p$], [$p-1$], [$p+1$], [$2p$]), 1)

  #question(
    [In DSA, what does the signature component $r$ represent?],
    ([$g^k mod p$], [$(g^k mod p) mod q$], [$k^(-1) H(m)$], [$x dot r$]),
    1,
  )

  #question([Verification in DSA requires checking if $v$ is equal to:], ([$s$], [$r$], [$H(m)$], ["0"]), 1)

  #question(
    [What is the consequence of reusing the nonce $k$ for two different messages?],
    ([Nothing], [Private key leakage], [Collision in hash], [Signature becomes too long]),
    1,
  )

  #question(
    [Which operation is NOT typically performed modulo $p$ in DSA?],
    ([Exponentiation], [$y^(u_2)$], [Computing $s$], [Modular reduction]),
    2,
  )

  #question(
    [The value $w$ in verification is computed as:],
    ([$s mod q$], [$s^(-1) mod q$], [$s dot r$], [$H(m) / s$]),
    1,
  )

  #question([Which mathematical problem forms the security basis of DSA?], ([Factoring], [DLP], [LVP], [Subset Sum]), 1)

  #question([The size of the subgroup $q$ is typically:], ([160-256 bits], [2048-4096 bits], [8 bits], [64 bits]), 0)

  #question(
    [If $s = 0$ during signing, what should the signer do?],
    ([Ignore it], [Choose a new $k$ and start over], [Use $s=1$], [Stop the process]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Compare DSA (finite field) with ECDSA (elliptic curve). What are the main efficiency gains of ECDSA?
]

#supplementary[
  Investigate the "Sony PS3 Hack" which resulted from proper ECDSA implementation but static $k$ usage.
]

#supplementary[
  Prove that the verification condition $v = r$ holds for a valid DSA signature.
]

#supplementary[
  What are the "FIPS 186-4" recommended sizes for $(L, N)$, where $L$ is the length of $p$ and $N$ is the length of $q$?
]

#supplementary[
  Describe the "Pre-computation" technique that can speed up the DSA signing process.
]

#supplementary[
  Explain why $r$ and $s$ must be non-zero for a signature to be valid according to the standard.
]

#supplementary[
  Given $p=59, q=29, g=3$. If $x=10$ and $k=15, H(m)=5$, compute the DSA signature $(r, s)$.
]

#supplementary[
  Using the values from the previous problem, verify the signature.
]

#supplementary[
  Analyze the security implications of using a non-cryptographic random number generator for $k$.
]

#supplementary[
  How does the "Edwards-curve Digital Signature Algorithm (EdDSA)" differ from standard ECDSA in terms of nonce usage?
]
