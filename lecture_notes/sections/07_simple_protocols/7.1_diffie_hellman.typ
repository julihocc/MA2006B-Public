#import "../../utils.typ": *

== Diffie-Hellman Protocol

=== Theory

#definition("Diffie-Hellman Key Exchange")[
  The *Diffie-Hellman (DH)* protocol allows two parties, Alice and Bob, to establish a shared secret over an insecure channel.

  *Setup*: Publicly agree on a cyclic group $G$ of order $n$ and a generator $g$.

  *Protocol*:
  1. Alice chooses a secret integer $a$, computes $A = g^a$, and sends $A$ to Bob.
  2. Bob chooses a secret integer $b$, computes $B = g^b$, and sends $B$ to Alice.
  3. Alice computes $S = B^a = (g^b)^a = g^(a b)$.
  4. Bob computes $S = A^b = (g^a)^b = g^(a b)$.

  The shared secret is $S$.
]

#theorem("Security and Limitation")[
  The security relies on the hardness of the *Discrete Logarithm Problem (DLP)* or *Computational Diffie-Hellman (CDH)* problem.
  However, the basic DH protocol is unauthenticated and vulnerable to a *Man-in-the-Middle (MITM)* attack.
]

=== Solved Problems

#solved_problem[
  Perform a Diffie-Hellman key exchange with $p=23$ and $g=5$. Alice chooses $a=6$ and Bob chooses $b=15$.
]
#solution[
  1. Alice computes $A = 5^6 mod 23$.
    $5^2 = 25 equiv 2$.
    $5^6 = (5^2)^3 = 2^3 = 8$. Alice sends $A=8$.
  2. Bob computes $B = 5^15 mod 23$.
    $5^3 = 125 equiv 10$.
    $5^15 = (5^3)^5 = 10^5 = 100 dot 100 dot 10 equiv 8 dot 8 dot 10 = 640$.
    $640 = 27(23) + 19$. Bob sends $B=19$.
  3. *Shared Secret*:
    Alice: $S = B^a = 19^6 equiv (-4)^6 = 4^6 = 4096 equiv 2$.
    Bob: $S = A^b = 8^15 = (2^3)^15 = 2^45 = 2^(22 dot 2 + 1) equiv 1^2 dot 2 = 2$ (by Fermat's Little Theorem).
  Shared secret is $2$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [What is the primary objective of the Diffie-Hellman protocol?],
    ("Data encryption", "Key exchange", "Digital signatures", "Password hashing"),
    1,
  )

  #question(
    [The security of basic Diffie-Hellman relies on the hardness of which problem?],
    ("Integer Factorization", "Discrete Logarithm Problem", "Subset Sum", "Birthday Paradox"),
    1,
  )

  #question(
    [In the DH setup, Alice and Bob publicly agree on a cyclic group $G$ and which other component?],
    ("A secret key", "A generator $g$", "A hash function", "A salt"),
    1,
  )

  #question(
    [If Alice's secret key is $a$, her public value $A$ is computed as:],
    ("$g a$", "$a^g$", "$g^a$", "$g/a$"),
    2,
  )

  #question(
    [Once Bob receives Alice's public value $A$, he computes the shared secret $S$ using:],
    ("$A dot b$", "$A + b$", "$A^b$", "$b^A$"),
    2,
  )

  #question(
    [Why is the basic Diffie-Hellman protocol vulnerable to Man-in-the-Middle (MITM) attacks?],
    ("It is too slow", "It lacks authentication", "The keys are too short", "It uses prime numbers"),
    1,
  )

  #question(
    [With $p=11, g=2$, and Alice's secret $a=3$, what is her public value $A$?],
    ("6", "7", "8", "9"),
    2,
  )

  #question(
    [The Computational Diffie-Hellman (CDH) problem asks to find $g^(a b)$ given values $g, g^a$, and which other value?],
    ("$a$", "$b$", "$g^b$", "$a+b$"),
    2,
  )

  #question(
    [True or False: The Diffie-Hellman protocol can be implemented using elliptic curve groups.],
    ("True", "False", "Only for binary fields", "Only for prime fields"),
    0,
  )

  #question(
    [Which property ensures that $B^a = A^b$ in the DH protocol?],
    (
      "Commutativity of exponents: $(g^b)^a = (g^a)^b$",
      "Linearity of the group",
      "The Chinese Remainder Theorem",
      "Distributivity",
    ),
    0,
  )
]

=== Supplementary Problems

#supplementary[
  Describe how a Man-in-the-Middle (Eve) can intercept and establish separate keys with Alice and Bob in the Diffie-Hellman protocol.
]

#supplementary[
  Explain why it is important that the order of the generator $g$ is a large prime (or has a large prime factor).
]

#supplementary[
  Research the difference between Static Diffie-Hellman and Ephemeral Diffie-Hellman (DHE). Why is DHE preferred for forward secrecy?
]

#supplementary[
  Explain the "Small Subgroup Attack" on Diffie-Hellman and how it can be mitigated.
]

#supplementary[
  Show how the Diffie-Hellman protocol can be extended to three participants (Alice, Bob, and Charlie) to establish a single shared secret.
]

#supplementary[
  In $upright("GF")(7)$ with $g=3$, Alice chooses $a=2$ and Bob chooses $b=4$. Calculate $A, B$ and the shared secret $S$.
]

#supplementary[
  Describe the Decisional Diffie-Hellman (DDH) problem and its relationship to the CDH problem.
]

#supplementary[
  What are "Safe Primes" ($p = 2q + 1$ where $q$ is prime), and why are they used in Diffie-Hellman?
]

#supplementary[
  Research how the STS (Station-to-Station) protocol provides authentication to the Diffie-Hellman key exchange.
]

#supplementary[
  Research the impact of quantum computing (Shor's algorithm) on the security of the Diffie-Hellman protocol.
]
