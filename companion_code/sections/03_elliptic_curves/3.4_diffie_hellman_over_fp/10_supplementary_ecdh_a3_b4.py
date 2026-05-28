from _section_34_utils import toy_ecdh_exchange


if __name__ == "__main__":
    # Supplementary problem: Alice chooses a=3 and Bob chooses b=4.
    alice_private = 3
    bob_private = 4
    exchange = toy_ecdh_exchange(alice_private, bob_private)

    assert exchange["alice_public"] == (10, 6)
    assert exchange["bob_public"] == (3, 1)
    assert exchange["alice_shared"] == exchange["bob_shared"] == (0, 11)

    print(f"Alice public A = {exchange['alice_public']}")
    print(f"Bob public B = {exchange['bob_public']}")
    print(f"Shared point S = {exchange['alice_shared']}")
