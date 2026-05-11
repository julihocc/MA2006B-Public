from _finite_field_utils import divide_mod, mod_inverse


if __name__ == "__main__":
    # Example: In F_7, find 3^(-1), then compute 4 / 3.
    p = 7
    denominator = 3
    numerator = 4

    inverse = mod_inverse(denominator, p)
    quotient = divide_mod(numerator, denominator, p)

    print(f"{denominator}^(-1) = {inverse} mod {p}")
    print(f"{numerator} / {denominator} = {quotient} in F_{p}")
