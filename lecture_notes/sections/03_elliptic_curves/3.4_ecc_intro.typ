#import "../../utils.typ": *
== Introduction to Elliptic Curve Cryptography

=== Theory

#definition("Domain Parameters")[
  An *ECC domain parameter set* specifies the elliptic curve and the subgroup used in a cryptographic protocol:
  $(p, a, b, G, n, h)$ where:
  - $p$: prime defining the field $FF_p$
  - $a, b$: curve coefficients
  - $G = (G_x, G_y)$: generator (base point)
  - $n$: prime order of $G$ (i.e., $n G = cal(O)$)
  - $h = \#E(FF_p) / n$: cofactor (ideally $h = 1$)
]

#definition("Elliptic Curve Discrete Logarithm Problem (ECDLP)")[
  Given an elliptic curve $E(FF_p)$, a generator $G$ of order $n$, and a point $Q = k G$ for some integer $k in {1, ..., n-1}$, the *ECDLP* is:

  *Find $k$ given $G$ and $Q$.*

  No sub-exponential algorithm is known for the ECDLP on general curves, unlike for the classical DLP in $ZZ_p^*$. This hardness is the security foundation of ECC.
]

#note[
  *Key size comparison*: ECDLP with a 256-bit key offers security comparable to a 3072-bit RSA key or a 3072-bit DH key. ECC dramatically reduces bandwidth, storage, and computation requirements.
]

#algorithm("Elliptic Curve Diffie-Hellman (ECDH) Key Exchange")[
  *Setup*: Alice and Bob agree publicly on domain parameters $(p, a, b, G, n, h)$.

  + *Alice*: Choose a private key $d_A in_R {1,...,n-1}$. Compute public key $Q_A = d_A G$.
  + *Bob*: Choose a private key $d_B in_R {1,...,n-1}$. Compute public key $Q_B = d_B G$.
  + *Alice computes*: $S = d_A Q_B = d_A d_B G$.
  + *Bob computes*: $S = d_B Q_A = d_B d_A G$.
  + *Shared secret*: Both arrive at $S$. Typically $S_x$ (the $x$-coordinate) is used as the shared secret.

  *Security*: An eavesdropper who intercepts $Q_A$ and $Q_B$ must solve the ECDLP to find $d_A$ or $d_B$, which is computationally infeasible.
]

#definition("Standardized Curves")[
  Several standardized elliptic curves are widely used:
  - *secp256k1*: $y^2 = x^3 + 7$ over a 256-bit prime $p$. Used in Bitcoin and Ethereum.
  - *P-256 (secp256r1)*: NIST-standardized 256-bit curve. Widely used in TLS/SSL.
  - *Curve25519*: Designed by Bernstein for high performance and security. Used in Signal protocol, WireGuard.
  These curves have been chosen with specific cofactors, large prime orders, and resistance to known attacks.
]

#note[
  *ECDSA (Elliptic Curve Digital Signature Algorithm)*: Beyond key exchange, ECC also supports digital signatures via ECDSA. Given a message hash $e$, private key $d$, and random nonce $k$:
  - Compute $R = k G$, set $r = R_x mod n$.
  - Compute $s = k^{-1}(e + r d) mod n$.
  - Signature: $(r, s)$. Verification uses the public key $Q = d G$.
]

#note[
  *Comparison of ECC, RSA, and classical DH*:

  #align(center)[
    #table(
      columns: 4,
      [*Security Level*], [*ECC key size*], [*RSA/DH key size*], [*Symmetric equiv.*],
      [80 bits], [160 bits], [1024 bits], [80 bits],
      [128 bits], [256 bits], [3072 bits], [128 bits],
      [192 bits], [384 bits], [7680 bits], [192 bits],
      [256 bits], [521 bits], [15360 bits], [256 bits],
    )
  ]
]

=== Solved Problems

