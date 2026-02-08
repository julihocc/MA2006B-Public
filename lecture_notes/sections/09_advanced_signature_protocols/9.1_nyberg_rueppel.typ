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

=== Self-Evaluation Quiz

#quiz[
  #question(
    [What is the main advantage of the Nyberg-Rueppel signature scheme?],
    ("Faster signing", "Message recovery", "Smaller keys", "Higher security against quantum computers"),
    1,
  )

  #question(
    [During Nyberg-Rueppel signature generation, how is the intermediate value $e$ computed?],
    ("$m dot r mod p$", "$m + r mod q$", "$H(m) dot x$", "$k^(-1) m$"),
    0,
  )

  #question(
    [In which step of the protocol is the message $m$ actually recovered?],
    ("Generation", "Verification", "Key setup", "Transmission"),
    1,
  )

  #question(
    [What is the relationship between the private key $x$ and public key $y$ in this scheme?],
    ("$x = g^y$", "$y = g^x mod p$", "$y = x^g$", "$x dot y = 1$"),
    1,
  )

  #question(
    [Nyberg-Rueppel is particularly suited for which type of messages?],
    ("Long files", "Short messages", "Streaming video", "Random noise"),
    1,
  )

  #question(
    [Which value is restored by computing $v = g^s y^e mod p$?],
    ("The message $m$", "The nonce $k$", "The value $r$", "The private key $x$"),
    2,
  )

  #question([How many values comprise the Nyberg-Rueppel signature?], ("1", "2", "3", "0"), 1)

  #question(
    [If the recovered $m$ is not meaningful in the context of the application, what does it imply?],
    ("Signature is valid", "Signature is invalid", "Key is too short", "Network error"),
    1,
  )

  #question(
    [The security of Nyberg-Rueppel is based on:],
    ("Factoring", "Discrete Logarithm Problem (DLP)", "RSA", "Elliptic Curve Pairing"),
    1,
  )

  #question(
    [Why does message recovery save bandwidth?],
    (
      "Smaller primes are used",
      "The message is not sent alongside the signature",
      "It uses compression",
      "It avoids hashing",
    ),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  What are the advantages of message recovery schemes for environments with extremely limited bandwidth (e.g., smart cards or IoT)?
]

#supplementary[
  Analyze how the parameter $q$ (order of the group) affects the security in relation to the size of $p$.
]

#supplementary[
  Show that if an attacker can solve the DLP, they can forge a Nyberg-Rueppel signature for any message.
]

#supplementary[
  Describe how a "partial" message recovery scheme might work if $m$ is longer than $p$.
]

#supplementary[
  Explain the consequence if the value $v$ is not invertible (i.e., $gcd(v, p) != 1$). How likely is this?
]

#supplementary[
  Compare the computational cost of Nyberg-Rueppel verification with standard ElGamal verification.
]

#supplementary[
  Discuss the security of Nyberg-Rueppel if the nonce $k$ is leaked.
]

#supplementary[
  In a finite field $upright("GF")(p)$, if $p=11, g=2, x=3, k=4, m=5$, compute the signature $(e, s)$.
]

#supplementary[
  Using the signature from the previous problem, show the recovery of message $m$.
]

#supplementary[
  Why is it important to have some redundancy in the message $m$ for the recovery process to serve as an authentication check?
]
