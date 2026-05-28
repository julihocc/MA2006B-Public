from _section_34_utils import toy_ecdh_exchange


if __name__ == "__main__":
    # Example: Alice uses a=5 and Bob uses b=7.
    alice_private = 5
    bob_private = 7
    exchange = toy_ecdh_exchange(alice_private, bob_private)

    assert exchange["alice_public"] == (9, 16)
    assert exchange["bob_public"] == (0, 6)
    assert exchange["alice_shared"] == (10, 11)

    print(f"Alice private a = {alice_private}")
    print(f"Bob private b = {bob_private}")
    print(f"Alice public A = aG = {exchange['alice_public']}")
    print(f"Bob public B = bG = {exchange['bob_public']}")
    print(f"Alice shared S_A = aB = {exchange['alice_shared']}")
    print(f"Bob shared S_B = bA = {exchange['bob_shared']}")
