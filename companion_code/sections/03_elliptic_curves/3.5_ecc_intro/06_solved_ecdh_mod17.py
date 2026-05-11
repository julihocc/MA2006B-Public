from _ecc_utils import DomainParameters, ecdh_exchange


if __name__ == "__main__":
    # Solved problem: Complete ECDH on y^2 = x^3 + 2x + 2 over F_17.
    params = DomainParameters(p=17, a=2, b=2, generator=(5, 1), n=19, h=1)
    alice_private = 3
    bob_private = 10

    alice_public, bob_public, alice_secret, bob_secret = ecdh_exchange(
        params,
        alice_private,
        bob_private,
    )

    print(f"Q_A = {alice_public}")
    print(f"Q_B = {bob_public}")
    print(f"Alice shared secret: {alice_secret}")
    print(f"Bob shared secret: {bob_secret}")
    print(f"expected shared secret: {(13, 10)}")
