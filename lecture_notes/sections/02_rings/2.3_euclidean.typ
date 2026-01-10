#import "../../utils.typ": *
== Euclidean Rings

=== Theory
#definition(title: "Euclidean Domain")[
  A *Euclidean Domain* (or Euclidean Ring) is an integral domain $R$ equipped with a Euclidean value function (or norm) $N: R without {0} arrow NN$ allowing a division algorithm.
  For any $a, b in R$ with $b eq.not 0$, there exist $q, r in R$ such that:
  $ a = b q + r $
  where either $r = 0$ or $N(r) < N(b)$.
]

#example[
  The ring of integers $ZZ$ is a Euclidean domain with norm $N(a) = |a|$. The ring of polynomials $F[x]$ over a field $F$ is a Euclidean domain with norm $N(f) = deg(f)$.
]

#theorem("Extended Euclidean Algorithm (EEA)")[
  The Extended Euclidean Algorithm (EEA) finds the greatest common divisor (GCD) and coefficients $x, y$ such that $a x + b y = "gcd"(a, b)$.
  #proof[
    The algorithm proceeds by successive divisions: $r_(i-2) = q_i r_(i-1) + r_i$.
    Since $N(r_i)$ is a strictly decreasing sequence of non-negative integers, it must terminate with $r_k = 0$. The last non-zero remainder $r_(k-1)$ divides all previous remainders and linear combinations, so it is the GCD. Back-substitution yields $x, y$.
  ]
]

#example[
  *Key Generation*:
  - *RSA Key Generation*: The EEA is used to compute the modular multiplicative inverse of the public exponent $e$ to find the private key $d$ ($e d equiv 1 (mod phi(n))$).
  - *Determining Inverses*: In any finite field, finding inverses is done via the Euclidean algorithm.
]

=== Solved Problems

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

=== Supplementary Problems

#supplementary[
  Using the Euclidean Algorithm, find $"gcd"(123, 456)$.
]

#supplementary[
  In $ZZ[i]$, divide $11+3i$ by $1+i$ to find a quotient and remainder.
]
