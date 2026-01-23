#import "../../utils.typ": *

== Massey-Omura Protocol

=== Theory

#definition("Massey-Omura Protocol")[
  The *Massey-Omura* protocol is a *three-pass* protocol that allows two parties to exchange a message without sharing any initial key. It relies on the commutativity of encryption functions.

  *Setup*: Defined over a finite field $"GF"(q)$.

  *Protocol*: To send message $m$:
  1. Alice encrypts $m$ with her key $e_A$: $m_1 = m^(e_A)$. Sends $m_1$ to Bob.
  2. Bob encrypts $m_1$ with his key $e_B$: $m_2 = m_1^(e_B) = m^(e_A e_B)$. Sends $m_2$ to Alice.
  3. Alice decrypts with her key $d_A$ (inverse of $e_A$): $m_3 = m_2^(d_A) = m^(e_A e_B d_A) = m^(e_B)$. Sends $m_3$ to Bob.
  4. Bob decrypts with his key $d_B$ (inverse of $e_B$): $m_("final") = m_3^(d_B) = m^(e_B d_B) = m$.

  Requires $gcd(e, q-1) = 1$ for exponentiation in field group $G$.
]

#theorem("Security")[
  Security relies on the difficulty of the Discrete Logarithm Problem to recover the exponents. However, it requires authentication to prevent Man-in-the-Middle attacks.
]

=== Solved Problems

#solved_problem[
  Demonstrate Massey-Omura over $ZZ_23$ for message $m=10$. Alice's key $e_A=7$, Bob's key $e_B=5$.
]
#solution[
  1. Alice sends $m_1 = 10^7 mod 23$.
    $10^2 = 100 equiv 8$. $10^4 = 64 equiv 18 equiv -5$.
    $10^7 = 10^4 dot 10^2 dot 10 equiv -5 dot 8 dot 10 = -400$.
    $-400 = -17(23) - 9 equiv 14$. So $m_1 = 14$.
  2. Bob sends $m_2 = 14^5 mod 23$.
    $14^2 = 196 = 8(23) + 12 equiv 12$.
    $14^4 = 144 = 6(23) + 6 equiv 6$.
    $14^5 = 6 dot 14 = 84 = 3(23) + 15 equiv 15$. So $m_2 = 15$.
  3. Alice calculates $d_A = e_A^(-1) mod 22$.
    $7 d_A equiv 1 mod 22$. $d_A = 19$. ($7(19) = 133 = 6(22)+1$).
    Alice sends $m_3 = 15^19 mod 23$.
    Result $m_3 = 20$.
  4. Bob calculates $d_B = e_B^(-1) mod 22$.
    $5 d_B equiv 1 mod 22$. $d_B = 9$.
    Bob computes $20^9 mod 23$ to recover $10$.
]

=== Supplementary Problems

#supplementary[
  Explain why the commutativity property $E_B(E_A(m)) = E_A(E_B(m))$ is essential for this protocol.
]

#supplementary[
  Contrast the number of messages exchanged in Massey-Omura vs Diffie-Hellman + Encryption.
]
