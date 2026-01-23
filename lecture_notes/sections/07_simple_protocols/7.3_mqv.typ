#import "../../utils.typ": *

== Menezes-Qu-Vanstone (MQV) Protocol

=== Theory

#definition("MQV Protocol")[
  *Menezes-Qu-Vanstone (MQV)* is an authenticated key agreement protocol. It is designed to be implicitly authenticated (users verify each other by successfully computing the session key) and resistant to MITM attacks.

  In MQV, the session key is derived from both long-term (static) keys and ephemeral (short-term) keys.
]

#theorem("Implicit Authentication")[
  Unlike basic Diffie-Hellman, MQV incorporates the parties' public keys into the shared secret computation. If Alice calculates the key successfully, she knows that only Bob (who possesses Bob's private key) could have calculated the same key.
]

=== Solved Problems

#solved_problem[
  In a simplified view of MQV (or DH with static keys), why is using only static keys for the session key undesirable?
]
#solution[
  If only static keys are used (e.g., $S = g^(a b)$ computed once from long-term keys), the generated session key is *static*.
  1. *No Forward Secrecy*: If a private key is compromised later, all past communications encrypted with that static key are compromised.
  2. *Replay Attacks*: An attacker can replay old messages.
  MQV combines static and ephemeral keys to provide both authentication and forward secrecy.
]

=== Supplementary Problems

#supplementary[
  Research the computational cost of MQV compared to a basic Diffie-Hellman exchange. How many exponentiations are required?
]

#supplementary[
  What describes the "Unknown Key Share" (UKS) attack, and does MQV prevent it?
]
