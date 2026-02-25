#import "../../utils.typ": *
== Homomorphisms

=== Theory
#definition("Homomorphism")[
  A *homomorphism* is a structure-preserving map between two algebraic structures. Let $(G, dot)$ and $(H, *)$ be groups. A function $phi: G arrow H$ is a group homomorphism if for all $a, b in G$:
  $ phi(a dot b) = phi(a) * phi(b) $
]

#example[
  The map $exp: (RR, +) arrow (RR^+, dot)$ defined by $x |-> e^x$ is a homomorphism. The operation in the domain is the standard addition of real numbers, while the operation in the codomain is the standard multiplication of positive real numbers. We can verify the homomorphism property by observing that for any $x, y in RR$, we have
  $ exp(x+y) = e^(x+y) = e^x dot e^y = exp(x) dot exp(y). $
]

#proposition("Properties of Homomorphisms")[
  Let $phi: G arrow H$ be a group homomorphism. Then the following properties hold:
  1. $phi(e_G) = e_H$, meaning $phi$ maps the identity of $G$ to the identity of $H$.
  2. $phi(a^(-1)) = phi(a)^(-1)$ for all $a in G$, meaning $phi$ maps inverses to inverses.
]

#proof[
  For the first property, observe that $e_G = e_G dot e_G$. Applying $phi$ to both sides yields $phi(e_G) = phi(e_G dot e_G) = phi(e_G) * phi(e_G)$. Right-multiplying both sides by the inverse $phi(e_G)^(-1)$ in $H$ gives $e_H = phi(e_G)$.

  For the second property, we use the fact that $a dot a^(-1) = e_G$. Applying $phi$ yields $phi(a dot a^(-1)) = phi(e_G)$. Since $phi$ is a homomorphism and preserves the identity, we have $phi(a) * phi(a^(-1)) = e_H$. Therefore, $phi(a^(-1))$ is the inverse of $phi(a)$ in $H$, which means $phi(a^(-1)) = phi(a)^(-1)$.
]

#definition("Normal Subgroup")[
  A subgroup $N$ of a group $G$ is *normal* in $G$ if for every $g in G$ and $n in N$, we have
  $ g dot n dot g^(-1) in N $.
]

#proposition("Equivalent Characterization of Normality")[
  A subgroup $N subset.eq G$ is normal if and only if $g N g^(-1) = N$ for all $g in G$.
]

#proof[
  $(arrow.r.double)$ Assume $N$ is normal. Then for any $g in G$ and $n in N$, we have $g n g^(-1) in N$, so $g N g^(-1) subset.eq N$.
  Applying the same property to $g^(-1)$ gives $g^(-1) N g subset.eq N$. Conjugating by $g$ yields $N subset.eq g N g^(-1)$.
  Hence $g N g^(-1) = N$.

  $(arrow.l.double)$ If $g N g^(-1) = N$ for all $g in G$, then every element of the form $g n g^(-1)$ (with $n in N$) lies in $N$.
  Therefore $N$ is normal by definition.
]

#definition("Kernel")[
  The *Kernel* of $phi$, denoted $ker(phi)$, is the set ${g in G | phi(g) = e_H}$.
]

#proposition("Kernel is Normal")[
  For a group homomorphism $phi: G arrow H$, the subgroup $ker(phi)$ is normal in $G$.
]

#proof[
  Let $k in ker(phi)$ and $g in G$. Then $phi(k) = e_H$.
  Since $phi$ is a homomorphism,
  $ phi(g dot k dot g^(-1)) = phi(g) * phi(k) * phi(g)^(-1) = phi(g) * e_H * phi(g)^(-1) = e_H $.
  Hence $g dot k dot g^(-1) in ker(phi)$.
  By the definition of normal subgroup, $ker(phi)$ is normal in $G$.
]

