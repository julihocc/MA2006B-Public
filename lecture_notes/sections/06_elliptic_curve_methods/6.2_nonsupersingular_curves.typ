#import "../../utils.typ": *
== Non-Supersingular Curves
=== Theory

#definition("Supersingular vs. Ordinary")[
  An elliptic curve $E$ over upright("GF")(p) is *supersingular* if $p$ divides the trace of Frobenius $t = p + 1 - \# E$.
  Otherwise, the curve is called *ordinary* (or non-supersingular).

  Equivalently, over upright("GF")(2^n), a curve is supersingular if the coefficient $a_1$ in the generalized Weierstrass equation ($y^2 + x y = x^3 + a_2 x^2 + a_6$) is zero.
]

#theorem("Security Implication")[
  Supersingular curves generally have a small embedding degree $k$ (often $k <= 6$). This makes them vulnerable to the *MOV Attack* (Menezes-Okamoto-Vanstone), which transfers the Discrete Log Problem to a finite field upright("GF")(p^k) where Index Calculus attacks are feasible.
  Therefore, for standard ECDLP security, *ordinary* curves are required.
]
=== Solved Problems

#solved_problem[
  Is the curve $E: y^2 = x^3 + x$ over upright("GF")(3) supersingular?
]
#solution[
  Points over upright("GF")(3) ($0, 1, 2$):
  - $x=0 => y^2=0 => (0,0)$
  - $x=1 => y^2=2$ (No solution, squares in upright("GF")(3) are $0, 1$)
  - $x=2 => y^2=8+2=10=1 => (2,1), (2,2)$
  Total points $N = 3$ (including $O$).
  Trace $t = p + 1 - N = 3 + 1 - 3 = 1$.
  $p=3$ does not divide $t=1$.
  Therefore, the curve is *ordinary* (non-supersingular).
]
=== Self-Evaluation Quiz

#quiz[
  #question(
    [An elliptic curve is supersingular if the characteristic $p$ divides which value?],
    ("The group order", "The trace of Frobenius", "The discriminant", "The extension degree"),
    1,
  )

  #question(
    [Ordinary curves are also known as:],
    ("Singular curves", "Non-supersingular curves", "Anomalous curves", "Supersingular curves of type II"),
    1,
  )

  #question(
    [What is the primary security concern with supersingular curves in ECC?],
    (
      "They have no point at infinity",
      "They have small embedding degrees",
      "They are always singular",
      "They have too many points",
    ),
    1,
  )

  #question(
    [The MOV attack reduces ECDLP to DLP in which structure?],
    ("A subgroup of $E$", "A finite field extension $upright(\"GF\")(q^k)$", "A RSA modulus", "A permutation group"),
    1,
  )

  #question(
    [What embedding degree $k$ is typical for supersingular curves?],
    ("$k <= 6$", "$k > 100$", "k is always prime", "k is infinite"),
    0,
  )
]
=== Supplementary Problems
