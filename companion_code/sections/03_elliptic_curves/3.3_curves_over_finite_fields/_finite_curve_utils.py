"""Helpers for elliptic curves over prime finite fields."""

from __future__ import annotations

from dataclasses import dataclass
from math import sqrt


Point = tuple[int, int]
INFINITY = None


def mod_inverse(a: int, p: int) -> int:
    """Return a^(-1) modulo the prime p."""
    a %= p
    if a == 0:
        raise ZeroDivisionError("0 has no inverse modulo p")
    return pow(a, -1, p)


def quadratic_residues(p: int) -> set[int]:
    return {(y * y) % p for y in range(p)}


def square_roots_mod(value: int, p: int) -> list[int]:
    value %= p
    return [y for y in range(p) if (y * y) % p == value]


def hasse_interval(p: int) -> tuple[float, float]:
    center = p + 1
    radius = 2 * sqrt(p)
    return center - radius, center + radius


def trace_of_frobenius(p: int, order: int) -> int:
    return p + 1 - order


def format_point(point: Point | None) -> str:
    return "O" if point is INFINITY else str(point)


@dataclass(frozen=True)
class FiniteFieldCurve:
    """Curve y^2 = x^3 + ax + b over F_p."""

    p: int
    a: int
    b: int

    def __post_init__(self) -> None:
        if self.p <= 3:
            raise ValueError("this helper assumes p > 3")

    def rhs(self, x: int) -> int:
        return (x**3 + self.a * x + self.b) % self.p

    def discriminant_condition(self) -> int:
        """Return 4a^3 + 27b^2 modulo p."""
        return (4 * self.a**3 + 27 * self.b**2) % self.p

    def is_nonsingular(self) -> bool:
        return self.discriminant_condition() != 0

    def contains(self, point: Point | None) -> bool:
        if point is INFINITY:
            return True
        x, y = point
        return (y * y - x**3 - self.a * x - self.b) % self.p == 0

    def negate(self, point: Point | None) -> Point | None:
        if point is INFINITY:
            return INFINITY
        x, y = point
        return (x % self.p, (-y) % self.p)

    def add(self, p1: Point | None, p2: Point | None) -> Point | None:
        if p1 is INFINITY:
            return p2
        if p2 is INFINITY:
            return p1

        x1, y1 = p1
        x2, y2 = p2

        if x1 % self.p == x2 % self.p and (y1 + y2) % self.p == 0:
            return INFINITY

        if p1 == p2:
            slope = (3 * x1**2 + self.a) * mod_inverse(2 * y1, self.p)
        else:
            slope = (y2 - y1) * mod_inverse(x2 - x1, self.p)

        slope %= self.p
        x3 = (slope**2 - x1 - x2) % self.p
        y3 = (slope * (x1 - x3) - y1) % self.p
        return (x3, y3)

    def points_by_x(self) -> dict[int, list[Point]]:
        result: dict[int, list[Point]] = {}
        for x in range(self.p):
            roots = square_roots_mod(self.rhs(x), self.p)
            result[x] = [(x, y) for y in roots]
        return result

    def affine_points(self) -> list[Point]:
        points: list[Point] = []
        for x_points in self.points_by_x().values():
            points.extend(x_points)
        return points

    def order(self) -> int:
        return len(self.affine_points()) + 1

    def multiples(self, point: Point, count: int) -> list[Point | None]:
        multiples: list[Point | None] = []
        current: Point | None = INFINITY
        for _ in range(count):
            current = self.add(current, point)
            multiples.append(current)
        return multiples

    def point_order(self, point: Point, *, limit: int | None = None) -> int:
        if not self.contains(point):
            raise ValueError(f"{point} is not on the curve")
        max_steps = limit or self.p + 1 + int(2 * sqrt(self.p)) + 2
        current: Point | None = INFINITY
        for n in range(1, max_steps + 1):
            current = self.add(current, point)
            if current is INFINITY:
                return n
        raise ValueError("point order not found within search limit")
