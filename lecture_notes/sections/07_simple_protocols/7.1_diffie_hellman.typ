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

=== Supplementary Problems

#supplementary[
  Describe how a Man-in-the-Middle (Eve) can intercept and establish separate keys with Alice and Bob in the Diffie-Hellman protocol.
]

#supplementary[
  Explain why it is important that the order of the generator $g$ is a large prime (or has a large prime factor).
]
