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

=== Self-Evaluation Quiz

#quiz[
  #question(
    [ElGamal encryption is based on the hardness of which mathematical problem?],
    ("Integer Factorization", "Discrete Logarithm Problem (DLP)", "Subset Sum", "Birthday Paradox"),
    1,
  )

  #question(
    [In the ElGamal public key $(p, g, y)$, how is $y$ computed from the secret $x$?],
    ("$y = g x mod p$", "$y = p^x mod g$", "$y = g^x mod p$", "$y = x^g mod p$"),
    2,
  )

  #question(
    [What is the role of the value $x$ in the ElGamal cryptosystem?],
    ("The message", "The public key component", "The private key", "The ephemeral random factor"),
    2,
  )

  #question(
    [Why is ElGamal encryption described as "probabilistic"?],
    (
      "Because decryption might fail",
      "Because it uses a random ephemeral key $k$ for each encryption",
      "Because it only encrypted half the bits",
      "Because it relies on prime numbers",
    ),
    1,
  )

  #question(
    [An ElGamal ciphertext consists of two components $(c_1, c_2)$. What is $c_1$?],
    ("$m dot y^k$", "$g^k$", "$y^x$", "$g^m$"),
    1,
  )

  #question(
    [In the encryption process, $c_2$ is computed as message $m$ multiplied by:],
    ("$g^k$", "$x^y$", "The ephemeral secret $k$", "The masking key $s = y^k$"),
    3,
  )

  #question(
    [To decrypt, the receiver first computes $s = c_1^x$. The message $m$ is then recovered by:],
    ("$c_2 + s$", "$c_2 - s$", "$c_2 / s$", "$c_2 dot s^(-1) mod p$"),
    3,
  )

  #question(
    [ElGamal encryption can be viewed as an application of which key exchange protocol?],
    ("Diffie-Hellman", "RSA", "Merkle Puzzles", "Symmetric AES"),
    0,
  )

  #question(
    [If the same message $m$ is encrypted twice with two different values of $k$, what is the result?],
    ("The same ciphertext", "Two different ciphertexts", "An invalid ciphertext", "The private key is revealed"),
    1,
  )

  #question(
    [Which of the following is true for ElGamal?],
    (
      "Encryption handles any message size",
      "Ciphertext is twice the size of the plaintext",
      "It is faster than symmetric encryption",
      "It does not require prime numbers",
    ),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Show that ElGamal encryption has the multiplicative homomorphic property: $E(m_1) dot E(m_2) = E(m_1 m_2)$ (component-wise multiplication of ciphertexts).
]

#supplementary[
  What happens to the security of ElGamal if the random value $k$ is reused for different messages?
]

#supplementary[
  Explain why the message $m$ must be represented as an element of the cyclic group used by ElGamal.
]

#supplementary[
  In $upright("GF")(23)$ with $g=5$, the public key is $y=8$. Alice wants to encrypt $m=15$ using $k=9$. Calculate the ciphertext.
]

#supplementary[
  Research the "Malleability" of ElGamal ciphertexts and why it might be a security risk in certain protocols.
]

#supplementary[
  Describe how to adapt ElGamal to work on an elliptic curve group $E(upright("GF")(q))$.
]

#supplementary[
  Calculate the modular inverse needed for decryption in the solved problem ($c_1=10, c_2=14, x=6$ over $p=23$).
]

#supplementary[
  Why is it important for $p-1$ to have at least one large prime factor in an ElGamal implementation?
]

#supplementary[
  Compare the performance and ciphertext size of ElGamal vs. RSA for the same security level.
]

#supplementary[
  Research the "Cramer-Shoup" cryptosystem and how it improves upon ElGamal's security against chosen-ciphertext attacks.
]
