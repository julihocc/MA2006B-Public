if __name__ == "__main__":
    # Example: classical Diffie-Hellman in the multiplicative group F_23^*.
    p = 23
    generator = 5
    alice_private = 6
    bob_private = 15

    alice_public = pow(generator, alice_private, p)
    bob_public = pow(generator, bob_private, p)

    alice_shared = pow(bob_public, alice_private, p)
    bob_shared = pow(alice_public, bob_private, p)

    assert alice_public == 8
    assert bob_public == 19
    assert alice_shared == bob_shared == 2

    print(f"Public group: F_{p}^*")
    print(f"Public generator: g = {generator}")
    print(f"Alice public A = g^a mod {p} = {alice_public}")
    print(f"Bob public B = g^b mod {p} = {bob_public}")
    print(f"Alice shared B^a mod {p} = {alice_shared}")
    print(f"Bob shared A^b mod {p} = {bob_shared}")
