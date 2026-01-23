#import "../../utils.typ": *

== Nyberg-Rueppel Protocol

=== Theory

#definition("Nyberg-Rueppel Signature")[
  The *Nyberg-Rueppel* signature scheme is a Digital Signature variant that allows *message recovery*. This means the message itself is not required to be transmitted separately; it can be recovered from the signature during verification.

  *Key Generation*: Same as ElGamal ($y = g^x mod p$).

  *Signature Generation*: To sign message $m$:
  1. Choose random $k in ZZ_q^*$.
  2. Compute $r = g^k mod p$.
  3. Compute $e = m dot r mod p$.
  4. Compute $s = (k - e x) mod q$.
  Signature is $(e, s)$.

  *Verification / Recovery*:
  1. Compute $v = g^s y^e mod p$.
  2. Recover message $m = e dot v^(-1) mod p$ (or verify equality if $m$ is known).
]

#theorem("Message Recovery")[
  Because message recovery is built-in, this scheme is bandwidth-efficient for short messages, as only the signature needs to be sent.
]

=== Solved Problems

#solved_problem[
  Verify the correctness of the Nyberg-Rueppel recovery equation.
]
#solution[
  We compute $v = g^s y^e = g^(k - e x) (g^x)^e = g^(k - e x + e x) = g^k = r$.
  Then $e dot v^(-1) = (m dot r) dot r^(-1) = m mod p$.
  Thus, the message $m$ is correctly recovered.
]

=== Supplementary Problems

#supplementary[
  What are the advantages of message recovery schemes for environments with extremely limited bandwidth (e.g., smart cards or IoT)?
]

#supplementary[
  Analyze how the parameter $q$ (order of the group) affects the security in relation to the size of $p$.
]
