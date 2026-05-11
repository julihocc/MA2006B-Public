from _finite_field_utils import characteristic_of_prime_field


def characteristic_of_standard_number_field() -> int:
    """Characteristic of Q, R, or C."""
    return 0


if __name__ == "__main__":
    # Solved problem: Determine the characteristic of R and F_7.
    p = 7

    print(f"characteristic of R: {characteristic_of_standard_number_field()}")
    print(f"characteristic of F_{p}: {characteristic_of_prime_field(p)}")
