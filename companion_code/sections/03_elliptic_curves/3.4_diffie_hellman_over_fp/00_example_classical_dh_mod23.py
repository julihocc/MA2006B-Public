from _section_34_utils import (
    CLASSICAL_DH_GENERATOR,
    CLASSICAL_DH_PRIME,
    classical_dh_exchange,
)


if __name__ == "__main__":
    # Example: classical Diffie-Hellman in the multiplicative group F_23^*.
    alice_private = 6
    bob_private = 15
    exchange = classical_dh_exchange(alice_private, bob_private)

    assert exchange["alice_public"] == 8
    assert exchange["bob_public"] == 19
    assert exchange["alice_shared"] == exchange["bob_shared"] == 2

    print(f"Public group: F_{CLASSICAL_DH_PRIME}^*")
    print(f"Public generator: g = {CLASSICAL_DH_GENERATOR}")
    print(f"Alice private a = {alice_private}")
    print(f"Bob private b = {bob_private}")
    print(
        f"Alice public A = g^a mod {CLASSICAL_DH_PRIME} = "
        f"{exchange['alice_public']}"
    )
    print(
        f"Bob public B = g^b mod {CLASSICAL_DH_PRIME} = "
        f"{exchange['bob_public']}"
    )
    print(
        f"Alice shared B^a mod {CLASSICAL_DH_PRIME} = "
        f"{exchange['alice_shared']}"
    )
    print(
        f"Bob shared A^b mod {CLASSICAL_DH_PRIME} = "
        f"{exchange['bob_shared']}"
    )
