"""Shared utilities for the Section 3.4 Diffie-Hellman companion scripts.

Section 3.4 of the notes first studies classical Diffie-Hellman in the
multiplicative group F_23^*, then translates the same protocol shape to
elliptic-curve Diffie-Hellman on the toy curve

    E: y^2 = x^3 + 2x + 2 over F_17,

with base point G=(5, 1). The scripts in this directory are meant to verify
the arithmetic that appears in the notes, not to provide a general-purpose
cryptography library. This module therefore centralizes only the data and
short helper routines that are reused across those scripts:

- the classical Diffie-Hellman toy parameters,
- the toy curve from the notes,
- the selected base point and its order,
- the classical public-key and shared-secret computation,
- the public-key computation Q=dG,
- and the mirrored ECDH shared-point computation.

The actual finite-field elliptic-curve arithmetic lives in the Section 3.3
helper module. Reusing it here keeps the companion code aligned with the
pedagogical split in the notes: Section 3.3 defines the group operation, while
Section 3.4 applies that group operation to scalar multiplication and key
exchange.

This module deliberately raises errors for point-at-infinity public keys or
shared points in the toy ECDH helpers. The note examples choose nonzero private
scalars modulo the order of G, so those cases would signal either an invalid
example input or arithmetic drift in the companion code.
"""

from __future__ import annotations

import sys
from pathlib import Path


SECTION_ROOT = Path(__file__).resolve().parents[1]
SECTION_33_DIR = SECTION_ROOT / "3.3_curves_over_finite_fields"
sys.path.insert(0, str(SECTION_33_DIR))

# The 3.4 scripts are executed directly from their own files, not as an
# installed Python package. Adding the sibling Section 3.3 folder to sys.path
# lets those scripts import the finite-curve helper while preserving the
# directory layout that mirrors the lecture-note sections.
from _finite_curve_utils import (  # noqa: E402
    FiniteFieldCurve,
    Point,
    brute_force_discrete_log,
    double_and_add_operation_counts,
    format_point,
)

CLASSICAL_DH_PRIME = 23
CLASSICAL_DH_GENERATOR = 5


# The canonical toy curve from Section 3.4:
#
#     y^2 = x^3 + 2x + 2 (mod 17).
#
# It is intentionally tiny so students can inspect the full subgroup table by
# hand. It is not cryptographically secure.
TOY_CURVE = FiniteFieldCurve(p=17, a=2, b=2)

# The base point used throughout the Section 3.4 examples. The lecture notes
# verify that G lies on TOY_CURVE and that its first positive multiple equal to
# the point at infinity is 19G.
GENERATOR: Point = (5, 1)
GENERATOR_ORDER = 19


def classical_dh_exchange(alice_private: int, bob_private: int) -> dict[str, int]:
    """Run the Section 3.4 classical Diffie-Hellman toy computation.

    The note example uses the multiplicative group F_23^* with public
    generator g=5. Alice publishes A=g^a mod 23, Bob publishes B=g^b mod 23,
    and both compute the shared element g^(ab) mod 23.

    Parameters
    ----------
    alice_private:
        Alice's private exponent a.
    bob_private:
        Bob's private exponent b.

    Returns
    -------
    dict[str, int]
        A dictionary with ``alice_public``, ``bob_public``, ``alice_shared``,
        ``bob_shared``, and ``direct_shared``.

    Raises
    ------
    AssertionError
        If Alice's, Bob's, and the direct shared-secret computations do not
        match. Such a mismatch would indicate an inconsistent example.
    """
    p = CLASSICAL_DH_PRIME
    generator = CLASSICAL_DH_GENERATOR

    alice_public = pow(generator, alice_private, p)
    bob_public = pow(generator, bob_private, p)

    alice_shared = pow(bob_public, alice_private, p)
    bob_shared = pow(alice_public, bob_private, p)
    direct_shared = pow(generator, alice_private * bob_private, p)

    if alice_shared != bob_shared or alice_shared != direct_shared:
        raise AssertionError("classical DH shared-secret computations disagree")

    return {
        "alice_public": alice_public,
        "bob_public": bob_public,
        "alice_shared": alice_shared,
        "bob_shared": bob_shared,
        "direct_shared": direct_shared,
    }


def toy_public_key(private_scalar: int) -> Point:
    """Return the toy ECDH public point Q = dG.

    Parameters
    ----------
    private_scalar:
        The integer d used as the private scalar. In the note examples, d is
        chosen with 1 <= d <= GENERATOR_ORDER - 1.

    Returns
    -------
    Point
        The affine public point Q=dG on TOY_CURVE.

    Raises
    ------
    ValueError
        If dG is the point at infinity. That cannot happen for the private
        scalars used in the notes; if it occurs, the input scalar is a multiple
        of the order of G and is not a valid private key for the toy subgroup.
    """
    public_point = TOY_CURVE.scalar_multiply(private_scalar, GENERATOR)
    if public_point is None:
        raise ValueError("the public key is the point at infinity")
    return public_point


def toy_ecdh_exchange(alice_private: int, bob_private: int) -> dict[str, Point]:
    """Run the Section 3.4 toy ECDH computation.

    The protocol in the notes has the following structure:

    1. Alice chooses a private scalar a and publishes A=aG.
    2. Bob chooses a private scalar b and publishes B=bG.
    3. Alice computes S_A=aB=a(bG)=(ab)G.
    4. Bob computes S_B=bA=b(aG)=(ba)G.

    Since ordinary integer multiplication commutes, (ab)G=(ba)G, so both
    parties obtain the same shared point. This helper computes all three views
    of the shared point:

    - Alice's computation aB,
    - Bob's computation bA,
    - and the direct check (ab)G.

    Returning all values makes the scripts easy to compare with the note text
    and also gives a compact consistency check for the group law implementation.

    Parameters
    ----------
    alice_private:
        Alice's private scalar a.
    bob_private:
        Bob's private scalar b.

    Returns
    -------
    dict[str, Point]
        A dictionary with the affine points ``alice_public``, ``bob_public``,
        ``alice_shared``, ``bob_shared``, and ``direct_shared``.

    Raises
    ------
    ValueError
        If one of the shared-point computations is the point at infinity. This
        is outside the intended Section 3.4 toy examples.
    AssertionError
        If Alice's, Bob's, and the direct shared-point computations do not
        match. Such a mismatch would indicate a bug in the companion arithmetic
        or an inconsistent example.
    """
    alice_public = toy_public_key(alice_private)
    bob_public = toy_public_key(bob_private)

    alice_shared = TOY_CURVE.scalar_multiply(alice_private, bob_public)
    bob_shared = TOY_CURVE.scalar_multiply(bob_private, alice_public)
    direct_shared = TOY_CURVE.scalar_multiply(
        alice_private * bob_private,
        GENERATOR,
    )

    if alice_shared is None or bob_shared is None or direct_shared is None:
        raise ValueError("the shared point is the point at infinity")
    if alice_shared != bob_shared or alice_shared != direct_shared:
        raise AssertionError("ECDH shared-point computations disagree")

    return {
        "alice_public": alice_public,
        "bob_public": bob_public,
        "alice_shared": alice_shared,
        "bob_shared": bob_shared,
        "direct_shared": direct_shared,
    }
