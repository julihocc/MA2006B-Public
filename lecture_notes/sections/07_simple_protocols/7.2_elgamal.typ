#import "../../utils.typ": *

== ElGamal Protocol

=== Theory

#definition("ElGamal Encryption")[
  A public-key cryptosystem based on DLP.

  *Key Generation*:
  - Private key: $x in \{1, ..., p-2\}$.
  - Public key: $y = g^x mod p$, along with $(p, g)$.

  *Encryption*: To encrypt message $m$:
  1. Choose random ephemeral key $k$.
  2. Compute $c_1 = g^k mod p$.
  3. Compute $c_2 = m dot y^k mod p$.
  Ciphertext is $(c_1, c_2)$.

  *Decryption*:
  $ m = c_2 dot (c_1^x)^(-1) mod p $
]

#theorem("Probabilistic Nature")[
  ElGamal is *probabilistic*: encrypting the same message twice with different random $k$ yields different ciphertexts. This prevents chosen-plaintext attacks that check if a ciphertext corresponds to a known message.
]

=== Solved Problems

#solved_problem[
  Encrypt $m=10$ with public key $(p=23, g=5, y=8)$ using random $k=3$.
]
#solution[
  1. Compute $c_1 = g^k = 5^3 = 125 equiv 10 mod 23$.
  2. Compute mask $s = y^k = 8^3 = 512$.
    $512 = 22(23) + 6$. So $s = 6$.
  3. Compute $c_2 = m dot s = 10 dot 6 = 60$.
    $60 = 2(23) + 14 equiv 14$.
  Ciphertext is $(10, 14)$.
]

=== Supplementary Problems

#supplementary[
  Show that ElGamal encryption has the multiplicative homomorphic property: $E(m_1) dot E(m_2) = E(m_1 m_2)$ (component-wise multiplication of ciphertexts).
]

#supplementary[
  What happens to the security of ElGamal if the random value $k$ is reused for different messages?
]
