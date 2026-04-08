#import "../../utils.typ": *
== Ideals and Quotient Rings

=== Theory
#definition("Ideal")[
  An *ideal* $I$ of a ring $R$ is a subring such that for all $r in R$ and $x in I$, both $r dot x$ and $x dot r$ are in $I$. Ideals "absorb" multiplication by ring elements.
]



#definition("Quotient Ring")[
  Given an ideal $I$, we can form the *quotient ring* $R / I$. The elements of $R / I$ are cosets $a + I$, and operations are defined naturally:
  - $(a + I) + (b + I) = (a + b) + I$
  - $(a + I) dot (b + I) = (a dot b) + I$
]



#proposition("Kernel is an Ideal")[
  The kernel of any ring homomorphism $phi: R arrow S$ is an ideal of $R$.
]

#proof[
  Let $K = ker(phi)$.
  1. *Subgroup*: $K$ is an additive subgroup (standard group theory result).
  2. *Absorption*: Let $r in R, k in K$.
    $phi(r dot k) = phi(r) dot phi(k) = phi(r) dot 0 = 0$.
    $phi(k dot r) = phi(k) dot phi(r) = 0 dot phi(r) = 0$.
    Thus $r dot k in K$ and $k dot r in K$, so $K$ is an ideal.
]



=== Solved Problems

#solved_problem[
  Let $n in ZZ$. Prove formally that $n ZZ = {n k : k in ZZ}$ is an ideal of $ZZ$.
]
#proof[
  We verify the two conditions required by the definition of an ideal.

  *1. $n ZZ$ is an additive subgroup of $ZZ$.*

  - *Non-empty.* Since $n dot 0 = 0$, we have $0 in n ZZ$.

  - *Closed under subtraction.* Let $a, b in n ZZ$. Then $a = n j$ and $b = n k$ for some $j, k in ZZ$. Hence
    $ a - b = n j - n k = n(j - k). $
    Since $j - k in ZZ$, it follows that $a - b in n ZZ$.

  By the subgroup criterion, $n ZZ$ is an additive subgroup of $(ZZ, +)$.

  *2. $n ZZ$ absorbs multiplication by elements of $ZZ$.*

  Let $x in n ZZ$ and $r in ZZ$. Then $x = n k$ for some $k in ZZ$. We compute
  $ r x = r(n k) = n(r k) quad "and" quad x r = (n k) r = n(k r). $
  Since $ZZ$ is closed under multiplication, $r k in ZZ$ and $k r in ZZ$, so both $r x$ and $x r$ belong to $n ZZ$. (Note: because $ZZ$ is commutative, $r x = x r$, so the left and right absorption conditions coincide.)

  *Conclusion.* Since $n ZZ$ is a non-empty additive subgroup of $ZZ$ that is closed under left and right multiplication by any element of $ZZ$, it satisfies the definition of an ideal. Therefore $n ZZ$ is an ideal of $ZZ$. $square$
]

#solved_problem[
  Describe the elements of the quotient ring $ZZ slash 3ZZ$ and identify what it is isomorphic to.
]
#solution[
  Let $R = ZZ$ and $I = 3ZZ$. The elements of the quotient ring $ZZ slash 3ZZ$ are the cosets of $3ZZ$ in $ZZ$. By the Division Algorithm, every integer is congruent modulo 3 to exactly one of $0, 1, 2$, so there are exactly three distinct cosets:
  $ ZZ slash 3ZZ = {0 + 3ZZ,quad 1 + 3ZZ,quad 2 + 3ZZ}. $
  Addition and multiplication of cosets are defined by
  $ (a + 3ZZ) + (b + 3ZZ) = (a + b) + 3ZZ, quad (a + 3ZZ)(b + 3ZZ) = a b + 3ZZ. $
  The map $phi: ZZ slash 3ZZ -> ZZ_3$ defined by $phi(a + 3ZZ) = overline(a)$ is a well-defined ring isomorphism, so $ZZ slash 3ZZ tilde.eq ZZ_3$.
]

#solved_problem[
  Let $R$ be a ring and let $I, J$ be ideals of $R$. Show that the interinterion $I inter J$ is also an ideal of $R$.
]
#proof[
  We verify the two ideal conditions for $I inter J$.

  *1. $I inter J$ is an additive subgroup of $R$.*

  - *Non-empty.* Since $I$ and $J$ are ideals they both contain $0$, so $0 in I inter J$.

  - *Closed under subtraction.* Let $a, b in I inter J$. Then $a, b in I$ and $a, b in J$. Since $I$ is an additive subgroup, $a - b in I$; since $J$ is an additive subgroup, $a - b in J$. Therefore $a - b in I inter J$.

  By the subgroup criterion, $I inter J$ is an additive subgroup of $(R, +)$.

  *2. $I inter J$ absorbs multiplication by elements of $R$.*

  Let $x in I inter J$ and $r in R$. Then $x in I$, and since $I$ is an ideal, $r x in I$ and $x r in I$. Likewise $x in J$, so $r x in J$ and $x r in J$. Therefore $r x in I inter J$ and $x r in I inter J$.

  *Conclusion.* $I inter J$ is a non-empty additive subgroup of $R$ that absorbs multiplication on both sides, so it is an ideal of $R$. $square$
]

