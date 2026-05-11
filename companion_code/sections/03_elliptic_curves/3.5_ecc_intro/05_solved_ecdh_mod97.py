from _ecc_utils import DomainParameters, ecdh_exchange


if __name__ == "__main__":
    # Solved problem: ECDH on y^2 = x^3 + 2x + 3 over F_97 with G=(3,6), n=5.
    params = DomainParameters(p=97, a=2, b=3, generator=(3, 6), n=5, h=1)
    alice_private = 2
    bob_private = 3

    alice_public, bob_public, alice_secret, bob_secret = ecdh_exchange(
        params,
        alice_private,
        bob_private,
    )

    print(f"Q_A = {alice_public}")
    print(f"Q_B = {bob_public}")
    print(f"Alice shared secret: {alice_secret}")
    print(f"Bob shared secret: {bob_secret}")
    print(f"shared x-coordinate: {alice_secret[0] if alice_secret else None}")
