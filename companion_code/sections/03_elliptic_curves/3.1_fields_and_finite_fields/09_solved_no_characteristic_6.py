def is_prime(n: int) -> bool:
    if n < 2:
        return False
    return all(n % divisor != 0 for divisor in range(2, n))


def can_be_field_characteristic(n: int) -> bool:
    return n == 0 or is_prime(n)


if __name__ == "__main__":
    # Solved problem: Can a field have characteristic 6?
    characteristic = 6
    factor_a = 2
    factor_b = 3

    print(
        f"can {characteristic} be the characteristic of a field? "
        f"{can_be_field_characteristic(characteristic)}"
    )
    print(
        f"reason: {factor_a}*1 and {factor_b}*1 would be nonzero, "
        f"but their product is {characteristic}*1 = 0"
    )