#solved_problem[
  Show that the set of even integers $2ZZ$ is an ideal of $ZZ$.
]
#solution[
  1. *Subring Check*:
    - Non-empty: $0 in 2ZZ$.
    - Closed under subtraction: If $2a, 2b in 2ZZ$, then $2a - 2b = 2(a-b) in 2ZZ$.
  2. *Absorption Check*:
    - Let $x in 2ZZ$ (so $x=2k$) and $r in ZZ$.
    - $r x = r(2k) = 2(r k) in 2ZZ$.

  Since it satisfies both conditions (and multiplication is commutative), $2ZZ$ is an ideal.
]

#solved_problem[
  Consider $R = ZZ$ and $I = 5 ZZ$. Describe the quotient ring $ZZ slash I$.
]
#solution[
  The elements of $ZZ slash 5 ZZ$ are the cosets $a + 5ZZ$.
  Two cosets are equal if their representatives differ by a multiple of 5.
  Distinct cosets correspond to the remainders modulo 5:
  $0 + 5ZZ, 1 + 5ZZ, 2 + 5ZZ, 3 + 5ZZ, 4 + 5ZZ$.

  Addition and multiplication exactly mirror arithmetic in $ZZ_5$.
  Thus, $ZZ / 5 ZZ tilde.eq ZZ_5$.
]

#solved_problem[
  In $ZZ[x]$, let $I = chevron.l x^2 + 1 chevron.r$. Describe the elements of $ZZ[x] / I$.
]
#solution[
  Elements of the quotient are polynomials modulo $x^2 + 1$.
  By the Division Algorithm for polynomials, any $f(x) in ZZ[x]$ can be written as:
  $f(x) = q(x)(x^2 + 1) + r(x)$, where $deg(r) < 2$.

  Thus, every coset has a unique representative of the form $a x + b$ where $a, b in ZZ$.
  Multiplication satisfies $x^2 equiv -1$.
  This ring is isomorphic to the Gaussian integers $ZZ[i]$ via the map $a x+b mapsto b i + a$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [An ideal $I$ of a ring $R$ is a subring that absorbs:],
    ("Multiplication", "Addition", "Division", "Inverses"),
    0,
  )

  #question(
    [If $R$ is a commutative ring with unity, the ideal generated by a single element $a$, denoted $chevron.l a chevron.r$, is called:],
    ("Principal Ideal", "Prime Ideal", "Maximal Ideal", "Null Ideal"),
    0,
  )

  #question(
    [Properties of Ideal $I$: Which statement is true?],
    ([$0 in I$], [$1 in I$ is required], [$I$ must be finite], [$I = R$ always]),
    0,
  )

  #question(
    [In the quotient ring $R/I$, the zero element is:],
    ([The ideal $I$ itself], [The element 0], [The element 1], [Undefined]),
    0,
  )

  #question(
    [A generic element of the quotient ring $R/I$ is a:],
    ("Coset", "Vector", "Scalar", "Matrix"),
    0,
  )

  #question(
    [An ideal $M$ is maximal if:],
    ([The only ideal properly containing $M$ is $R$], [It contains all divisors], [It is infinite], [It is principal]),
    0,
  )

  #question(
    [The quotient ring $R/M$ is a field if and only if $M$ is:],
    ("Maximal", "Prime", "Principal", "Zero"),
    0,
  )

  #question(
    [An ideal $P$ is prime if $a b in P$ implies:],
    ([$a in P$ or $b in P$], [$a in P$ and $b in P$], [$a = 0$], [$b = 0$]),
    0,
  )

  #question(
    [The kernel of a ring homomorphism $phi: R arrow S$ is always:],
    ("An ideal of R", "A subring of S", "Isomorphic to S", "Empty"),
    0,
  )

  #question(
    [In $ZZ$, every ideal is:],
    ("Principal", "Maximal", "Prime", "Finite"),
    0,
  )
]

=== Supplementary Problems

#supplementary[
  Let $R$ be a commutative ring with unity. Show that $R$ is a field if and only if its only ideals are $\{0\}$ and $R$ itself.
]

#supplementary[
  Let $I$ be the set of matrices in $M_2(RR)$ with the first column equal to zero. Is $I$ a left ideal, right ideal, or two-sided ideal?
]

#supplementary[
  Find all ideals of the ring $ZZ_{12}$.
]

#supplementary[
  Determine if the ideal $I = chevron.l x^2 + 1 chevron.r$ is prime or maximal in $RR[x]$.
]

#supplementary[
  Let $phi: R arrow S$ be a ring homomorphism. Prove that the image $Im(phi)$ is a subring of $S$.
]

#supplementary[
  In the ring $ZZ$, describe the ideal $I = 4ZZ + 6ZZ$.
]

#supplementary[
  Consider the quotient ring $R = ZZ_2[x] / chevron.l x^2 + x + 1 chevron.r$. List all its elements.
]

#supplementary[
  Show that the interinterion of two ideals $I$ and $J$ is also an ideal.
]

#supplementary[
  Is the set of polynomials with constant term zero, $I = \{f(x) in ZZ[x] : f(0)=0\}$, an ideal of $ZZ[x]$?
]

#supplementary[
  Find a non-trivial ideal in the ring $Z_{10}$.
]

