#import "../../utils.typ": *
== The Discriminant of a Cubic Polynomial <appendix-cubic-discriminant>

=== Theory

The discriminant is a number computed from the coefficients of a polynomial. Its main purpose is to detect whether the polynomial has a repeated root. This is exactly the condition needed in the elliptic-curve chapter: repeated roots of the cubic $x^3 + a x + b$ correspond to singularities of the curve $y^2 = x^3 + a x + b$.

#note[
  Appendix @appendix-point-at-infinity explains how the affine Weierstrass equation is completed by adding its point at infinity. This appendix addresses the next question: when is that completed cubic non-singular?
]

#definition("Repeated Root")[
  Let $f(x) in RR[x]$ be a polynomial. A number $r in CC$ is a *repeated root* of $f$ if
  $ f(x) = (x-r)^2 g(x) $
  for some polynomial $g(x) in CC[x]$.

  Equivalently, $r$ is a repeated root if
  $ f(r) = 0 quad "and" quad f'(r) = 0. $
]

#note[
  The derivative criterion is often the easiest way to test for repeated roots: a repeated root is a root where the graph touches itself algebraically with multiplicity at least two.
]

#definition("Discriminant via Roots")[
  Let
  $ f(x) = A product_(i=1)^n (x-r_i) $
  be a degree $n$ polynomial with leading coefficient $A != 0$ and roots $r_1, dots, r_n$ in $CC$, counted with multiplicity.

  The *discriminant* of $f$ is
  $ Delta(f) = A^(2n-2) product_(i < j) (r_i - r_j)^2. $
]

#note[
  Because the discriminant contains the factors $(r_i-r_j)^2$, we have
  $ Delta(f) = 0 $
  if and only if $r_i = r_j$ for some $i != j$. Thus the discriminant is zero exactly when the polynomial has a repeated root.
]

#proposition("Discriminant Formula for a Cubic")[
  For a general cubic polynomial
  $ f(x) = A x^3 + B x^2 + C x + D, quad A != 0, $
  the discriminant defined above is given by
  $
    Delta(f)
    = B^2 C^2 - 4 A C^3 - 4 B^3 D - 27 A^2 D^2 + 18 A B C D.
  $
]

#proof[
  Let $r_1,r_2,r_3$ be the roots of $f$ in $CC$, counted with multiplicity. Then
  $ f(x) = A(x-r_1)(x-r_2)(x-r_3). $

  By the root definition of the discriminant,
  $
    Delta(f)
    = A^4 (r_1-r_2)^2 (r_1-r_3)^2 (r_2-r_3)^2.
  $

  Define the elementary symmetric sums
  $
    s_1 = r_1 + r_2 + r_3, quad
    s_2 = r_1 r_2 + r_1 r_3 + r_2 r_3, quad
    s_3 = r_1 r_2 r_3.
  $

  Expanding the product of squared differences and collecting terms in these symmetric sums gives
  $
    (r_1-r_2)^2 (r_1-r_3)^2 (r_2-r_3)^2
    = s_1^2 s_2^2 - 4s_2^3 - 4s_1^3 s_3 - 27s_3^2 + 18s_1 s_2 s_3.
  $

  On the other hand, comparing coefficients in
  $
    A(x-r_1)(x-r_2)(x-r_3)
    = A x^3 + B x^2 + C x + D
  $
  gives Vieta's formulas:
  $
    s_1 = -B/A, quad s_2 = C/A, quad s_3 = -D/A.
  $

  Substituting these into the previous expression and multiplying by $A^4$ gives
  $
    Delta(f)
    = B^2 C^2 - 4 A C^3 - 4 B^3 D - 27 A^2 D^2 + 18 A B C D.
  $
]

#example[
  For $f(x)=x^3-x$, we have $A=1$, $B=0$, $C=-1$, and $D=0$. Hence
  $ Delta(f) = -4(1)(-1)^3 = 4 != 0. $
  Therefore $x^3-x$ has no repeated root.
]

#example[
  For $f(x)=x^3$, we have $A=1$, $B=0$, $C=0$, and $D=0$. Hence
  $ Delta(f)=0. $
  Indeed, $x=0$ is a repeated root because $x^3 = x^2 dot x$.
]

#definition("Depressed Cubic")[
  A cubic polynomial of the form
  $ f(x) = x^3 + p x + q $
  is called a *depressed cubic*. It has no $x^2$ term.
]

#proposition("Reduction to Depressed Form")[
  Let
  $ f(x) = A x^3 + B x^2 + C x + D, quad A != 0, $
  be a cubic polynomial over $RR$. After dividing by $A$ and making the change of variable
  $ x = u - B/(3 A), $
  the equation $f(x)=0$ becomes an equation of the form
  $ u^3 + p u + q = 0, $
  where
  $
    p = (3 A C - B^2)/(3 A^2),
    quad
    q = (2 B^3 - 9 A B C + 27 A^2 D)/(27 A^3).
  $
]

