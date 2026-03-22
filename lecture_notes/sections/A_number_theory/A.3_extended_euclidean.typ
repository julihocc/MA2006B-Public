#import "../../utils.typ": *
== The Extended Euclidean Algorithm

=== Theory

#theorem("Bézout's Identity")[
  For any integers $a, b$ (not both zero), there exist integers $s, t$ such that:
  $ gcd(a, b) = s a + t b $
  The integers $s$ and $t$ are called *Bézout coefficients*. If $gcd(a, b) = 1$, this gives $s a + t b = 1$, so $s a equiv 1 space (mod b)$, meaning $s$ is the modular inverse of $a$ modulo $b$.
]

#algorithm("Extended Euclidean Algorithm")[
  To find $gcd(a, b)$ and Bézout coefficients $s, t$ such that $s a + t b = gcd(a, b)$:

  Initialize: $r_0 = a, r_1 = b, s_0 = 1, s_1 = 0, t_0 = 0, t_1 = 1$.

  While $r_{i+1} != 0$:
  - $q_i = floor(r_i / r_{i+1})$
  - $r_{i+2} = r_i - q_i r_{i+1}$
  - $s_{i+2} = s_i - q_i s_{i+1}$
  - $t_{i+2} = t_i - q_i t_{i+1}$

  When $r_{i+1} = 0$: $gcd = r_i$, $s = s_i$, $t = t_i$.
]

#corollary("Modular Inverse via Extended GCD")[
  An integer $a$ has a multiplicative inverse modulo $n$ if and only if $gcd(a, n) = 1$. In that case, $a^{-1} mod n$ is the Bézout coefficient $s$ (reduced mod $n$) from $gcd(a, n) = s a + t n$.
]

#note[
  The Extended Euclidean Algorithm is used extensively in cryptography:
  - *RSA*: Computing the private exponent $d = e^{-1} mod phi(n)$.
  - *ECC*: Computing modular inverses needed in point addition formulas.
  - *CRT*: Computing the modular inverses needed in the construction.
]

=== Solved Problems

#solved_problem[
  Use the Extended Euclidean Algorithm to find $gcd(35, 15)$ and express it as a linear combination.
]
#solution[
  #table(
    columns: 6,
    [$i$], [$r_i$], [$q_i$], [$r_{i+1}$], [$s_i$], [$t_i$],
    [0], [35], [2], [15], [1], [0],
    [1], [15], [3], [5], [0], [1],
    [2], [5], [3], [0], [1], [-2],
  )
  $gcd(35,15) = 5$, expressed as: $5 = 1 dot 35 + (-2) dot 15$. Verify: $35 - 30 = 5$. ✓
]

#solved_problem[
  Find the inverse of $17$ modulo $43$ using the Extended Euclidean Algorithm.
]
#solution[
  Run the algorithm on $(43, 17)$:
  - $43 = 2 dot 17 + 9$ → $9 = 43 - 2(17)$
  - $17 = 1 dot 9 + 8$ → $8 = 17 - 1 dot 9 = 17 - (43-2 dot 17) = 3 dot 17 - 43$
  - $9 = 1 dot 8 + 1$ → $1 = 9 - 8 = (43 - 2 dot 17) - (3 dot 17 - 43) = 2 dot 43 - 5 dot 17$
  - $8 = 8 dot 1 + 0$.

  So $1 = 2 dot 43 - 5 dot 17$, meaning $-5 dot 17 equiv 1 space (mod 43)$, so $17^{-1} equiv -5 equiv 38 space (mod 43)$.
  Check: $17 dot 38 = 646 = 15(43) + 1$. ✓
]

#solved_problem[
  In RSA, let $p = 5$, $q = 11$, $e = 3$. Find the private key $d$.
]
#solution[
  $n = 55$, $phi(n) = (5-1)(11-1) = 40$. Need $d = 3^{-1} mod 40$.

  Extended GCD on $(40, 3)$:
  - $40 = 13 dot 3 + 1$ → $1 = 40 - 13 dot 3$

  So $d equiv -13 equiv 27 space (mod 40)$.
  Check: $3 dot 27 = 81 = 2(40) + 1 equiv 1 space (mod 40)$. ✓
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [Bézout's identity states that $gcd(a,b)$ can be written as:],
    ([$a + b$], [$a b$], [$s a + t b$ for some integers $s, t$], [$a / b$]),
    2,
  )

  #question(
    [$a$ has a modular inverse mod $n$ if and only if:],
    (["$a$ is prime"], ["$n$ is prime"], ["$gcd(a, n) = 1$"], ["$a < n$"]),
    2,
  )

  #question(
    [The Extended Euclidean Algorithm also computes:],
    (["Only the GCD"], ["The GCD and the Bézout coefficients"], ["Prime factorization"], ["Euler's totient"]),
    1,
  )

  #question(
    [If $gcd(a, n) = 1$ and $s a + t n = 1$, then $a^{-1} mod n$ is:],
    ([$t mod n$], [$s mod n$], [$n - s$], [$a - s$]),
    1,
  )

  #question(
    [In RSA, the private key $d$ satisfies:],
    ([$d e equiv 0 space (mod phi(n))$], [$d e equiv 1 space (mod phi(n))$], [$d equiv e space (mod n)$], [$d + e = phi(n)$]),
    1,
  )

  #question(
    [$17^{-1} mod 43$ equals:],
    (["5"], ["28"], ["38"], ["17"]),
    2,
  )

  #question(
    [The Bézout coefficients $s, t$ in $s a + t b = gcd(a,b)$ are:],
    (["Always positive"], ["Always negative"], ["Unique integers"], ["Not necessarily unique, but one canonical pair exists"]),
    3,
  )

  #question(
    [Which algorithm efficiently computes $a^{-1} mod n$ without factoring?],
    (["Sieve of Eratosthenes"], ["Extended Euclidean Algorithm"], ["Baby-step Giant-step"], ["Pollard's rho"]),
    1,
  )

  #question(
    [$gcd(35, 15)$ expressed as a linear combination is $5 =$],
    ([$1(35) + 2(15)$], [$1(35) - 2(15)$], [$2(35) - 1(15)$], [$-1(35) + 2(15)$]),
    1,
  )

  #question(
    [True or False: The Extended Euclidean Algorithm runs in polynomial time.],
    (["True"], ["False — it's exponential"], ["Only for prime inputs"], ["Depends on the implementation"]),
    0,
  )
]

=== Supplementary Problems

#supplementary[
  Use the Extended Euclidean Algorithm to compute $gcd(56, 98)$ and express it as $s(56) + t(98)$.
]

#supplementary[
  Find the inverse of $11$ modulo $26$ (used in the affine cipher).
]

#supplementary[
  Prove that if $gcd(a, n) > 1$, then $a$ has no modular inverse modulo $n$.
]

#supplementary[
  Compute $3^{-1} mod 17$ and $7^{-1} mod 17$ using the Extended Euclidean Algorithm.
]

#supplementary[
  In RSA with $p=7, q=13, e=5$, find $d$ and verify $e d equiv 1 space (mod phi(n))$.
]

#supplementary[
  Show that the set of units $ZZ_n^* = {a in ZZ_n : gcd(a,n)=1}$ forms a group under multiplication mod $n$.
]
