#import "../../utils.typ": *

== Teorema de Fermat

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

=== Supplementary Problems

#supplementary[
  Use Euler's Theorem to find the last digit of $7^100$ (i.e., compute $7^100 mod 10$).
]

#supplementary[
  Explain how Fermat's Little Theorem is used in the primality test "Fermat Primality Test" and what its limitation is (discuss Carmichael numbers).
]
