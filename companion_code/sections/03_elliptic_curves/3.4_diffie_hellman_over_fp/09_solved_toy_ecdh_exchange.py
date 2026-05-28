from _section_34_utils import GENERATOR, TOY_CURVE, toy_ecdh_exchange


if __name__ == "__main__":
    # Solved problem: verify the toy ECDH exchange with a=5 and b=7.
    alice_private = 5
    bob_private = 7
    exchange = toy_ecdh_exchange(alice_private, bob_private)
    reduced_scalar = (alice_private * bob_private) % TOY_CURVE.point_order(GENERATOR)

    assert reduced_scalar == 16
    assert exchange["alice_public"] == (9, 16)
    assert exchange["bob_public"] == (0, 6)
    assert exchange["alice_shared"] == exchange["bob_shared"] == (10, 11)

    print(f"A = {alice_private}G = {exchange['alice_public']}")
    print(f"B = {bob_private}G = {exchange['bob_public']}")
    print(f"{alice_private * bob_private}G = {reduced_scalar}G")
    print(f"S_A = {exchange['alice_shared']}")
    print(f"S_B = {exchange['bob_shared']}")
