from _finite_field_utils import inverse_table


if __name__ == "__main__":
    # Solved problem: List multiplicative inverses in Z_5.
    modulus = 5

    for element, inverse in inverse_table(modulus).items():
        print(f"{element}^(-1) = {inverse} mod {modulus}")
