"""Helpers for short Weierstrass curves over the real numbers."""

from __future__ import annotations

from dataclasses import dataclass
from math import isclose


Point = tuple[float, float]
INFINITY = None


@dataclass(frozen=True)
class RealEllipticCurve:
    """Curve y^2 = x^3 + ax + b over R."""

    a: float
    b: float

    def rhs(self, x: float) -> float:
        return x**3 + self.a * x + self.b

    def discriminant(self) -> float:
        return -16 * (4 * self.a**3 + 27 * self.b**2)

    def is_nonsingular(self) -> bool:
        return not isclose(self.discriminant(), 0.0, abs_tol=1e-12)

    def contains(self, point: Point, *, tolerance: float = 1e-9) -> bool:
        x, y = point
        return isclose(y**2, self.rhs(x), abs_tol=tolerance)

    def negate(self, point: Point | None) -> Point | None:
        if point is INFINITY:
            return INFINITY
        x, y = point
        return (x, -y)

    def add(self, p: Point | None, q: Point | None) -> Point | None:
        """Add two points using the affine chord-and-tangent formulas."""
        if p is INFINITY:
            return q
        if q is INFINITY:
            return p

        x1, y1 = p
        x2, y2 = q

        if isclose(x1, x2, abs_tol=1e-12) and isclose(y1, -y2, abs_tol=1e-12):
            return INFINITY

        if isclose(x1, x2, abs_tol=1e-12) and isclose(y1, y2, abs_tol=1e-12):
            if isclose(y1, 0.0, abs_tol=1e-12):
                return INFINITY
            slope = (3 * x1**2 + self.a) / (2 * y1)
        else:
            slope = (y2 - y1) / (x2 - x1)

        x3 = slope**2 - x1 - x2
        y3 = slope * (x1 - x3) - y1
        return (clean_float(x3), clean_float(y3))


def clean_float(value: float) -> float | int:
    rounded = round(value)
    if isclose(value, rounded, abs_tol=1e-12):
        return rounded
    return value


def cubic_repeated_root_condition(a: float, b: float) -> float:
    """Return 4a^3 + 27b^2, whose vanishing indicates singularity."""
    return 4 * a**3 + 27 * b**2


def singular_points_for_short_weierstrass(
    curve: RealEllipticCurve,
) -> list[Point]:
    """Find obvious real singular points using partial derivative equations."""
    candidates: list[Point] = []

    if isclose(curve.a, 0.0, abs_tol=1e-12):
        possible_x_values = [0.0]
    elif curve.a < 0:
        root = (-curve.a / 3) ** 0.5
        possible_x_values = [root, -root]
    else:
        possible_x_values = []

    for x in possible_x_values:
        point = (x, 0.0)
        if curve.contains(point):
            candidates.append((clean_float(x), 0))

    return candidates
