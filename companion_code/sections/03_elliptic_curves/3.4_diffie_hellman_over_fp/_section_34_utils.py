"""Utilities for the section 3.4 ECDH companion scripts."""

from __future__ import annotations

import sys
from pathlib import Path


SECTION_ROOT = Path(__file__).resolve().parents[1]
SECTION_33_DIR = SECTION_ROOT / "3.3_curves_over_finite_fields"
sys.path.insert(0, str(SECTION_33_DIR))

from _finite_curve_utils import (  # noqa: E402
    FiniteFieldCurve,
    Point,
    brute_force_discrete_log,
    double_and_add_operation_counts,
    format_point,
)


TOY_CURVE = FiniteFieldCurve(p=17, a=2, b=2)
GENERATOR: Point = (5, 1)
GENERATOR_ORDER = 19


def toy_public_key(private_scalar: int) -> Point:
    public_point = TOY_CURVE.scalar_multiply(private_scalar, GENERATOR)
    if public_point is None:
        raise ValueError("the public key is the point at infinity")
    return public_point


def toy_ecdh_exchange(alice_private: int, bob_private: int) -> dict[str, Point]:
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
