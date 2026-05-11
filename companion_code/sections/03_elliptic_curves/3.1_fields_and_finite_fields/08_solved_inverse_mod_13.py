from _finite_field_utils import extended_gcd


def extended_gcd_rows(a: int, b: int) -> list[tuple[int, int | None, int, int, int]]:
    rows = [(0, None, a, 1, 0), (1, None, b, 0, 1)]
    old_r, r = a, b
    old_s, s = 1, 0
    old_t, t = 0, 1
    index = 2

    while r != 0:
        quotient = old_r // r
        old_r, r = r, old_r - quotient * r
        old_s, s = s, old_s - quotient * s
        old_t, t = t, old_t - quotient * t
        rows.append((index, quotient, r, s, t))
        index += 1

    return rows


if __name__ == "__main__":
    # Solved problem: Compute 8^(-1) mod 13.
    modulus = 13
    element = 8

    gcd, coefficient, modulus_coefficient = extended_gcd(element, modulus)
    inverse = coefficient % modulus

    print("i  q  r   s   t")
    for index, quotient, remainder, s, t in extended_gcd_rows(modulus, element):
        if remainder == 0:
            continue
        q_text = "-" if quotient is None else str(quotient)
        print(f"{index:<2} {q_text:<2} {remainder:<3} {s:<3} {t:<3}")

    print(
        f"{gcd} = ({coefficient})*{element} "
        f"+ ({modulus_coefficient})*{modulus}"
    )
    print(f"{element}^(-1) = {inverse} mod {modulus}")
