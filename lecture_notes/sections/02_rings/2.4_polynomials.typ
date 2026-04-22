#import "../../utils.typ": *
== Polynomial Rings

=== Theory

We begin by formalizing the structure of polynomials over a ring.

#definition("Polynomial Ring")[
  Let $R$ be a commutative ring. A *polynomial* in the indeterminate $x$ with coefficients in $R$ is a formal sum
  $ f(x) = a_n x^n + a_(n-1) x^(n-1) + dots + a_1 x + a_0 $
  where $a_i in R$ and $n >= 0$ is an integer. The set of all such polynomials forms the *Polynomial Ring*, denoted $R[x]$, under the standard operations of polynomial addition and multiplication.
]

The element $a_n$ is called the *leading coefficient*. If $a_n != 0$, we say that the polynomial has *degree* $n$, denoted $deg(f) = n$. The polynomial where all coefficients are zero is called the *zero polynomial* and its degree is typically defined as $-infinity$.

#proposition("Degree in Integral Domains")[
  If $R$ is an integral domain, and $f, g in R[x]$ are non-zero polynomials, then:
  $ deg(f g) = deg(f) + deg(g) $
]
#proof[
  Let $f(x) = a_n x^n + dots + a_0$ with $a_n != 0$ and $g(x) = b_m x^m + dots + b_0$ with $b_m != 0$. 
  
  The highest degree term of $f(x)g(x)$ is $a_n b_m x^(n+m)$. 
  
  Since $R$ is an integral domain and $a_n, b_m != 0$, their product $a_n b_m != 0$. 
  
  Thus, $deg(f g) = n + m$.
]

When the coefficients are taken from a field rather than just a ring, the polynomial ring gains a division structure similar to the integers.

#theorem("Polynomial Division Algorithm")[
  Let $F$ be a field and let $f(x), g(x) in F[x]$ with $g(x)$ not the zero polynomial. Then there exist unique polynomials $q(x), r(x) in F[x]$ such that
  $ f(x) = q(x)g(x) + r(x) $
  where either $r(x) = 0$ or $deg(r) < deg(g)$.
]
#proof[
  *(Existence)*: If $f=0$ or $deg(f) < deg(g)$, we set $q=0$ and $r=f$. 
  
  Otherwise, let $deg(f)=n >= m=deg(g)$. Let $f(x) = a_n x^n + dots$ and $g(x) = b_m x^m + dots$. Since $F$ is a field, $b_m$ is invertible. 
  
  Construct $f_1(x) = f(x) - (a_n b_m^(-1) x^(n-m)) g(x)$. The leading term of $f$ is cancelled, so $deg(f_1) < deg(f)$. 
  
  By induction on the degree, $f_1(x) = q_1(x)g(x) + r(x)$ with $deg(r) < deg(g)$ or $r=0$. Substituting back yields the desired $q$ and $r$.
  
  *(Uniqueness)*: If $f = q_1 g + r_1 = q_2 g + r_2$, then $(q_1 - q_2)g = r_2 - r_1$. 
  
  If $q_1 != q_2$, the degree of the left side is at least $deg(g)$, but the degree of the right side is strictly less than $deg(g)$. 
  
  This is a contradiction, so $q_1 = q_2$ and $r_1 = r_2$.
]

#theorem("Remainder Theorem")[
  Let $F$ be a field, $f(x) in F[x]$, and $alpha in F$. The remainder when $f(x)$ is divided by $(x - alpha)$ is $f(alpha)$.
]
#proof[
  By the Division Algorithm, $f(x) = q(x)(x - alpha) + r(x)$. 
  
  Since $deg(x - alpha) = 1$, the remainder $r(x)$ must have degree 0 or be the zero polynomial; in either case, $r(x)$ is a constant $r in F$. 
  
  Evaluating at $x = alpha$ gives $f(alpha) = q(alpha)(alpha - alpha) + r = r$.
]

#theorem("Factor Theorem")[
  Let $F$ be a field, $f(x) in F[x]$, and $alpha in F$. Then $alpha$ is a root of $f$ (i.e., $f(alpha) = 0$) if and only if $(x - alpha)$ is a factor of $f(x)$.
]
#proof[
  By the Remainder Theorem, $f(x) = q(x)(x - alpha) + f(alpha)$. 
  
  If $f(alpha) = 0$, then $f(x) = q(x)(x - alpha)$, meaning $(x - alpha)$ is a factor. 
  
  Conversely, if $(x - alpha)$ is a factor, then $f(x) = q(x)(x - alpha)$, so evaluating at $alpha$ yields $f(alpha) = 0$.
]

Just as integers can be factored into primes, polynomials can be factored into irreducible components.

