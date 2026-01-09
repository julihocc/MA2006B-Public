#import "../../utils.typ": solution, proof, definition, theorem, proposition, corollary, example, solution
== Euclidean Rings

=== Theory
#definition(title: "Euclidean Domain")[
  A *Euclidean Domain* (or Euclidean Ring) is an integral domain $R$ equipped with a Euclidean value function (or norm) $N: R without {0} arrow NN$ allowing a division algorithm.
  For any $a, b in R$ with $b eq.not 0$, there exist $q, r in R$ such that:
  $ a = b q + r $
  where either $r = 0$ or $N(r) < N(b)$.
]

=== Examples
#example[
  $ZZ$ is a Euclidean domain with $N(a) = |a|$.
  Example: $a=23, b=5$.
  $23 = 5(4) + 3$. Here $q=4, r=3$, and $|3| < |5|$.
]

#theorem("Extended Euclidean Algorithm (EEA)")[
  The Extended Euclidean Algorithm (EEA) finds the greatest common divisor (GCD) and coefficients $x, y$ such that $a x + b y = "gcd"(a, b)$.
  #proof[
    The algorithm proceeds by successive divisions: $r_(i-2) = q_i r_(i-1) + r_i$.
    Since $N(r_i)$ is a strictly decreasing sequence of non-negative integers, it must terminate with $r_k = 0$. The last non-zero remainder $r_(k-1)$ divides all previous remainders and linear combinations, so it is the GCD. Back-substitution yields $x, y$.
  ]
]

#example[
  *key Generation*:
  - *RSA Key Generation*: The EEA is used to compute the modular multiplicative inverse of the public exponent $e$ to find the private key $d$ ($e d equiv 1 (mod phi(n))$).
  - *Determining Inverses*: In any finite field, finding inverses is done via the Euclidean algorithm.
]

=== Exercises
+ Use the Extended Euclidean Algorithm to find the inverse of $17$ modulo $26$.
#solution[
  We want $17x equiv 1 (mod 26)$.
  $26 = 1(17) + 9$
  $17 = 1(9) + 8$
  $9 = 1(8) + 1$
  Back substitute:
  $1 = 9 - 8$
  $1 = 9 - (17 - 9) = 2(9) - 17$
  $1 = 2(26 - 17) - 17 = 2(26) - 3(17)$
  So $-3(17) equiv 1 (mod 26)$.
  $-3 equiv 23 (mod 26)$. Inverse is 23.
]
+ Prove that the ring of Gaussian Integers $ZZ[i]$ is a Euclidean domain.
#solution[
  Define norm $N(a+b i) = a^2 + b^2$.
  For any $z, w in ZZ[i]$, consider $z/w$ in $CC$. This lies in a unit square of the lattice $ZZ[i]$. The standard Euclidean distance to the nearest lattice point is at most $sqrt(2)/2 < 1$. This implies existence of a remainder with strictly smaller norm.
]
