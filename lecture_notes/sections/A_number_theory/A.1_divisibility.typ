#import "../../utils.typ": *
== Divisibility and Primes

=== Theory

#definition("Divisibility")[
  Let $a, b in ZZ$ with $b != 0$. We say *$b$ divides $a$*, written $b divides a$, if there exists an integer $k$ such that $a = b k$. We say $b$ is a *divisor* of $a$ (and $a$ is a *multiple* of $b$).

  If $b$ does not divide $a$, we write $b divides.not a$.
]

#definition("Prime and Composite Numbers")[
  An integer $p > 1$ is called *prime* if its only positive divisors are $1$ and $p$ itself. An integer $n > 1$ that is not prime is called *composite*.

  The first several primes: $2, 3, 5, 7, 11, 13, 17, 19, 23, 29, ...$
]

#theorem("Fundamental Theorem of Arithmetic")[
  Every integer $n > 1$ can be expressed as a product of primes, unique up to the order of the factors:
  $ n = p_1^{e_1} p_2^{e_2} dots.c p_k^{e_k} $
  where $p_1 < p_2 < ... < p_k$ are primes and $e_i >= 1$.
]

#note[
  The uniqueness of prime factorization is fundamental to RSA: the difficulty of factoring $n = p q$ (a product of two large primes) is the hardness assumption underlying RSA's security.
]

#definition("Greatest Common Divisor")[
  The *greatest common divisor* of integers $a$ and $b$ (not both zero), denoted $gcd(a, b)$, is the largest positive integer dividing both $a$ and $b$.

  If $gcd(a, b) = 1$, we say $a$ and $b$ are *coprime* (or *relatively prime*).
]

#algorithm("Euclidean Algorithm")[
  To compute $gcd(a, b)$ with $a >= b > 0$:
  1. If $b = 0$, return $a$.
  2. Replace $(a, b)$ with $(b, a mod b)$ and repeat.

  *Example*: $gcd(48, 18)$: $(48,18) -> (18,12) -> (12,6) -> (6,0)$. Answer: $6$.
]

#theorem("Infinitude of Primes")[
  There are infinitely many prime numbers. (Euclid's proof: if $p_1,...,p_k$ were all primes, then $N = p_1 dots.c p_k + 1$ has a prime factor not in the list.)
]

#definition("Euler's Totient Function")[
  For $n >= 1$, *Euler's totient function* $phi(n)$ counts the number of integers in $\{1,...,n\}$ that are coprime to $n$:
  $ phi(n) = n product_{p | n} (1 - 1/p) $
  where the product is over all distinct primes $p$ dividing $n$.

  Key values: $phi(p) = p - 1$ for prime $p$; $phi(p q) = (p-1)(q-1)$ for distinct primes $p, q$.
]

=== Solved Problems

#solved_problem[
  Find the prime factorization of $360$.
]
#solution[
  $360 = 2 dot 180 = 2 dot 2 dot 90 = 4 dot 90 = 4 dot 9 dot 10 = 2^3 dot 3^2 dot 5$.
]

#solved_problem[
  Compute $gcd(252, 198)$ using the Euclidean algorithm.
]
#solution[
  $252 = 1 dot 198 + 54$\
  $198 = 3 dot 54 + 36$\
  $54 = 1 dot 36 + 18$\
  $36 = 2 dot 18 + 0$\
  So $gcd(252, 198) = 18$.
]

#solved_problem[
  Compute $phi(36)$ and $phi(100)$.
]
#solution[
  - $36 = 2^2 dot 3^2$: $phi(36) = 36(1 - 1/2)(1 - 1/3) = 36 dot 1/2 dot 2/3 = 12$.
  - $100 = 2^2 dot 5^2$: $phi(100) = 100(1-1/2)(1-1/5) = 100 dot 1/2 dot 4/5 = 40$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [Which of the following is the Fundamental Theorem of Arithmetic?],
    (["Every integer is prime or composite"], ["Every integer $n>1$ has a unique prime factorization"], ["There are finitely many primes"], ["Every prime divides some composite"]),
    1,
  )

  #question(
    [$s a + t b = gcd(a, b) = 1$ means $a$ and $b$ are:],
    (["Both prime"], ["Coprime (relatively prime)"], ["Multiples of each other"], ["Equal"]),
    1,
  )

  #question(
    [What is $phi(p)$ for a prime $p$?],
    ([$p$], [$p + 1$], [$p - 1$], [$p/2$]),
    2,
  )

  #question(
    [The Euclidean algorithm computes:],
    (["Prime factorization"], ["The GCD"], ["Modular inverse"], ["Euler's totient"]),
    1,
  )

  #question(
    [What is $phi(15)$?],
    (["4"], ["6"], ["8"], ["10"]),
    2,
  )

  #question(
    [True or False: There are infinitely many prime numbers.],
    (["True"], ["False"], ["Unknown"], ["Only finitely many large primes"]),
    0,
  )

  #question(
    [$gcd(12, 18)$ equals:],
    (["2"], ["3"], ["6"], ["12"]),
    2,
  )

  #question(
    [If $n = p q$ for distinct primes $p, q$, then $phi(n) =$],
    ([$p q$], [$(p-1)(q-1)$], [$p + q - 1$], [$p - q$]),
    1,
  )

  #question(
    [RSA security relies on the hardness of:],
    (["Computing GCDs"], ["Factoring $n = p q$"], ["Finding $phi(p)$"], ["The Euclidean algorithm"]),
    1,
  )

  #question(
    [A composite number $n > 1$ is:],
    (["Divisible only by 1 and itself"], ["Not prime"], ["Coprime to all primes"], ["Always even"]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Prove that if $p$ is prime and $p divides a b$, then $p divides a$ or $p divides b$.
]

#supplementary[
  Compute $gcd(1071, 462)$ using the Euclidean algorithm, showing all steps.
]

#supplementary[
  Compute $phi(n)$ for $n = 12, 30, 77, 256$.
]

#supplementary[
  Prove that $gcd(n, n+1) = 1$ for any integer $n >= 1$.
]

#supplementary[
  Show that if $gcd(a, n) = 1$ and $gcd(b, n) = 1$, then $gcd(a b, n) = 1$.
]

#supplementary[
  Using the Sieve of Eratosthenes, find all primes less than 50.
]
