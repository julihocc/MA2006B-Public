from _finite_field_utils import mod_inverse, multiplication_residues


if __name__ == "__main__":
    # Example: Show that 2 has no inverse modulo 6.
    modulus = 6
    element = 2

    residues = multiplication_residues(element, modulus)
    inverse = mod_inverse(element, modulus)

    print(f"{element} * x mod {modulus} for x = 0,...,{modulus - 1}:")
    print(residues)
    print(f"inverse of {element} modulo {modulus}: {inverse}")
