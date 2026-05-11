from _finite_field_utils import mod_inverse


if __name__ == "__main__":
    # Solved problem: Compute 8^(-1) mod 13.
    modulus = 13
    element = 8

    print(f"{element}^(-1) = {mod_inverse(element, modulus)} mod {modulus}")
