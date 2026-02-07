#import "../../utils.typ": *

== Fermat's Theorem

=== Theory

#theorem("Fermat's Little Theorem")[
  If $p$ is a prime number and $a$ is an integer not divisible by $p$, then:
  $ a^(p-1) equiv 1 (mod p) $

  Equivalently, for any integer $a$:
  $ a^p equiv a (mod p) $
]

#definition("Euler's Totient Function")[
  Euler's totient function $phi(n)$ counts the positive integers up to $n$ that are relatively prime to $n$.
  - If $p$ is prime, $phi(p) = p - 1$.
  - If $n = p q$ (product of distinct primes), $phi(n) = (p-1)(q-1)$.
]

#theorem("Euler's Theorem")[
  A generalization of Fermat's Little Theorem via the totient function:
  If $gcd(a, n) = 1$, then:
  $ a^(phi(n)) equiv 1 (mod n) $
  This theorem forms the basis of the RSA cryptosystem, where the private key $d$ is the modular inverse of the public exponent $e$ modulo $phi(n)$.
]

#definition("Primitive Root")[
  A *primitive root* modulo $n$ is an integer $g$ such that every integer coprime to $n$ is congruent to a power of $g$ modulo $n$. In other words, $g$ generates the multiplicative group of integers modulo $n$.
]

#definition("Discrete Logarithm Problem (DLP)")[
  Given a group $G$, a generator $g$, and an element $h = g^x$, the *Discrete Logarithm Problem* is to find the integer $x$. This problem is conjectured to be computationally hard for carefully chosen groups, forming the security basis of Diffie-Hellman and ECC.
]

=== Solved Problems

#solved_problem[
  Calculate $2^50 mod 17$.
]
#solution[
  Since 17 is prime, by Fermat's Little Theorem, $2^16 equiv 1 (mod 17)$.
  We divide the exponent 50 by 16: $50 = 3(16) + 2$.
  $ 2^50 = (2^16)^3 dot 2^2 equiv (1)^3 dot 4 (mod 17) $
  $ 2^50 equiv 4 (mod 17) $
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [Fermat's Little Theorem states that if $p$ is prime and $p$ does not divide $a$, then:],
    (
      "$a^(p-1) equiv 1 (mod p)$",
      "$a^p equiv 1 (mod p)$",
      "$a^(p-1) equiv a (mod p)$",
      "$a^2 equiv 1 (mod p)$",
    ),
    0,
  )

  #question(
    [Euler's totient function $phi(n)$ for $n = p q$ (where $p, q$ are distinct primes) is:],
    (
      "$(p-1)(q-1)$",
      "$pq - 1$",
      "$p-1 + q-1$",
      "$pq$",
    ),
    0,
  )

  #question(
    [The Discrete Logarithm Problem is easy to solve in which group?],
    (
      "Additive group of integers modulo $n$ ($ZZ_n, +$)",
      "Multiplicative group of integers modulo $p$ ($ZZ_p^*, dot$)",
      "Elliptic Curve group over a finite field",
      "None of the above",
    ),
    0,
  )
]

=== Supplementary Problems

#supplementary[
  Use Euler's Theorem to find the last digit of $7^100$ (i.e., compute $7^100 mod 10$).
]

#supplementary[
  Explain how Fermat's Little Theorem is used in the primality test "Fermat Primality Test" and what its limitation is (discuss Carmichael numbers).
]
