#import "../../utils.typ": solution, proof, definition, theorem, proposition, corollary, example, solution
== Ideals and Quotient Rings

=== Theory
#definition("Ideal")[
  An *ideal* $I$ of a ring $R$ is a subring such that for all $r in R$ and $x in I$, both $r dot x$ and $x dot r$ are in $I$. Ideals "absorb" multiplication by ring elements.
]

#definition("Quotient Ring")[
  Given an ideal $I$, we can form the *quotient ring* $R slash I$. The elements of $R slash I$ are cosets $a + I$, and operations are defined naturally:
  - $(a + I) + (b + I) = (a + b) + I$
  - $(a + I) dot (b + I) = (a dot b) + I$
]

#proposition("Kernel is an Ideal")[
  The kernel of any ring homomorphism $phi: R arrow S$ is an ideal of $R$.
  #proof[
    Let $K = ker(phi)$.
    1. *Subgroup*: $K$ is an additive subgroup (standard group theory result).
    2. *Absorption*: Let $r in R, k in K$.
      $phi(r dot k) = phi(r) dot phi(k) = phi(r) dot 0 = 0$.
      $phi(k dot r) = phi(k) dot phi(r) = 0 dot phi(r) = 0$.
      Thus $r dot k in K$ and $k dot r in K$, so $K$ is an ideal.
  ]
]

=== Examples
#example[
  Consider $R = ZZ$ and $I = n ZZ$ (multiples of $n$).
  $I$ is an ideal. The quotient ring $ZZ slash n ZZ$ is isomorphic to $ZZ_n$.
  Calculation in $ZZ slash 5 ZZ$ is just arithmetic modulo 5.
]

#example[
  *AES S-Box*: Quotient rings are fundamental in constructing finite fields consisting of polynomial bases, e.g., $"GF"(2^8) tilde.eq ZZ_2[x] slash P(x)$ where $P(x)$ is an irreducible polynomial. This structure is the basis for the AES S-box.
]

=== Exercises
+ Show that the set of even integers $2ZZ$ is an ideal of $ZZ$.
#solution[
  Let $x in 2ZZ$. Then $x = 2k$ for some $k$.
  For any $r in ZZ$, $r dot x = r(2k) = 2(r k) in 2ZZ$.
  Thus, it absorbs multiplication and is an ideal.
]
+ In $ZZ_[x]$, let $I = angle.l x^2 + 1 angle.r$. Describe the elements of $ZZ_[x] slash I$.
#solution[
  Elements of the quotient are polynomials modulo $x^2 + 1$.
  Any polynomial $f(x)$ can be written as $q(x)(x^2 + 1) + r(x)$ where $deg(r) < 2$.
  So elements are of the form $a x + b$ with $a, b in ZZ$.
  (This is isomorphic to the Gaussian integers $ZZ[i]$).
]
