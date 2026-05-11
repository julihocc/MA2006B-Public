from _finite_field_utils import extended_gcd


if __name__ == "__main__":
    # Solved problem: Compute 8^(-1) mod 13.
    modulus = 13
    element = 8

    gcd, coefficient, modulus_coefficient = extended_gcd(element, modulus)
    inverse = coefficient % modulus

    print(
        f"{gcd} = ({coefficient})*{element} "
        f"+ ({modulus_coefficient})*{modulus}"
    )
    print(f"{element}^(-1) = {inverse} mod {modulus}")
