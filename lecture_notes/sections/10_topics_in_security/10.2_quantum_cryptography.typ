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

=== Supplementary Problems

#supplementary[
  Explain the difference between Post-Quantum Cryptography (software/math-based) and Quantum Cryptography (physics/hardware-based).
]

#supplementary[
  What is the "photon number splitting" attack in practical QKD systems?
]
