#import "../../utils.typ": *

== Massey-Omura Protocol

=== Theory

#definition("Three-Pass Protocol")[
  The *Massey-Omura* protocol is a cryptographic scheme that allows two parties to exchange a message without a shared secret or public-key infrastructure (PKI). It relies on the commutativity of encryption.

  Requires $gcd(e, q-1) = 1$ for exponentiation in field group $G$.
]

#theorem("Commutativity Property")[
  For a message $m$ in $upright("GF")(q)$, if $E_A(m) = m^(e_A)$ and $E_B(m) = m^(e_B)$, then:
  $ E_A(E_B(m)) = (m^(e_B))^(e_A) = m^(e_B e_A) = (m^(e_A))^(e_B) = E_B(E_A(m)) $
  This allows locks to be applied and removed in any order.
]

=== Solved Problems

#solved_problem[
  In Massey-Omura, why is it necessary for the encryption key $e$ to be coprime to $q-1$?
]
#solution[
  The protocol requires the existence of a decryption key $d$ such that $e d eq.triple 1 mod (q-1)$. If $gcd(e, q-1) != 1$, then $e$ has no modular inverse modulo $q-1$, and the receiver would be unable to 'unlock' the exponentiation, making the original message $m$ unrecoverable.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [What is the primary characteristic of the Massey-Omura protocol?],
    (
      [Single-round exchange],
      [Three-pass transmission],
      [Requires a shared symmetric key],
      [Public-key infrastructure only],
    ),
    1,
  )

  #question(
    [Which mathematical property does Massey-Omura rely on for successful decryption?],
    (
      [Associativity of addition],
      [Commutativity of exponentiation],
      [Hardness of factoring],
      [Linearity of hash functions],
    ),
    1,
  )

  #question(
    [In which field is the Massey-Omura protocol primarily defined?],
    ([Real numbers], [Complex numbers], [Finite field $upright("GF")(q)$], [Rational numbers]),
    2,
  )

  #question(
    [To initiate the protocol, what does Alice first compute and send?],
    ([$m^(e_A)$], [$m^(d_A)$], [ $m^(e_B)$], [$m^(d_B)$]),
    0,
  )

  #question(
    [After Bob receives and encrypts Alice's message, the value becomes:],
    ([$m^(e_A)$], [$m^(e_B)$], [$m^(e_A e_B)$], [$m^(e_A d_B)$]),
    2,
  )

  #question(
    [How does Alice 'remove' her part of the encryption during the third pass?],
    ([Subtract $e_A$], [Divide by $e_A$], [Raise power by $d_A$], [Apply XOR with $e_A$]),
    2,
  )

  #question(
    [What condition must Alice's encryption key $e_A$ satisfy relative to the group order $q-1$?],
    ([$gcd(e_A, q-1) = 1$], [$e_A < q/2$], [$e_A$ is prime], [$e_A$ is even]),
    0,
  )

  #question(
    [Without authentication, Massey-Omura is highly vulnerable to:],
    ([Power analysis], [MITM attacks], [Frequency analysis], [Timing attacks]),
    1,
  )

  #question([How many actual message transmissions occur between Alice and Bob?], (["1"], ["2"], ["3"], ["4"]), 2)

  #question(
    [In $ZZ_(11)$, if Alice's encryption key is $e_A = 3$, what is her decryption key $d_A$?],
    (["3"], ["7"], ["9"], ["5"]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Calculate Bob's decryption key $d_B$ if his encryption key is $e_B = 5$ in the field $ZZ_(11)$.
]

#supplementary[
  Perform a step-by-step Massey-Omura exchange over $ZZ_7$ for message $m=2$, given $e_A=5, e_B=5$.
]

#supplementary[
  Formalize the proof that $m^(e_A e_B d_A) = m^(e_B)$ in the group of units of $upright("GF")(q)$.
]

#supplementary[
  Explain why the message $m$ cannot be the zero element in most practical implementations of Massey-Omura.
]

#supplementary[
  Analyze the consequence if a party chooses an encryption key $e$ such that $gcd(e, q-1) != 1$.
]

#supplementary[
  Describe the "Physical Lockbox" analogy used to explain the Massey-Omura three-pass protocol.
]

#supplementary[
  Show that while Massey-Omura provides confidentiality (against passive Eves), it does not inherently provide authentication.
]

#supplementary[
  Discuss how Massey-Omura could be implemented using Elliptic Curve point multiplication instead of modular exponentiation.
]

#supplementary[
  Compare the communication overhead (number of messages) of Massey-Omura with ElGamal encryption.
]

#supplementary[
  Solve for the original message $m$ in $ZZ_(13)$ if Alice sends $m_1 = 5$ as her first pass, and her encryption key is $e_A = 5$.
]
