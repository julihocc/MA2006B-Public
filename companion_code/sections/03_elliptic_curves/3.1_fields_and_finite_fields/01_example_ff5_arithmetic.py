from _finite_field_utils import residue


def add_mod(a: int, b: int, modulus: int) -> int:
    return residue(a + b, modulus)


def multiply_mod(a: int, b: int, modulus: int) -> int:
    return residue(a * b, modulus)


if __name__ == "__main__":
    # Example: In F_5, compute 3 + 4 and 3 * 4 modulo 5.
    p = 5
    a = 3
    b = 4

    print(f"{a} + {b} = {add_mod(a, b, p)} mod {p}")
    print(f"{a} * {b} = {multiply_mod(a, b, p)} mod {p}")