#example[
  For the homomorphism $phi: ZZ arrow ZZ_2$ given by $phi(x) = x mod 2$:
  Sample values are $phi(0) = 0, phi(1) = 1, phi(2) = 0, phi(3) = 1$, so parity is exactly what the map records.

  For addition,
  $ phi(a+b) = (a+b) mod 2 = ((a mod 2) + (b mod 2)) mod 2 = phi(a) +_2 phi(b), $
  so as a map $(ZZ,+) arrow (ZZ_2,+_2)$, $phi$ is a group homomorphism.

  Also,
  $ phi(a b) = (a b) mod 2 = ((a mod 2)(b mod 2)) mod 2 = phi(a) phi(b), $
  so reduction modulo $2$ preserves multiplication as well (hence it is also a ring homomorphism $ZZ arrow ZZ_2$).

  Now compute the kernel:
  $ ker(phi) = {x in ZZ | phi(x) = 0} = {x in ZZ | x mod 2 = 0}. $
  This means $x$ is even, i.e., $x = 2k$ for some $k in ZZ$, so
  $ ker(phi) = 2ZZ = {..., -4, -2, 0, 2, 4, ...}. $

  By the proposition "Kernel is Normal", this kernel is a normal subgroup of $ZZ$.
]

#definition("Image")[
  The *Image* of a homomorphism $phi: G arrow H$, denoted $"Im"(phi)$ or $phi(G)$, is the set ${phi(g) | g in G}$.
]

#proposition("Image is a Subgroup")[
  For a group homomorphism $phi: G arrow H$, the image $"Im"(phi)$ is a subgroup of $H$.
]

#definition("Isomorphism")[
  An *isomorphism* is a bijective group homomorphism. If such a map exists between $G$ and $H$, they are said to be *isomorphic*, denoted $G tilde.eq H$.
]

#theorem("First Isomorphism Theorem")[
  Let $phi: G arrow H$ be a group homomorphism. Then the quotient group $G slash ker(phi)$ is isomorphic to the image of $phi$:
  $ G slash ker(phi) tilde.eq "Im"(phi) $
]

#proof[
  Let $K = ker(phi)$. We define a map $tilde(phi): G slash K arrow "Im"(phi)$ by $tilde(phi)(g K) = phi(g)$. We must show this map is well-defined, a homomorphism, and bijective.

  1. *Well-defined:* Suppose $g_1 K = g_2 K$. Then $g_1^(-1) g_2 in K$. By the definition of the kernel, $phi(g_1^(-1) g_2) = e_H$. Since $phi$ is a homomorphism, we have $phi(g_1)^(-1) phi(g_2) = e_H$, which implies $phi(g_1) = phi(g_2)$. Thus, $tilde(phi)(g_1 K) = tilde(phi)(g_2 K)$, so the map does not depend on the choice of the coset representative.

  2. *Homomorphism property:* Using the group operation of the quotient group, we have
  $
    tilde(phi)((g_1 K)(g_2 K)) = tilde(phi)((g_1 g_2) K) = phi(g_1 g_2) = phi(g_1) phi(g_2) = tilde(phi)(g_1 K) tilde(phi)(g_2 K).
  $

  3. *Surjectivity:* For any element $h in "Im"(phi)$, there exists some $g in G$ such that $phi(g) = h$. But then $tilde(phi)(g K) = phi(g) = h$, so every element in $"Im"(phi)$ is mapped to.

  4. *Injectivity:* Suppose $tilde(phi)(g K) = e_H$. Then $phi(g) = e_H$, which means $g in K$. Thus, the coset $g K = K$, which is the identity element of the quotient group $G slash K$. Since the kernel of $tilde(phi)$ contains only the identity element, $tilde(phi)$ is injective.

  Since $tilde(phi)$ is a well-defined, bijective homomorphism, it is an isomorphism. Therefore, $G slash K tilde.eq "Im"(phi)$.
]

#example[
  Recall the homomorphism $phi: ZZ arrow ZZ_2$ given by $phi(x) = x mod 2$. We previously determined that its kernel is the set of even integers, $ker(phi) = 2ZZ$. Because $phi(0) = 0$ and $phi(1) = 1$, the map is surjective onto $ZZ_2$, meaning $"Im"(phi) = ZZ_2$.

  By applying the First Isomorphism Theorem with $G = ZZ$ and $K = 2ZZ$, we establish the standard isomorphism between the quotient group of integers modulo $2$ and the group $ZZ_2$:
  $ ZZ slash 2ZZ tilde.eq ZZ_2. $
  This formalizes the intuitive idea that the group of integers divided into "even" and "odd" cosets behaves exactly like integer arithmetic modulo $2$.
]

#definition("Euler's Totient Function")[
  For a positive integer $N$, *Euler's Totient Function*, denoted as $phi(N)$, counts the number of integers in the range $1 <= k <= N$ that are coprime to $N$ (i.e., their greatest common divisor with $N$ is $1$). This value corresponds to the order of the multiplicative group of integers modulo $N$, denoted $|ZZ_N^*|$. If $N$ is the product of two distinct primes $p$ and $q$, then $phi(N) = (p-1)(q-1)$.
]

