from math import isqrt


def generic_ecdlp_work_factor(order_bits: int) -> int:
    return 2 ** (order_bits // 2)


if __name__ == "__main__":
    # Solved problem: ECDLP attacks on a random order-n curve cost about O(sqrt(n)).
    order_bits = 256

    print(f"curve order size: about 2^{order_bits}")
    print(f"generic ECDLP work factor: about 2^{order_bits // 2}")
    print(f"sqrt(2^{order_bits}) = {isqrt(2**order_bits)}")
