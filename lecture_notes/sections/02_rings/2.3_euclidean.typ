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

#theorem("Bézout's Identity")[
  For any elements $a, b$ in a Euclidean Domain $R$, there exist coefficients $x, y in R$ such that:
  $ a x + b y = "gcd"(a, b) $
]

#proof[
  We prove this constructively using the remainders from the Euclidean Algorithm.
  Notice that the initial elements can be trivially written as linear combinations of $a$ and $b$:
  $ r_0 &= a = 1 dot a + 0 dot b \
    r_1 &= b = 0 dot a + 1 dot b $
  From the division algorithm step $r_(i-1) = r_i q_i + r_(i+1)$, we can express the next remainder as $r_(i+1) = r_(i-1) - r_i q_i$.
  If $r_(i-1)$ and $r_i$ can be written as linear combinations of $a$ and $b$, then $r_(i+1)$ can also be written as a linear combination. By induction, since the sequence terminates at the GCD ($r_k$), the GCD can be written as $a x + b y$.
]

#algorithm("Extended Euclidean Algorithm (EEA)")[
  To systematically find the GCD and coefficients $x, y$:
  1. Initialize $x_0 = 1, y_0 = 0$ and $x_1 = 0, y_1 = 1$. Let $r_0 = a, r_1 = b$.
  2. For $i >= 1$, apply the division algorithm: $r_(i-1) = r_i q_i + r_(i+1)$.
  3. If $r_(i+1) = 0$, stop. The GCD is $r_i$, and the coefficients are $x = x_i, y = y_i$.
  4. Otherwise, update the coefficients:
     $ x_(i+1) &= x_(i-1) - q_i x_i \
       y_(i+1) &= y_(i-1) - q_i y_i $
  5. Increment $i$ and repeat from step 2.
]



=== Solved Problems

#solved_problem[
  Use the Extended Euclidean Algorithm to find the greatest common divisor of $252$ and $198$, and express it as a linear combination $252x + 198y$.
]
#solution[
  In the Euclidean domain $ZZ$, the norm is defined as the absolute value: $N(a) = |a|$.
  We systematically apply the division step $r_(i-1) = r_i q_i + r_(i+1)$ and track the coefficients for Bézout's Identity using the update rules $x_(i+1) = x_(i-1) - q_i x_i$ and $y_(i+1) = y_(i-1) - q_i y_i$.

  #align(center)[
    #table(
      columns: 5,
      align: center,
      [$i$], [$r_i$], [$q_i$], [$x_i$], [$y_i$],
      [0], [252], [-], [1], [0],
      [1], [198], [1], [0], [1],
      [2], [54], [3], [1], [-1],
      [3], [36], [1], [-3], [4],
      [4], [18], [2], [4], [-5],
      [5], [0], [-], [-], [-]
    )
  ]
  The algorithm terminates when $r_5 = 0$. The last non-zero remainder is $r_4 = 18$, so $"gcd"(252, 198) = 18$.
  The coefficients are $x = 4$ and $y = -5$.
  Check: $252(4) + 198(-5) = 1008 - 990 = 18$.
]

#solved_problem[
  Find the greatest common divisor of the polynomials $f(x) = x^4 + x^2 + 1$ and $g(x) = x^3 - 1$ in $QQ[x]$ using the Euclidean Algorithm.
]
#solution[
  In the Euclidean domain $QQ[x]$, the norm is defined as the polynomial degree: $N(p) = deg(p)$.
  We perform polynomial long division successively:
  1. Divide $x^4 + x^2 + 1$ by $x^3 - 1$:
    $ x^4 + x^2 + 1 = x(x^3 - 1) + (x^2 + x + 1) $
    The quotient is $x$ and the remainder is $x^2 + x + 1$.
  2. Divide $x^3 - 1$ by $x^2 + x + 1$:
    $ x^3 - 1 = (x - 1)(x^2 + x + 1) + 0 $
    The quotient is $x - 1$ and the remainder is $0$.

  Since the remainder is $0$, the algorithm terminates. The greatest common divisor is the last non-zero remainder, which is $x^2 + x + 1$.
]