#example[
  *RSA Encryption* provides a concrete example of a homomorphic property. Consider the RSA encryption setup where $N$ is the modulus and $e$ is the public exponent. In practice, $N$ is chosen as the product of two distinct large prime numbers ($N = p q$) to provide the cryptographic trapdoor; knowing these primes allows the receiver to compute Euler's totient function $phi(N)$ and derive the private decryption key, while keeping it computationally infeasible for adversaries who only know $N$.

  The encryption function $E: ZZ_N^* arrow ZZ_N^*$ on the multiplicative group of integers modulo $N$ is defined by:
  $ E(m) = m^e mod N. $
  We can compute the product of two encrypted messages $E(m_1)$ and $E(m_2)$ without decrypting them. Observe that:
  $ E(m_1) E(m_2) = (m_1^e mod N)(m_2^e mod N) equiv (m_1 m_2)^e mod N = E(m_1 m_2). $
  Thus, $E$ forms a group homomorphism from $(ZZ_N^*, dot)$ to itself, preserving the multiplicative structure.

  For a concrete numerical example, let $N = 15$ and $e = 3$. Our encryption map is $E(m) = m^3 mod 15$.
  Consider two plaintext messages $m_1 = 2$ and $m_2 = 4$ in $ZZ_(15)^*$.
  Their encryptions are:
  $ E(2) = 2^3 mod 15 = 8 mod 15 = 8, $
  $ E(4) = 4^3 mod 15 = 64 mod 15 = 4. $
  The product of the encrypted messages is $E(2) E(4) = 8 times 4 = 32 equiv 2 mod 15$.

  Now compute the encryption of their formal product $m_1 m_2 = 2 times 4 = 8$:
  $ E(m_1 m_2) = E(8) = 8^3 mod 15 = 512 mod 15 = 2. $
  As expected, $E(2)E(4) = E(2 times 4) = 2$, verifying the homomorphic property.

  To decrypt a ciphertext $c$, the receiver uses the private key $d$, which is the modular multiplicative inverse of $e$ modulo $phi(N)$. The decryption function is $D(c) = c^d mod N$. In our example where $N = 3 times 5 = 15$, we have $phi(15) = (3-1)(5-1) = 8$. We find $d$ such that $3d equiv 1 mod 8$, which yields $d = 3$. Thus, to decrypt the ciphertext $c = 8$ back to $m_1$:
  $ D(8) = 8^3 mod 15 = 512 mod 15 = 2. $
]

=== Solved Problems

#solved_problem[
  Consider the map $phi: ZZ arrow ZZ_n$ defined by $phi(x) = x mod n$. Prove that $phi$ is a group homomorphism.
]
#solution[
  We must verify that $phi$ satisfies the homomorphism property, namely that $phi(x+y) = phi(x) +_n phi(y)$ for any integers $x, y in ZZ$.

  By the definition of our map, applying $phi$ to the sum $x+y$ gives:
  $ phi(x+y) = (x+y) mod n. $

  From the fundamental properties of modular arithmetic, we know that the modulo operation distributes over addition, meaning:
  $ (x+y) mod n = ((x mod n) + (y mod n)) mod n. $

  This expression corresponds exactly to the definition of modular addition $+_n$ in the group $ZZ_n$. Substituting our function $phi$ back into this expression yields $phi(x) +_n phi(y)$. Thus, we have shown that $phi(x+y) = phi(x) +_n phi(y)$, establishing that $phi$ is indeed a homomorphism.
]

#solved_problem[
  Let $phi: RR^* arrow RR^*$ be defined by $phi(x) = |x|$. Is $phi$ a homomorphism under multiplication?
]
#solution[
  Check if $phi(x y) = phi(x)phi(y)$.

  LHS: $phi(x y) = |x y|$.

  RHS: $phi(x)phi(y) = |x| dot |y|$.

  Since $|x y| = |x||y|$ for all real numbers, $phi$ is a homomorphism.
]

#solved_problem[
  Find the kernel of the homomorphism $phi: ZZ_(12) arrow ZZ_4$ defined by $phi(x) = x mod 4$.
]
#solution[
  We need to find all $x in ZZ_(12) = {0, 1, ..., 11}$ such that $phi(x) = 0$ in $ZZ_4$ (i.e., $x$ is a multiple of 4).

  Testing elements:
  - $0 mod 4 = 0$ (in Kernel)
  - $4 mod 4 = 0$ (in Kernel)
  - $8 mod 4 = 0$ (in Kernel)

  Any other element is not divisible by 4.
  Thus, $ker(phi) = {0, 4, 8}$.
]


