from _finite_field_utils import inverse_table


def elements_without_inverses(modulus: int) -> list[int]:
    return [
        element
        for element, inverse in inverse_table(modulus).items()
        if inverse is None
    ]


if __name__ == "__main__":
    # Solved problem: Determine whether Z_9 is a field.
    modulus = 9

    missing = elements_without_inverses(modulus)
    print(f"nonzero elements without inverses modulo {modulus}: {missing}")
