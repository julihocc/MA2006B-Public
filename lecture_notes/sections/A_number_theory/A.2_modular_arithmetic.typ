#import "../../utils.typ": *
== Modular Arithmetic

=== Theory

#definition("Congruence")[
  Let $n > 0$ be an integer (the *modulus*). We say $a$ is *congruent to $b$ modulo $n$*, written $a equiv b space (mod n)$, if $n divides (a - b)$.

  Equivalently, $a$ and $b$ leave the same remainder when divided by $n$.
]

#definition("Residue Classes and $ZZ_n$")[
  The *residue class* $[a]_n = {a + k n : k in ZZ}$ is the set of all integers congruent to $a$ mod $n$. The *ring of integers modulo $n$* is:
  $ ZZ_n = {[0]_n, [1]_n, ..., [n-1]_n} $
  with addition and multiplication defined as $[a] + [b] = [a+b]$ and $[a] dot [b] = [a b]$ (all modulo $n$).
]

#theorem("Fermat's Little Theorem")[
  If $p$ is prime and $gcd(a, p) = 1$, then:
  $ a^{p-1} equiv 1 space (mod p) $
  Equivalently, $a^p equiv a space (mod p)$ for *any* integer $a$.

  *Corollary*: For prime $p$ and $gcd(a, p) = 1$, the modular inverse of $a$ is $a^{p-2} mod p$.
]

#theorem("Euler's Theorem")[
  If $gcd(a, n) = 1$, then:
  $ a^{phi(n)} equiv 1 space (mod n) $
  Fermat's Little Theorem is the special case $n = p$ prime (where $phi(p) = p-1$).
]

#note[
  *RSA connection*: In RSA, encryption is $c equiv m^e space (mod n)$ and decryption is $m equiv c^d space (mod n)$, where $e d equiv 1 space (mod phi(n))$. Euler's theorem guarantees $m^{e d} equiv m^{1 + k phi(n)} equiv m space (mod n)$, making decryption the inverse of encryption.
]

#definition("Chinese Remainder Theorem (CRT)")[
  Let $n_1, n_2, ..., n_k$ be pairwise coprime positive integers. For any integers $a_1, ..., a_k$, the system:
  $ x equiv a_1 space (mod n_1), quad x equiv a_2 space (mod n_2), quad ..., quad x equiv a_k space (mod n_k) $
  has a unique solution modulo $N = n_1 n_2 cdots n_k$.
]

=== Solved Problems

#solved_problem[
  Compute $7^{100} mod 13$.
]
#solution[
  By Fermat's Little Theorem with $p = 13$: $7^{12} equiv 1 space (mod 13)$.
  Write $100 = 8 dot 12 + 4$. Then:
  $ 7^{100} = (7^{12})^8 dot 7^4 equiv 1^8 dot 7^4 = 7^4 space (mod 13) $
  $7^2 = 49 equiv 10 space (mod 13)$;  $7^4 = 10^2 = 100 equiv 9 space (mod 13)$.
  So $7^{100} equiv 9 space (mod 13)$.
]

#solved_problem[
  Find the modular inverse of $7$ modulo $11$ using Fermat's Little Theorem.
]
#solution[
  Since 11 is prime and $gcd(7, 11) = 1$: $7^{-1} equiv 7^{11-2} = 7^9 space (mod 11)$.
  $7^2 = 49 equiv 5$; $7^4 equiv 25 equiv 3$; $7^8 equiv 9$; $7^9 = 7^8 dot 7 equiv 9 dot 7 = 63 equiv 8 space (mod 11)$.
  Check: $7 dot 8 = 56 = 5(11) + 1 equiv 1$. ✓
]

#solved_problem[
  Solve the CRT system: $x equiv 2 space (mod 3)$, $x equiv 3 space (mod 5)$, $x equiv 2 space (mod 7)$.
]
#solution[
  $N = 3 dot 5 dot 7 = 105$.
  $N_1 = 35, N_2 = 21, N_3 = 15$.
  Inverses: $35^{-1} mod 3$: $35 equiv 2$, $2^{-1} equiv 2 space (mod 3)$.\
  $21^{-1} mod 5$: $21 equiv 1$, $1^{-1} = 1 space (mod 5)$.\
  $15^{-1} mod 7$: $15 equiv 1$, $1^{-1} = 1 space (mod 7)$.
  $x = 2(35)(2) + 3(21)(1) + 2(15)(1) = 140 + 63 + 30 = 233 equiv 233 - 2(105) = 23 space (mod 105)$.
  Check: $23 = 7(3)+2$ ✓; $23 = 4(5)+3$ ✓; $23 = 3(7)+2$ ✓.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [$a equiv b space (mod n)$ means:],
    (["$a = b$"], ["$n divides (a-b)$"], ["$a divides n$"], ["$a - b = n$"]),
    1,
  )

  #question(
    [Fermat's Little Theorem states that for prime $p$ and $gcd(a,p)=1$:],
    ([$a^p equiv 1$], [$a^{p-1} equiv 1 space (mod p)$], [$a^{phi(p)} equiv 0$], [$a equiv 1 space (mod p)$]),
    1,
  )

  #question(
    [The modular inverse of $a$ mod prime $p$ can be computed as:],
    ([$a^{p} mod p$], [$a^{p-2} mod p$], [$a^{p+1} mod p$], [$a^2 mod p$]),
    1,
  )

  #question(
    [Euler's Theorem states that if $gcd(a,n)=1$, then $a^{phi(n)} equiv$],
    ([$0 space (mod n)$], [$a space (mod n)$], [$1 space (mod n)$], [$phi(n) space (mod n)$]),
    2,
  )

  #question(
    [$7^{12} mod 13$ equals (by Fermat's):],
    (["0"], ["7"], ["1"], ["12"]),
    2,
  )

  #question(
    [CRT guarantees a unique solution modulo:],
    ([$max(n_i)$], [$sum n_i$], [$product n_i$], [$gcd(n_i)$]),
    2,
  )

  #question(
    [RSA decryption works because of:],
    (["Fermat's Last Theorem"], ["Euler's Theorem"], ["The Fundamental Theorem of Algebra"], ["Hasse's Theorem"]),
    1,
  )

  #question(
    [$ZZ_n$ with addition and multiplication is:],
    (["A group only"], ["A field always"], ["A ring (field only when $n$ is prime)"], ["A vector space"]),
    2,
  )

  #question(
    [What is $3^{-1} mod 7$?],
    (["2"], ["3"], ["4"], ["5"]),
    3,
  )

  #question(
    [The CRT requires the moduli $n_1,...,n_k$ to be:],
    (["Prime"], ["Equal"], ["Pairwise coprime"], ["Even"]),
    2,
  )
]

=== Supplementary Problems

#supplementary[
  Compute $3^{200} mod 7$ using Fermat's Little Theorem.
]

#supplementary[
  Find all solutions to $x^2 equiv 1 space (mod 8)$.
]

#supplementary[
  Prove Euler's theorem using the structure of the group $(ZZ_n^*, dot)$.
]

#supplementary[
  In RSA with $n = 33$, $e = 7$: compute $phi(n)$, find $d = e^{-1} mod phi(n)$, and verify $e d equiv 1 space (mod phi(n))$.
]

#supplementary[
  Solve the system: $x equiv 1 space (mod 4)$, $x equiv 3 space (mod 5)$, $x equiv 2 space (mod 9)$.
]

#supplementary[
  Show that if $p$ is an odd prime, $ZZ_p$ is a field.
]