#definition("Irreducible Polynomial")[
  A non-constant polynomial $P(x) in F[x]$ is *irreducible* over a field $F$ if it cannot be factored into two polynomials in $F[x]$ of strictly smaller degrees. That is, if $P(x) = a(x)b(x)$, then either $deg(a) = 0$ or $deg(b) = 0$.
]

#example[
  Over $RR$, the polynomial $x^2 + 1$ is irreducible because it has no real roots. However, over $CC$, it is reducible since $x^2 + 1 = (x - i)(x + i)$.
]

To test for irreducibility over the rational numbers, we can use Eisenstein's Criterion.

#theorem("Eisenstein's Criterion")[
  Let $f(x) = a_n x^n + a_(n-1) x^(n-1) + dots + a_0 in ZZ[x]$. If there exists a prime number $p$ such that:
  1. $p$ does not divide $a_n$,
  2. $p$ divides $a_i$ for all $0 <= i < n$,
  3. $p^2$ does not divide $a_0$,
  then $f(x)$ is irreducible over $QQ$.
]
#proof[
  Assume for contradiction that $f(x)$ is reducible, so $f(x) = g(x)h(x)$ with non-constant polynomials $g, h in ZZ[x]$. Let $g(x) = b_r x^r + dots + b_0$ and $h(x) = c_s x^s + dots + c_0$.
  
  Since $a_0 = b_0 c_0$, and $p | a_0$ but $p^2 \nmid a_0$, $p$ must divide exactly one of $b_0$ or $c_0$. Assume $p | b_0$ and $p \nmid c_0$.
  
  Not all coefficients of $g$ are divisible by $p$ (since $p \nmid a_n = b_r c_s$, so $p \nmid b_r$). Let $b_k$ be the first coefficient of $g$ not divisible by $p$.
  
  The coefficient $a_k = b_k c_0 + b_(k-1) c_1 + dots + b_0 c_k$. 
  
  By assumption, $p | a_k$. Also, $p$ divides all terms after $b_k c_0$ because $p$ divides $b_0, dots, b_(k-1)$. Therefore, $p$ must divide $b_k c_0$.
  
  Since $p$ is prime, either $p | b_k$ or $p | c_0$, both of which are false. This contradiction shows $f(x)$ must be irreducible.
]

Irreducible polynomials allow us to construct new fields, much like prime numbers create finite fields $ZZ_p$.

#theorem("Finite Field Construction")[
  Let $P(x) in ZZ_p[x]$ be an irreducible polynomial of degree $n$, where $p$ is prime. The quotient ring $F = ZZ_p[x] slash (P(x))$ forms a finite field of order $p^n$, denoted $"GF"(p^n)$.
]
#proof[
  Because $ZZ_p$ is a field, $ZZ_p[x]$ is a Euclidean Domain (due to the Division Algorithm), meaning we can use the Extended Euclidean Algorithm (EEA).
  
  To show $F$ is a field, let $f(x) in F$ be non-zero. This means $P(x)$ does not divide $f(x)$.
  
  Since $P(x)$ is irreducible, its only divisors are units and multiples of itself. Thus, $gcd(f, P) = 1$.
  
  By the EEA, there exist polynomials $a(x), b(x) in ZZ_p[x]$ such that $a(x) f(x) + b(x) P(x) = 1$.
  
  Taking this equation modulo $P(x)$, we obtain $a(x) f(x) equiv 1 mod P(x)$.
  
  Therefore, $a(x)$ is the multiplicative inverse of $f(x)$. Since every non-zero element has an inverse, $F$ is a field.
]

=== Solved Problems

#solved_problem[
  Identify two polynomial rings with different coefficient systems and state how their arithmetic differs.
]
#solution[
  Consider the polynomial rings $ZZ[x]$ and $RR[x]$. 
  In $ZZ[x]$, the coefficients are restricted to integers. Arithmetic relies entirely on integer operations; thus, division is not always possible (e.g., $1/2 x$ is not in $ZZ[x]$), making $ZZ[x]$ an integral domain but not a Principal Ideal Domain.
  In $RR[x]$, coefficients are real numbers. Because $RR$ is a field, we can perform polynomial long division without leaving the set of coefficients, meaning every ideal in $RR[x]$ is generated by a single polynomial, making $RR[x]$ a Principal Ideal Domain (PID).
]