#solved_problem[
  Use the tabular Extended Euclidean Algorithm to find the multiplicative inverse of $17$ modulo $26$.
]
#solution[
  Working in $ZZ$ where the norm is $N(a) = |a|$, we seek $y$ such that $17y equiv 1 (mod 26)$. This is equivalent to finding integers $x, y$ satisfying $26x + 17y = 1$. Let $a = 26, b = 17$:

  #align(center)[
    #table(
      columns: 5,
      align: center,
      [$i$], [$r_i$], [$q_i$], [$x_i$], [$y_i$],
      [0], [26], [-], [1], [0],
      [1], [17], [1], [0], [1],
      [2], [9],  [1], [1], [-1],
      [3], [8],  [1], [-1], [2],
      [4], [1],  [8], [2], [-3],
      [5], [0],  [-], [-], [-]
    )
  ]
  From the algorithm, $26(2) + 17(-3) = 1$.
  Evaluating modulo 26, we get $17(-3) equiv 1$.
  The negative inverse $-3$ is equivalent to $-3 + 26 = 23$.
  Thus, the inverse of $17$ modulo $26$ is $23$.
]

#solved_problem[
  In the Euclidean Domain of Gaussian Integers $ZZ[i]$, find the quotient and remainder when dividing $7+2i$ by $2-i$.
]
#solution[
  In the Euclidean domain $ZZ[i]$, the norm is defined as $N(a+b i) = a^2 + b^2$.
  We aim to find $q, r in ZZ[i]$ such that $7+2i = (2-i)q + r$ with $N(r) < N(2-i) = 5$.
  First, perform normal complex division to find the exact value of $z/w$:
  $ (7+2i)/(2-i) = ((7+2i)(2+i)) / (2^2 + 1^2) = (14 + 7i + 4i - 2) / 5 = (12+11i) / 5 = 2.4 + 2.2i $

  Next, find the closest Gaussian integer $q$ by rounding the real and imaginary parts to the nearest integers:
  $ q = 2 + 2i $

  Finally, compute the remainder $r = (7+2i) - (2-i)q$:
  $ r = (7+2i) - (2-i)(2+2i) = (7+2i) - (4 + 4i - 2i + 2) = (7+2i) - (6+2i) = 1 $

  Check the Euclidean condition: $N(r) = N(1) = 1$. Since $1 < 5$, the condition is satisfied.
  The quotient is $2+2i$ and the remainder is $1$.
]

#solved_problem[
  In the ring $ZZ[sqrt(2)]$ with norm $N(a + b sqrt(2)) = |a^2 - 2b^2|$, determine whether the element $3 + 2sqrt(2)$ is a unit.
]
#solution[
  In the Euclidean domain $ZZ[sqrt(2)]$, the norm is defined as $N(a + b sqrt(2)) = |a^2 - 2b^2|$. An element $u$ is a unit if and only if $N(u) = N(1) = 1$.

  Compute the norm of $3 + 2sqrt(2)$:
  $ N(3 + 2sqrt(2)) = |3^2 - 2(2^2)| = |9 - 8| = 1 $

  Since $N(3 + 2sqrt(2)) = 1$, the element $3 + 2sqrt(2)$ is indeed a unit.
  Its inverse can be found by multiplying by the conjugate:
  $ (3 + 2sqrt(2))(3 - 2sqrt(2)) = 9 - 8 = 1 $
  Thus $(3 + 2sqrt(2))^(-1) = 3 - 2sqrt(2)$.
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
  Solve the linear congruence $12x equiv 6 (mod 21)$. (_Hint_: First verify that $"gcd"(12, 21)$ divides 6, then use the EEA to reduce the congruence to a simpler equivalent.)
]
