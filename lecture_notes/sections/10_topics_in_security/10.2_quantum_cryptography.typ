#import "../../utils.typ": *

== Quantum Cryptography

=== Theory

#definition("Quantum Key Distribution (QKD)")[
  *Quantum key distribution* uses quantum mechanics to guarantee secure communication. It enables two parties to produce a shared random secret key known only to them, which can then be used to encrypt and decrypt messages.

  *BB84 Protocol*: The first QKD protocol (Bennett and Brassard, 1984). It uses photon polarization states to transmit bits. Detecting an eavesdropper is guaranteed by the *No-Cloning Theorem* and the disturbance property of quantum measurements.
]

#theorem("Eavesdropping Detection")[
  Any attempt by Eve to measure the quantum states (photons) sent by Alice to Bob will inevitably disturb the state (introduce errors), revealing her presence to Alice and Bob during the key reconciliation phase.
]

=== Solved Problems

#solved_problem[
  In the BB84 protocol, if Alice sends a photon with horizontal polarization ($arrow.r$, representing bit 0) and Bob measures it with a diagonal basis ($arrow.tr, arrow.br$), what happens?
]
#solution[
  If Bob measures a horizontally polarized photon in the diagonal basis, the result is random. He will detect a $+45^degree$ photon (bit 0) with 50% probability or a $-45^degree$ photon (bit 1) with 50% probability. This mismatch of bases (and subsequent discarding of these bits) is a core feature of the protocol.
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [What is the fundamental principle used by QKD to detect eavesdropping?],
    (
      [General relativity],
      [Heisenberg Uncertainty Principle / Disturbance on measurement],
      [Classical probability],
      [Binary logic],
    ),
    1,
  )

  #question(
    [Which protocol was the first to implement Quantum Key Distribution?],
    ([RSA], [Diffie-Hellman], [BB84], [AES]),
    2,
  )

  #question(
    [The No-Cloning Theorem states that:],
    (
      [It is impossible to copy any bit],
      [It is impossible to create an identical copy of an arbitrary unknown quantum state],
      [Quantum states can be copied exactly twice],
      [Measurements never disturb the state],
    ),
    1,
  )

  #question([How many different bases are used in the standard BB84 protocol?], (["1"], ["2"], ["3"], ["4"]), 1)

  #question(
    [In QKD, bits where Alice and Bob used different bases are:],
    ([Discarded], [Kept as the secret key], [XORed with the key], [Sent to Eve]),
    0,
  )

  #question(
    [What happens if Eve tries to intercept and resend photons (Intercept-Resend attack)?],
    (
      [She gets the full key],
      [She introduces a detectable error rate (25%)],
      [Alice and Bob cannot communicate],
      [The key becomes symmetric],
    ),
    1,
  )

  #question(
    [Quantum Cryptography relies for its security on:],
    ([Mathematical hardness], [Laws of physics], [Algorithm complexity], [Fast computers]),
    1,
  )

  #question(
    [After the quantum transmission, Alice and Bob perform "Sifting". What is this?],
    ([Discarding bits where bases mismatched], [Generating random bits], [Error correction], [Privacy amplification]),
    0,
  )

  #question(
    [QKD is typically used to establish:],
    ([Symmetric keys], [Public keys], [Digital signatures], [Hash functions]),
    0,
  )

  #question(
    [Which physical property of photons is commonly used to encode information in QKD?],
    ([Mass], [Polarization], [Charge], [Temperature]),
    1,
  )
]

=== Supplementary Problems

#supplementary[
  Explain the difference between Post-Quantum Cryptography (software/math-based) and Quantum Cryptography (physics/hardware-based).
]

#supplementary[
  What is the "photon number splitting" attack in practical QKD systems?
]

#supplementary[
  Prove that in the absence of an eavesdropper, Alice and Bob should agree on 50% of the originally sent bits during the sifting phase.
]

#supplementary[
  Describe the "Privacy Amplification" stage in a QKD protocol.
]

#supplementary[
  Evaluate the distance limitations of current fiber-optic based QKD and the role of quantum repeaters.
]

#supplementary[
  How does the B92 protocol differ from the BB84 protocol in terms of the number of states used?
]

#supplementary[
  Discuss the concept of "Device-Independent QKD".
]

#supplementary[
  If Alice sends bits in the Rectilinear ($+$) and Diagonal ($times$) bases: $A_{basis}: +, times, times, +, times$ and $A_{bits}: 0, 1, 0, 1, 1$. If Bob measures with $B_{basis}: +, +, times, times, times$, which bits are kept?
]

#supplementary[
  Explain why QKD alone does not provide a complete solution for secure communication (i.e., it still requires authentication).
]

#supplementary[
  Research the world's longest QKD network (e.g., the Micius satellite or the Beijing-Shanghai backbone).
]