#solved_problem[
  Perform polynomial long division to divide $f(x) = x^3 + x^2 + 2x + 1$ by $g(x) = x - 1$ in $RR[x]$, and verify the Remainder Theorem.
]
#solution[
  We apply polynomial long division step-by-step:
  1. Divide leading terms: $x^3 / x = x^2$. We multiply $x^2(x - 1) = x^3 - x^2$ and subtract from $f$: 
     $(x^3 + x^2 + 2x + 1) - (x^3 - x^2) = 2x^2 + 2x + 1$.
  2. Divide leading terms: $2x^2 / x = 2x$. We multiply $2x(x - 1) = 2x^2 - 2x$ and subtract:
     $(2x^2 + 2x + 1) - (2x^2 - 2x) = 4x + 1$.
  3. Divide leading terms: $4x / x = 4$. We multiply $4(x - 1) = 4x - 4$ and subtract:
     $(4x + 1) - (4x - 4) = 5$.

  Thus, the quotient is $q(x) = x^2 + 2x + 4$ and the remainder is $r(x) = 5$.
  To verify the Remainder Theorem, we evaluate $f(1)$:
  $f(1) = 1^3 + 1^2 + 2(1) + 1 = 1 + 1 + 2 + 1 = 5$. This matches our computed remainder.
]

#solved_problem[
  Determine whether $x^2 + 1$ is reducible over $RR$, $CC$, and $ZZ_2$.
]
#solution[
  A quadratic polynomial is reducible over a field if and only if it has a root in that field.
  - *Over $RR$*: The equation $x^2 + 1 = 0$ implies $x^2 = -1$, which has no real solutions. Thus, it is irreducible.
  - *Over $CC$*: The roots are $x = i$ and $x = -i$. Therefore, it factors as $x^2 + 1 = (x-i)(x+i)$ and is reducible.
  - *Over $ZZ_2$*: We test the elements of the field $\{0, 1\}$:
    $f(0) = 0^2 + 1 = 1 != 0$
    $f(1) = 1^2 + 1 = 2 equiv 0 mod 2$
    Since $1$ is a root, $(x-1)$ (which is equivalent to $x+1$ in $ZZ_2$) is a factor. In fact, $x^2 + 1 = (x+1)^2$ over $ZZ_2$, making it reducible.
]

#solved_problem[
  Use Eisenstein's Criterion to prove that $f(x) = x^4 + 6x^3 - 12x^2 + 30x - 24$ is irreducible over $QQ$.
]
#solution[
  We examine the coefficients: $a_4 = 1$, $a_3 = 6$, $a_2 = -12$, $a_1 = 30$, $a_0 = -24$.
  We need to find a prime $p$ such that $p \nmid a_4$, $p | a_i$ for $i < 4$, and $p^2 \nmid a_0$.
  Let's test primes that divide $a_0 = -24$. The prime factors are 2 and 3.
  - Test $p = 2$: It divides $6, -12, 30$, and $-24$. It does not divide $a_4 = 1$. However, $p^2 = 4$, and $4 | -24$. So $p=2$ fails the third condition.
  - Test $p = 3$: It does not divide $a_4=1$. It divides $a_3=6$, $a_2=-12$, $a_1=30$, and $a_0=-24$. Furthermore, $p^2 = 9$, and $9 \nmid -24$.
  Since $p=3$ satisfies all three conditions of Eisenstein's Criterion, $f(x)$ is irreducible over $QQ$.
]

#solved_problem[
  State the finite-field models used by AES and ECC and identify their defining polynomial or modulus.
]
#solution[
  Finite fields form the mathematical foundation for many modern cryptographic systems.
  - *AES (Advanced Encryption Standard)* uses arithmetic in the binary extension field $"GF"(2^8)$. Bytes are represented as polynomials of degree at most 7 with coefficients in $ZZ_2$. The field is constructed using the irreducible polynomial $P(x) = x^8 + x^4 + x^3 + x + 1$.
  - *ECC (Elliptic Curve Cryptography)* relies on arithmetic over finite fields, typically either prime fields $"GF"(p)$ (where $p$ is a large prime) or binary fields $"GF"(2^m)$. In the binary case, a specific irreducible polynomial of degree $m$ over $ZZ_2$ is chosen as the modulus.
]

#solved_problem[
  Compute $f(x) + g(x)$ and $f(x) g(x)$ in $ZZ_2[x]$ for $f(x) = x^2 + x + 1$ and $g(x) = x + 1$.
]
#solution[
  All coefficients are reduced modulo 2. Recall that in $ZZ_2$, $1 + 1 = 0$, which also implies addition is equivalent to subtraction.
  
  *Addition:*
  $ f(x) + g(x) = (x^2 + x + 1) + (x + 1) = x^2 + (x + x) + (1 + 1) $
  Since $x + x = 2x equiv 0x$ and $1 + 1 = 2 equiv 0$, we have:
  $ f(x) + g(x) = x^2 $
  
  *Multiplication:*
  $ f(x) g(x) = (x^2 + x + 1)(x + 1) $
  We distribute the terms:
  $ = x^2(x) + x^2(1) + x(x) + x(1) + 1(x) + 1(1) $
  $ = x^3 + x^2 + x^2 + x + x + 1 $
  Pairing up the like terms:
  $ = x^3 + (1+1)x^2 + (1+1)x + 1 $
  Since $1+1 equiv 0$ mod 2:
  $ f(x) g(x) = x^3 + 1 $
]

