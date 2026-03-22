#import "../../utils.typ": *
== Quadratic Residues

=== Theory

#definition("Quadratic Residue")[
  Let $p$ be an odd prime and $a in ZZ$ with $gcd(a, p) = 1$. We say $a$ is a *quadratic residue* modulo $p$ (written $a in QR_p$) if there exists $x in ZZ$ such that $x^2 equiv a space (mod p)$.

  If no such $x$ exists, $a$ is called a *quadratic non-residue* (written $a in QNR_p$).
]

#theorem[
  Among the $p-1$ non-zero elements of $ZZ_p$, exactly $(p-1)/2$ are quadratic residues and $(p-1)/2$ are quadratic non-residues.
]

#definition("Legendre Symbol")[
  The *Legendre symbol* $\( a/p \)$ for an odd prime $p$ and $gcd(a,p)=1$ is defined as:
  $
    \( a / p \) = cases(
      1 & "if" a in QR_p,
      -1 & "if" a in QNR_p,
      0 & "if" p divides a
    )
  $
]

#theorem("Euler's Criterion")[
  For an odd prime $p$ and $gcd(a, p) = 1$:
  $ \( a / p \) equiv a^{(p-1)/2} space (mod p) $
  That is, $a$ is a quadratic residue iff $a^{(p-1)/2} equiv 1 space (mod p)$.
]

#note[
  Euler's criterion provides an efficient way to check whether a number is a quadratic residue: simply compute $a^{(p-1)/2} mod p$ using fast modular exponentiation.
]

#corollary("Square Root of a QR")[
  If $p equiv 3 space (mod 4)$ and $a in QR_p$, then the square roots of $a$ modulo $p$ are:
  $ x equiv plus.minus a^{(p+1)/4} space (mod p) $
  This is used in elliptic curve point decompression.
]

#note[
  *ECC connection*: When working over $FF_p$, determining whether $r = x^3 + ax + b$ has a square root (i.e., whether there is a point $(x, y)$ on the curve) requires checking if $r$ is a quadratic residue mod $p$. This is fundamental to point enumeration and point decompression in compressed ECC public keys.
]

=== Solved Problems

#solved_problem[
  Find all quadratic residues modulo 7.
]
#solution[
  Compute squares mod 7: $1^2=1, 2^2=4, 3^2=2, 4^2=2, 5^2=4, 6^2=1$.
  The distinct values are $QR_7 = {1, 2, 4}$, and $QNR_7 = {3, 5, 6}$.
  There are $(7-1)/2 = 3$ residues and 3 non-residues, confirming the theorem.
]

#solved_problem[
  Determine whether $a = 6$ is a quadratic residue modulo $p = 11$ using Euler's criterion.
]
#solution[
  Compute $a^{(p-1)/2} = 6^5 mod 11$:
  $6^2 = 36 equiv 3$; $6^4 equiv 9$; $6^5 = 6^4 dot 6 equiv 9 dot 6 = 54 equiv 10 equiv -1 space (mod 11)$.
  Since $(-1) not equiv 1$, we have $\( 6/11 \) = -1$, so $6$ is a *quadratic non-residue* mod 11.
]

#solved_problem[
  Find the square root of $a = 4$ modulo $p = 7$ (where $7 equiv 3 space (mod 4)$).
]
#solution[
  Since $7 equiv 3 space (mod 4)$: $x = a^{(p+1)/4} = 4^{(7+1)/4} = 4^2 = 16 equiv 2 space (mod 7)$.
  Check: $2^2 = 4 equiv 4$. ✓ Also $-2 equiv 5 space (mod 7)$: $5^2 = 25 equiv 4$. ✓
  The two square roots are $x = 2$ and $x = 5$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [$a$ is a quadratic residue mod $p$ if there exists $x$ such that:],
    ([$x equiv a space (mod p)$], [$x^2 equiv a space (mod p)$], [$x^p equiv a space (mod p)$], [$x + a equiv 0 space (mod p)$]),
    1,
  )

  #question(
    [Among the $p-1$ non-zero residues mod $p$, how many are quadratic residues?],
    ([$p-1$], [$p/2$], [$(p-1)/2$], [$(p+1)/2$]),
    2,
  )

  #question(
    [Euler's criterion says $a in QR_p$ iff:],
    ([$a^{p-1} equiv 1$], [$a^{(p-1)/2} equiv 1 space (mod p)$], [$a^{(p-1)/2} equiv -1 space (mod p)$], [$a^p equiv a$]),
    1,
  )

  #question(
    [The Legendre symbol $\( a / p \)$ equals $-1$ when:],
    (["$a$ is a quadratic residue mod $p$"], ["$a$ is a quadratic non-residue mod $p$"], ["$p divides a$"], ["$a = 0$"]),
    1,
  )

  #question(
    [$QR_7 = $],
    ([${1, 4, 6}$], [${1, 2, 4}$], [${2, 3, 5}$], [${3, 5, 6}$]),
    1,
  )

  #question(
    [If $p equiv 3 space (mod 4)$, the square root of $a in QR_p$ is:],
    ([$a^{(p-1)/2}$], [$a^{(p+1)/4}$], [$a^{(p-1)/4}$], [$a^{p/2}$]),
    1,
  )

  #question(
    [Quadratic residues are needed in ECC to:],
    (["Compute point doubling"], ["Check if a point $(x, y)$ exists on the curve"], ["Compute the ECDLP"], ["Find the order of a curve"]),
    1,
  )

  #question(
    [$6^5 mod 11$ equals:],
    (["1"], ["10"], ["6"], ["5"]),
    1,
  )

  #question(
    [Is $3$ a quadratic residue modulo 11?],
    (["Yes, $\( 3/11 \) = 1$"], ["No, $\( 3/11 \) = -1$"], ["It depends on the algorithm"], ["Cannot be determined"]),
    1,
  )

  #question(
    [The Legendre symbol is used to check:],
    (["GCD"], ["Whether $a$ is prime"], ["Whether $a$ is a QR mod $p$"], ["Multiplicative order of $a$"]),
    2,
  )
]

=== Supplementary Problems

#supplementary[
  Find all quadratic residues modulo 11 and 13.
]

#supplementary[
  Use Euler's criterion to determine whether $5$ is a quadratic residue mod 13.
]

#supplementary[
  Prove that the product of two quadratic residues is a quadratic residue.
]

#supplementary[
  Prove that the product of a QR and a QNR is a QNR mod $p$.
]

#supplementary[
  Compute the square root of $9$ modulo $p = 19$ (where $19 equiv 3 space (mod 4)$).
]

#supplementary[
  In ECC over $FF_{13}$, for the curve $y^2 = x^3 + x + 6$, use quadratic residue testing to determine which $x$-values yield points on the curve.
]
