#import "../../utils.typ": *
== Euclidean Rings

=== Theory
#definition(title: "Euclidean Domain")[
  A *Euclidean Domain* (or Euclidean Ring) is an integral domain $R$ equipped with a Euclidean value function (or norm) $N: R without {0} arrow NN$ that satisfies the following *division algorithm*:

  For any $a, b in R$ with $b eq.not 0$, there exist elements $q$ (the *quotient*) and $r$ (the *remainder*) in $R$ such that:
  $ a = b q + r $
  where either $r = 0$ or $N(r) < N(b)$.
]



#theorem("The Euclidean Algorithm")[
  In a Euclidean Domain $R$, the greatest common divisor $d = "gcd"(a, b)$ of any two non-zero elements $a, b$ can be found using sequential divisions.
]

#proof[
  Applying the division algorithm repeatedly:
  $ a &= b q_1 + r_1 quad &("with " N(r_1) < N(b)) \
    b &= r_1 q_2 + r_2 quad &("with " N(r_2) < N(r_1)) \
      &dots.v \
    r_(i-2) &= r_(i-1) q_i + r_i quad &("with " N(r_i) < N(r_(i-1))) $
  Because the norm $N(r)$ produces a strictly decreasing sequence of non-negative integers, it must terminate with some $r_k = 0$. The last non-zero remainder $r_(k-1)$ divides all previous remainders and is the GCD $d$.
]

#theorem("Bézout's Identity & Extended Euclidean Algorithm")[
  For any elements $a, b$ in a Euclidean Domain $R$, there exist coefficients $x, y in R$ such that:
  $ a x + b y = "gcd"(a, b) $
  The *Extended Euclidean Algorithm (EEA)* is the constructive procedure used to compute these coefficients $x, y$ by running the Euclidean Algorithm and substituting the intermediate remainders backward.
]



=== Solved Problems

#solved_problem[
  Name two common examples of Euclidean domains and specify their Euclidean norm functions.
]
#solution[
  - The ring of integers $ZZ$ is a Euclidean domain with norm $N(a) = |a|$.
  - The ring of polynomials $F[x]$ over a field $F$ is a Euclidean domain with norm $N(f) = deg(f)$.
]

#solved_problem[
  How is the Extended Euclidean Algorithm (EEA) applied in cryptographic key generation?
]
#solution[
  - *RSA Key Generation*: The EEA is used to compute the modular multiplicative inverse of the public exponent $e$ to find the private key $d$ ($e d equiv 1 (mod phi(n))$).
  - *Determining Inverses*: In any finite field, finding inverses is done via the Euclidean algorithm.
]

#solved_problem[
  Show that $ZZ$ is a Euclidean domain.
]
#solution[
  Let $N(a) = |a|$. The standard division algorithm for integers states that for any $a, b in ZZ (b != 0)$, there exist $q, r$ such that $a = b q + r$ with $0 <= r < |b|$.
  Thus either $r=0$ or $N(r) = |r| < |b| = N(b)$, satisfying the Euclidean condition.
]

#solved_problem[
  Use the Extended Euclidean Algorithm to find the inverse of $17$ modulo $26$.
]
#solution[
  We seek $x$ such that $17 x equiv 1 (mod 26)$. This is equivalent to finding $x, y$ such that $17 x + 26 y = 1$.
  Steps:
  1. $26 = 1(17) + 9$
  2. $17 = 1(9) + 8$
  3. $9 = 1(8) + 1$ (GCD is 1)

  Back substitution:
  $1 = 9 - 8$
  $1 = 9 - (17 - 9) = 2(9) - 17$
  $1 = 2(26 - 17) - 17 = 2(26) - 3(17)$

  Thus $17(-3) + 26(2) = 1$.
  Modulo 26: $17(-3) equiv 1$.
  Inverse is $-3 equiv 23 (mod 26)$.
]

