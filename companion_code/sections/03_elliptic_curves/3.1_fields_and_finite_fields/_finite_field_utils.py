"""Small helpers for modular arithmetic in finite-field examples."""


def residue(value: int, modulus: int) -> int:
    """Return the standard representative of value modulo modulus."""
    if modulus <= 0:
        raise ValueError("modulus must be positive")
    return value % modulus


def extended_gcd(a: int, b: int) -> tuple[int, int, int]:
    """Return (g, x, y) with g = gcd(a, b) and ax + by = g."""
    old_r, r = a, b
    old_s, s = 1, 0
    old_t, t = 0, 1

    while r != 0:
        quotient = old_r // r
        old_r, r = r, old_r - quotient * r
        old_s, s = s, old_s - quotient * s
        old_t, t = t, old_t - quotient * t

    return abs(old_r), old_s, old_t


def mod_inverse(a: int, modulus: int) -> int | None:
    """Return a^(-1) modulo modulus, or None if no inverse exists."""
    g, x, _ = extended_gcd(a, modulus)
    if g != 1:
        return None
    return x % modulus


def inverse_table(modulus: int) -> dict[int, int | None]:
    """Return inverses for the nonzero residue classes modulo modulus."""
    return {a: mod_inverse(a, modulus) for a in range(1, modulus)}


def divide_mod(numerator: int, denominator: int, modulus: int) -> int:
    """Compute numerator / denominator modulo modulus."""
    inverse = mod_inverse(denominator, modulus)
    if inverse is None:
        raise ZeroDivisionError(
            f"{denominator} has no inverse modulo {modulus}"
        )
    return (numerator * inverse) % modulus


def multiplication_residues(a: int, modulus: int) -> list[int]:
    """Return [a*x mod modulus for x = 0, 1, ..., modulus - 1]."""
    return [(a * x) % modulus for x in range(modulus)]


def characteristic_of_prime_field(p: int) -> int:
    """Return the characteristic of F_p."""
    if p <= 1:
        raise ValueError("p must be prime")
    return p
