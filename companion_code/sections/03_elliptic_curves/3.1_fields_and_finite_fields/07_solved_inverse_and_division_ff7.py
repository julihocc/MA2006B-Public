from _finite_field_utils import divide_mod, mod_inverse


if __name__ == "__main__":
    # Solved problem: Compute 3^(-1) mod 7 and 5 / 3 in F_7.
    p = 7
    denominator = 3
    numerator = 5

    print(f"{denominator}^(-1) = {mod_inverse(denominator, p)} mod {p}")
    print(f"{numerator} / {denominator} = {divide_mod(numerator, denominator, p)} in F_{p}")