#solved_problem[
  Prove that the ring of Gaussian Integers $ZZ[i]$ is a Euclidean domain.
]
#solution[
  Define norm $N(a+b i) = a^2 + b^2$.
  For any $z, w in ZZ[i]$ ($w != 0$), consider the complex number $z/w$.
  This point lies somewhere in the complex plane. The Gaussian integers form a square lattice in $CC$.
  Any point in the plane is at distance at most $sqrt(2)/2$ from the nearest lattice point.
  Let $q$ be the Gaussian integer closest to $z/w$.
  Then $|z/w - q| <= sqrt(2)/2$.
  Let $r = z - w q$.
  Then $|r| = |w| |z/w - q| <= |w| sqrt(2)/2$.
  Since $sqrt(2)/2 < 1$, $|r| < |w|$, so $N(r) < N(w)$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [A Euclidean Domain is an integral domain equipped with a norm $N$ that allows for:],
    ("Differentiation", "Integration", "Division Algorithm", "Matrix Inversion"),
    2,
  )

  #question(
    [In a Euclidean Domain, for any $a, b (b != 0)$ there exist $q, r$ such that $a = b q + r$ where:],
    ([$r=0$ or $N(r) < N(b)$], [$N(r) > N(b)$], [$r=1$], [$q=0$]),
    0,
  )

  #question(
    [The Extended Euclidean Algorithm (EEA) is used to find integers $x, y$ such that $a x + b y =$ :],
    ([$lcm(a, b)$], [$gcd(a, b)$], [$a dot b$], [$a - b$]),
    1,
  )

  #question(
    [In the ring of integers $ZZ$, the Euclidean norm $N(a)$ is usually defined as:],
    ([$a^2$], [$|a|$], [$a+1$], [$1$]),
    1,
  )

  #question(
    [In the polynomial ring $F[x]$, the Euclidean norm $N(f)$ is:],
    ([$deg(f)$], [$f(0)$], [Leading coefficient], [Number of terms]),
    0,
  )

  #question(
    [An element $u$ in a Euclidean domain is a unit if and only if $N(u) =$ :],
    ([$N(1)$], [$0$], [$1$], [Undefined]),
    0,
  )

  #question(
    [If $gcd(a, n) = 1$, then $a$ has a multiplicative inverse modulo $n$. This inverse can be found using:],
    ("EEA", "Prime Factorization", "Sieve of Eratosthenes", "Lagrange Interpolation"),
    0,
  )

  #question(
    [Every Euclidean Domain is a:],
    ("Principal Ideal Domain (PID)", "Field", "Finite Ring", "Non-commutative Ring"),
    0,
  )

  #question(
    [The Gaussian Integers $ZZ[i]$ form a Euclidean Domain with norm $N(a+b i) =$ :],
    ([$a+b$], [$a^2+b^2$], [$sqrt(a^2+b^2)$], [$a^2-b^2$]),
    1,
  )

  #question(
    [In the EEA steps $r_(i-2) = q_i r_(i-1) + r_i$, the process terminates when:],
    ([$r_k = 1$], [$r_k = 0$], [$q_k = 0$], [$r_k < 0$]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Using the Euclidean Algorithm, find $"gcd"(123, 456)$.
]

#supplementary[
  In $ZZ[i]$, divide $11+3i$ by $1+i$ to find a quotient and remainder.
]

#supplementary[
  Find integers $x, y$ such that $17x + 101y = 1$. What is the inverse of $17$ modulo $101$?
]

#supplementary[
  Prove that every field is a Euclidean Domain.
]

#supplementary[
  In $ZZ[x]$, is it possible to define a Euclidean norm? Explain why or why not.
]

#supplementary[
  Use the EEA to find the inverse of $x+1$ in $ZZ_2[x]$ modulo $x^3+x+1$.
]

#supplementary[
  Calculate the GCD of $f(x) = x^3 - 1$ and $g(x) = x^2 - 1$ in $QQ[x]$.
]

#supplementary[
  Let $N(a + b sqrt(2)) = |a^2 - 2b^2|$ for the ring $ZZ[sqrt(2)]$. Calculate the norm of $3 + 2 sqrt(2)$. Is it a unit?
]

#supplementary[
  Prove that if $d = gcd(a, b)$, then $d$ divides any linear combination $a x + b y$.
]

#supplementary[
  Solve the linear congruence $12x equiv 6 (mod 21)$.
]