#proof[
  Divide the equation $f(x)=0$ by $A$:
  $ x^3 + alpha x^2 + beta x + gamma = 0, $
  where
  $ alpha = B/A, quad beta = C/A, quad gamma = D/A. $

  Now substitute
  $ x = u - alpha/3. $
  Expanding gives
  $
    (u - alpha/3)^3
    + alpha (u - alpha/3)^2
    + beta (u - alpha/3)
    + gamma
    = u^3 + (beta - alpha^2/3)u + (2 alpha^3/27 - alpha beta/3 + gamma).
  $

  Thus the $u^2$ term has disappeared. Therefore the equation has depressed form
  $ u^3 + p u + q = 0, $
  with
  $ p = beta - alpha^2/3 $
  and
  $ q = 2 alpha^3/27 - alpha beta/3 + gamma. $

  Substituting back $alpha = B/A$, $beta = C/A$, and $gamma = D/A$ gives the stated formulas for $p$ and $q$.
]

#note[
  The change of variable requires division by $3A$. Over $RR$ this is always allowed because $A != 0$ and $3 != 0$. Over a field of characteristic $3$, this reduction is not generally valid.
]

#corollary([Discriminant of $x^3 + p x + q$])[
  The discriminant of
  $ f(x) = x^3 + p x + q $
  is
  $ Delta(f) = -4p^3 - 27q^2. $
]

#proof[
  In the general cubic formula, take
  $ A=1, quad B=0, quad C=p, quad D=q. $
  Then
  $
    Delta(f)
    = 0^2 p^2 - 4(1)p^3 - 4(0)^3 q - 27(1)^2 q^2 + 18(1)(0)p q
    = -4p^3 - 27q^2.
  $
]

#note[
  Therefore
  $ Delta(x^3 + p x + q) = 0 $
  if and only if
  $ 4p^3 + 27q^2 = 0. $
  This is the form that appears in the short Weierstrass equation.
]

#proposition("Why the Elliptic-Curve Formula Appears")[
  For the short Weierstrass equation
  $ y^2 = x^3 + a x + b, $
  the cubic on the right-hand side has discriminant
  $ Delta(x^3 + a x + b) = -4a^3 - 27b^2. $
  Thus the cubic has a repeated root if and only if
  $ 4a^3 + 27b^2 = 0. $
]

#proof[
  This is the depressed cubic formula with $p=a$ and $q=b$:
  $ Delta(x^3 + a x + b) = -4a^3 - 27b^2. $
  Since multiplying by $-1$ does not change whether a number is zero,
  $ -4a^3 - 27b^2 = 0 $
  is equivalent to
  $ 4a^3 + 27b^2 = 0. $
]

#note[
  In elliptic-curve theory, one usually defines the curve discriminant by
  $ Delta_E = -16(4a^3 + 27b^2). $
  The reason for the factor $-16$ is that the discriminant of an elliptic curve is not defined only from the cubic polynomial on the right-hand side. It is defined as an invariant of a Weierstrass equation.

  For the general Weierstrass equation
  $ y^2 + a_1 x y + a_3 y = x^3 + a_2 x^2 + a_4 x + a_6, $
  the discriminant is a specific polynomial in the coefficients that detects exactly when the curve is singular and transforms predictably under allowed changes of Weierstrass coordinates. When this general formula is specialized to the short equation
  $ y^2 = x^3 + a x + b, $
  it becomes
  $ Delta_E = -16(4a^3 + 27b^2). $

  Thus $Delta_E$ is the standard curve discriminant, while
  $ Delta(x^3 + a x + b) = -4a^3 - 27b^2 $
  is the discriminant of the cubic polynomial. They differ by the nonzero factor $16$:
  $ Delta_E = 16 Delta(x^3 + a x + b). $

  For detecting singularity over $RR$, this factor does not affect the nonzero condition. Therefore
  $ Delta_E != 0 quad <==> quad 4a^3 + 27b^2 != 0. $
]

#definition("Singular Point of a Projective Plane Curve")[
  Let $F(X,Y,Z)$ be a homogeneous polynomial. A point $P=[X:Y:Z]$ on the projective curve
  $ F(X,Y,Z)=0 $
  is called *singular* if all first partial derivatives vanish at $P$:
  $ F_X(P)=F_Y(P)=F_Z(P)=0. $

  If no point on the projective curve is singular, the curve is called *non-singular*.
]