=== Self-Evaluation Quiz

#quiz[
  #question(
    [A function $phi: G arrow H$ is a homomorphism if for all $x, y in G$:],
    (
      [$phi(x + y) = phi(x) dot phi(y)$],
      [$phi(x y) = phi(x) phi(y)$],
      [$phi(x y) = phi(x) + phi(y)$],
      [$phi(x) = phi(y)$],
    ),
    1,
  )

  #question(
    [The kernel of a homomorphism $phi: G arrow H$ consists of elements mapping to:],
    ([The identity of $G$], [The identity of $H$], [Any element of $H$], [The generators of $G$]),
    1,
  )

  #question(
    [An isomorphism is a homomorphism that is also:],
    ([Injective only], [Surjective only], [Bijective], [Constant]),
    2,
  )

  #question(
    [For any homomorphism $phi: G arrow H$, which property always holds?],
    ([$phi(e_G) = e_H$], [$phi(e_G) = phi(e_H)$], [$phi(e_H) = e_G$], [$phi(x) = x$]),
    0,
  )

  #question(
    [For any homomorphism $phi: G arrow H$, the inverse maps as:],
    ([$phi(x^(-1)) = phi(x)$], [$phi(x^(-1)) = phi(x)^(-1)$], [$phi(x^(-1)) = e_H$], [$phi(x^(-1)) = x$]),
    1,
  )

  #question(
    [The image of a homomorphism $phi(G)$ is always a subgroup of:],
    ([$G$], [$H$], [$"Ker"(phi)$], [$G times H$]),
    1,
  )

  #question(
    [The kernel of a homomorphism is always which type of subgroup?],
    ([Cyclic], [Abelian], [Normal], [Finite]),
    2,
  )

  #question(
    [The First Isomorphism Theorem states that if $phi: G arrow H$ is a homomorphism, then:],
    (
      [$G / "Ker"(phi) tilde.eq "Im"(phi)$],
      [$G / "Im"(phi) tilde.eq "Ker"(phi)$],
      [$G tilde.eq "Im"(phi)$],
      [$G tilde.eq H$],
    ),
    0,
  )

  #question(
    [The canonical homomorphism $pi: ZZ arrow ZZ_n$ is defined by:],
    ([$pi(x) = x$], [$pi(x) = x "mod" n$], [$pi(x) = n x$], [$pi(x) = 1$]),
    1,
  )

  #question(
    [An embedding of a group $G$ into $H$ is a homomorphism that is:],
    ([Surjective], [Injective], [Bijective], [Constant]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Determine if $phi: ZZ arrow ZZ$ defined by $phi(x) = 2x + 1$ is a group homomorphism.
]

#supplementary[
  Let $G$ be abelian and $n$ be an integer. Show that $phi: G arrow G$ defined by $phi(x) = x^n$ is a homomorphism.
]

#supplementary[
  Let $phi: G arrow H$ and $psi: H arrow K$ be group homomorphisms. Show that their composition $psi circle phi: G arrow K$ is also a group homomorphism.
]

#supplementary[
  Prove that if $phi: G arrow H$ is a homomorphism, then $phi(e_G) = e_H$.
]

#supplementary[
  Let $phi: G arrow H$ be a group homomorphism. Prove that the kernel $ker(phi)$ is a normal subgroup of $G$.
]

#supplementary[
  Show that the determinant map $det: "GL"(n, RR) arrow RR^*$ is a group homomorphism.
]

#supplementary[
  Prove that if $G$ is abelian and $phi: G arrow H$ is a surjective homomorphism, then $H$ is abelian.
]

#supplementary[
  Determine if the map $phi: ZZ arrow ZZ$ defined by $phi(x) = x^2$ is a homomorphism.
]

#supplementary[
  Give an example of a homomorphism $phi: G arrow H$ where $H$ is abelian but $G$ is non-abelian.
]

#supplementary[
  Let $N$ be a normal subgroup of $G$. Show that the map $pi: G arrow G/N$ defined by $pi(g) = g N$ is a surjective homomorphism (called the canonical homomorphism) and find its kernel.
]
