from _finite_field_utils import characteristic_of_prime_field, residue


def repeated_one_sums(modulus: int) -> list[int]:
    return [residue(k, modulus) for k in range(1, modulus + 1)]


if __name__ == "__main__":
    # Example: The characteristic of F_7 is 7.
    p = 7

    print(f"1, 1+1, ..., {p} copies of 1 in F_{p}:")
    print(repeated_one_sums(p))
    print(f"characteristic of F_{p}: {characteristic_of_prime_field(p)}")