#solved_problem[
  Factor $x^2 - 1$ in $ZZ_5[x]$ using modular arithmetic.
]
#solution[
  Using the standard difference of squares identity, we know:
  $ x^2 - 1 = (x - 1)(x + 1) $
  In $ZZ_5[x]$, we often prefer to express coefficients as positive residues $\{0, 1, 2, 3, 4\}$. 
  Since $-1 equiv 4 mod 5$, we can rewrite the factorization as:
  $ x^2 - 1 = (x + 4)(x + 1) $
  This is the complete factorization of the polynomial over $ZZ_5$.
]

#solved_problem[
  Test the irreducibility of $x^3 + x + 1$ in $ZZ_2[x]$.
]
#solution[
  For a polynomial of degree 2 or 3 over a field, it is reducible if and only if it has a root in that field. (If it factors, at least one of the factors must be linear).
  
  We evaluate $f(x) = x^3 + x + 1$ for all elements in $ZZ_2 = \{0, 1\}$:
  - $f(0) = 0^3 + 0 + 1 = 1 != 0$
  - $f(1) = 1^3 + 1 + 1 = 3 equiv 1 != 0$
  
  Since there are no roots in $ZZ_2$, there are no linear factors. Consequently, $x^3 + x + 1$ is irreducible over $ZZ_2$.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [A polynomial ring $R[x]$ consists of polynomials with coefficients in a:],
    ("Ring R", "Field F", "Group G", "Vector Space V"),
    0,
  )

  #question(
    [The degree of the zero polynomial is typically defined as:],
    ("0", "1", "-1 or -infinity", "Undefined"),
    2,
  )

  #question(
    [If $R$ is an integral domain, then $deg(f dot g) =$ :],
    ([$deg(f) + deg(g)$], [$deg(f) dot deg(g)$], [$max(deg(f), deg(g))$], [$deg(f) - deg(g)$]),
    0,
  )

  #question(
    [A polynomial $P(x)$ is irreducible over a field $F$ if it cannot be factored into two polynomials of:],
    ("Lower degree", "Same degree", "Higher degree", "Zero degree"),
    0,
  )

  #question(
    [Over $RR$, the polynomial $x^2 + 1$ is:],
    ("Irreducible", "Reducible", "Linear", "Zero"),
    0,
  )

  #question(
    [Finite fields of order $p^n$, denoted $"GF"(p^n)$, are constructed using an irreducible polynomial of degree:],
    ("n", "p", "p^n", "1"),
    0,
  )

  #question(
    [The number of elements in the quotient ring $(ZZ_(p))[x] slash (P(x))$ where $deg(P)=n$ is:],
    ([$p^n$], [$p$], [$n$], [$p n$]),
    0,
  )

  #question(
    [If $f(alpha) = 0$, then which term divides $f(x)$?],
    ([$x - alpha$], [$x + alpha$], [$alpha$], [$f(alpha)$]),
    0,
  )

  #question(
    [AES encryption uses arithmetic in which finite field?],
    ([$"GF"(2^8)$], [$"GF"(2)$], [$"GF"(128)$], [$ZZ_{256}$]),
    0,
  )

  #question(
    [Eisenstein's Criterion is a test for:],
    ("Irreducibility", "Reducibility", "Linearity", "Continuity"),
    0,
  )
]

=== Supplementary Problems

#supplementary[
  List all irreducible polynomials of degree 2 in $(ZZ_(2))[x]$.
]

#supplementary[
  Construct the multiplication table for the field $"GF"(4)$ constructed as $(ZZ_(2))[x] slash (x^2+x+1)$.
]

#supplementary[
  Factor $x^4 - 1$ over $ZZ_(5)$.
]

#supplementary[
  Determine if $x^3 + 2x + 1$ is irreducible over $ZZ_(3)$.
]

#supplementary[
  Find the inverse of $x+1$ in the field $"GF"(2^3)$ defined by modulus $x^3+x+1$.
]

#supplementary[
  Compute $(x^2+1)(x+1)$ in $"GF"(2^4)$ with irreducible polynomial $x^4+x+1$.
]

#supplementary[
  Show that $x^4+1$ is reducible over $ZZ_2$.
]

#supplementary[
  Use the Remainder Theorem to find the remainder when $x^3 + 2x^2 + 2$ is divided by $x-1$ in $(ZZ_(3))[x]$.
]

#supplementary[
  Find a polynomial $f(x) in (ZZ_(5))[x]$ of degree 2 that has roots $1$ and $3$.
]

#supplementary[
  Prove that if $F$ is a field, then $F[x]$ is a Principal Ideal Domain.
]