#proposition("Projective Meaning of the Discriminant Condition")[
  Let
  $ E: Y^2 Z = X^3 + a X Z^2 + b Z^3 $
  be the projective closure of
  $ y^2 = x^3 + a x + b. $
  Then $E$ is singular if and only if the cubic polynomial
  $ f(x)=x^3+a x+b $
  has a repeated root. Equivalently,
  $ E " is non-singular" quad <==> quad 4a^3 + 27b^2 != 0. $
]

#proof[
  Write the projective equation as
  $ F(X,Y,Z)=Y^2 Z - X^3 - a X Z^2 - b Z^3. $
  Its partial derivatives are
  $
    F_X = -3X^2 - a Z^2, quad
    F_Y = 2Y Z, quad
    F_Z = Y^2 - 2a X Z - 3b Z^2.
  $

  First check the point at infinity. Appendix @appendix-point-at-infinity shows that the only point at infinity on this projective curve is
  $ cal(O)=[0:1:0]. $
  At this point,
  $ F_Z(cal(O)) = 1 != 0, $
  so $cal(O)$ is not singular.

  Therefore any singular point must lie in the affine chart $Z=1$. Write it as $(x,y)$. In affine coordinates the equation is
  $ y^2 = f(x), quad "where" f(x)=x^3+a x+b. $
  Equivalently, consider
  $ G(x,y)=y^2-f(x). $

  An affine singular point must satisfy
  $ G(x,y)=0, quad G_x(x,y)=0, quad G_y(x,y)=0. $
  Since
  $ G_x(x,y)=-(3x^2+a)=-f'(x) $
  and
  $ G_y(x,y)=2y, $
  the singularity conditions become
  $ f(x)=0, quad f'(x)=0, quad y=0. $

  Thus the projective curve is singular exactly when there exists a number $x$ that is both a root of $f$ and a root of $f'$. This is exactly the condition that $f$ has a repeated root.

  By the discriminant criterion proved above, this is equivalent to
  $ Delta(f)=0, $
  and for $f(x)=x^3+a x+b$ this is equivalent to
  $ 4a^3 + 27b^2 = 0. $
]

#note[
  This is the precise connection with Appendix @appendix-point-at-infinity. Projective geometry tells us where the missing point $cal(O)$ comes from; the discriminant tells us whether the completed projective cubic is smooth enough to be an elliptic curve.
]

=== Solved Problems

#solved_problem[
  Compute the discriminant of $f(x)=x^3-3x+2$ and decide whether it has a repeated root.
]
#solution[
  Here $p=-3$ and $q=2$. Using the depressed cubic formula,
  $ Delta(f) = -4(-3)^3 - 27(2)^2 = 108 - 108 = 0. $
  Therefore $f$ has a repeated root. Indeed,
  $ x^3 - 3x + 2 = (x-1)^2(x+2). $
]

#solved_problem[
  Explain why $y^2=x^3-x+1$ is non-singular using the cubic discriminant.
]
#solution[
  The cubic is $f(x)=x^3-x+1$, so $a=-1$ and $b=1$. Then
  $ 4a^3 + 27b^2 = 4(-1)^3 + 27(1)^2 = -4 + 27 = 23 != 0. $
  Hence the cubic has no repeated root, and the corresponding short Weierstrass curve is non-singular.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [The discriminant of a polynomial is zero exactly when the polynomial has:],
    ([No roots], [Only real roots], [A repeated root], [Degree zero]),
    2,
  )

  #question(
    [For $f(x)=x^3+p x+q$, the discriminant is:],
    ([$p^2 - 4q$], [$-4p^3 - 27q^2$], [$4p^3 + 27q^2$], [$p^3 + q^3$]),
    1,
  )

  #question(
    [For $y^2=x^3+a x+b$, the non-singularity condition is:],
    ([$a+b != 0$], [$4a^3 + 27b^2 != 0$], [$a^2 - 4b != 0$], [$b != 0$]),
    1,
  )

  #question(
    [A repeated root $r$ of $f$ satisfies:],
    ([$f(r)=0$ only], [$f'(r)=0$ only], [$f(r)=0$ and $f'(r)=0$], [$r=0$ always]),
    2,
  )

  #question(
    [The factor $-16$ in the elliptic-curve discriminant affects:],
    ([Whether the discriminant is zero], [Only the scaling convention], [The roots of the cubic], [The degree of the polynomial]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Compute the discriminant of $x^3+x+1$ and decide whether it has a repeated root.
]

#supplementary[
  Determine whether $y^2=x^3+3x+2$ is non-singular.
]

#supplementary[
  Show directly, using $f(r)=0$ and $f'(r)=0$, that if $x^3+p x+q$ has a repeated root $r$, then $4p^3+27q^2=0$.
]