#solved_problem[
  Alice and Bob use ECDH with the curve $y^2 equiv x^3 + 2x + 3 space (mod 97)$ and generator $G = (3, 6)$ of order $n = 5$. Alice picks $d_A = 2$, Bob picks $d_B = 3$. Compute the shared secret.
]
#solution[
  *Alice's public key*: $Q_A = 2G = 2(3,6)$. Use doubling formula with $a=2$:
  $ lambda = (3 dot 9 + 2)(2 dot 6)^{-1} = 29 dot 12^{-1} mod 97 $
  $12^{-1} mod 97$: by extended Euclidean, $12 dot 89 = 1068 = 11(97) + 1$, so $12^{-1} = 89$.
  $lambda = 29 dot 89 = 2581 equiv 2581 - 26(97) = 2581 - 2522 = 59$.
  $x_3 = 59^2 - 6 = 3481 - 6 = 3475 equiv 3475 - 35(97) = 3475 - 3395 = 80$.
  $y_3 = 59(3 - 80) - 6 = 59(-77) - 6 = -4543 - 6 = -4549 equiv -4549 + 47(97) = -4549 + 4559 = 10$.
  $Q_A = 2G = (80, 10)$.

  *Bob's public key*: $Q_B = 3G = 2G + G = (80,10) + (3,6)$:
  $lambda = (6-10)(3-80)^{-1} = (-4)(-77)^{-1} mod 97$.
  $-77 equiv 20$; $20^{-1} mod 97$: $20 dot 34 = 680 = 7(97)+1$, so $20^{-1}=34$.
  $lambda = (-4)(34) = -136 equiv -136 + 2(97) = 58$.
  $x_3 = 58^2 - 80 - 3 = 3364 - 83 = 3281 equiv 3281 - 33(97) = 3281 - 3201 = 80$. Hmm, this happens for small order groups. $Q_B = 3G$.

  *Shared secret*: Alice computes $d_A Q_B = 2 Q_B = 2(3G) = 6G = G$ (since order 5: $6G = G$). Bob computes $d_B Q_A = 3(2G) = 6G = G$. Shared secret = $G = (3, 6)$, specifically $x$-coordinate $= 3$.

  *(Note: In practice, the order $n$ is chosen to be very large — hundreds of bits — making enumeration infeasible.)*
]

#solved_problem[
  Why does ECDLP offer more security per bit than the classical DLP?
]
#solution[
  The classical DLP in $ZZ_p^*$ can be solved in sub-exponential time using the *Index Calculus* method, which exploits the fact that integers can be expressed as products of small primes (factor base). This reduces the complexity below $O(sqrt(n))$.

  For ECDLP over a properly chosen elliptic curve, no analogous sub-exponential algorithm is known. The best known algorithms (Baby-step Giant-step, Pollard's rho) run in $O(sqrt(n))$ time. Since $n approx p$, an attacker faces $O(sqrt(2^{256})) = O(2^{128})$ operations for a 256-bit curve — the same security as 128-bit symmetric encryption.

  For RSA or classical DH to achieve the same 128-bit security, keys must be 3072 bits (due to sub-exponential attacks via the Number Field Sieve).
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [The ECDLP problem is: given $G$ and $Q = kG$, find:],
    ([$G$], [$Q$], [$k$], [$-G$]),
    2,
  )

  #question(
    [In ECDH, the shared secret is:],
    ([$d_A + d_B$], [$d_A dot d_B G$], [$d_A G + d_B G$], [$G$]),
    1,
  )

  #question(
    [A 256-bit ECC key offers security comparable to which RSA key size?],
    (["512 bits"], ["1024 bits"], ["2048 bits"], ["3072 bits"]),
    3,
  )

  #question(
    [Which well-known curve is used in Bitcoin?],
    (["P-256"], ["secp256k1"], ["Curve25519"], ["Brainpool P-256"]),
    1,
  )

  #question(
    [ECDLP is believed to be harder than classical DLP because:],
    (["Elliptic curves have more points"], ["No sub-exponential algorithm is known for ECDLP on general curves"], ["Modular arithmetic is slower"], ["ECC uses larger keys"]),
    1,
  )

  #question(
    [In ECDH, what is transmitted publicly?],
    (["Private keys $d_A$, $d_B$"], ["Shared secret $S$"], ["Public keys $Q_A$, $Q_B$ and domain parameters"], ["Only the generator $G$"]),
    2,
  )

  #question(
    [The cofactor $h$ in domain parameters is:],
    ([$h = n G$], [$h = \#E(FF_p) / n$], [$h = p / n$], [$h = p + 1 - n$]),
    1,
  )

  #question(
    [ECDSA is used for:],
    (["Key exchange"], ["Digital signatures"], ["Symmetric encryption"], ["Hashing"]),
    1,
  )

  #question(
    [Curve25519 was designed with an emphasis on:],
    (["Large key size"], ["Compatibility with RSA"], ["High performance and security without trust in standard bodies"], ["Use in Bluetooth only"]),
    2,
  )

  #question(
    [The best known attack on ECDLP for a random curve of order $n$ runs in:],
    ([$O(n)$], [$O(sqrt(n))$], [$O(log n)$], [$O(n^2)$]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  In ECDH, if an attacker intercepts $Q_A = d_A G$ and $Q_B = d_B G$, what must they compute to derive the shared secret? Why is this hard?
]

#supplementary[
  Using the ECDH protocol, explain step-by-step how two parties establish a shared AES key.
]

#supplementary[
  Look up the secp256k1 curve parameters. What are $p$, $a$, $b$, and the order $n$?
]

#supplementary[
  Explain why reusing the nonce $k$ in ECDSA is catastrophic for security.
]

#supplementary[
  Compare the bandwidth requirements for exchanging a 128-bit-equivalent key using (a) RSA, (b) classical DH, and (c) ECC (ECDH with P-256).
]

#supplementary[
  What is the purpose of the cofactor $h$ in ECC domain parameters, and why is $h = 1$ preferred?
]
