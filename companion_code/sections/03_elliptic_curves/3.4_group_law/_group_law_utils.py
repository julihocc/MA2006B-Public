"""Group-law helpers for elliptic curves over prime finite fields."""

from __future__ import annotations

from dataclasses import dataclass


Point = tuple[int, int]
INFINITY = None


def mod_inverse(value: int, p: int) -> int:
    value %= p
    if value == 0:
        raise ZeroDivisionError("0 has no inverse modulo p")
    return pow(value, -1, p)


def format_point(point: Point | None) -> str:
    return "O" if point is INFINITY else str(point)


@dataclass(frozen=True)
class Curve:
    """Curve y^2 = x^3 + ax + b over F_p."""

    p: int
    a: int
    b: int

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

    def slope(self, p1: Point, p2: Point) -> int:
        x1, y1 = p1
        x2, y2 = p2
        if p1 == p2:
            return ((3 * x1**2 + self.a) * mod_inverse(2 * y1, self.p)) % self.p
        return ((y2 - y1) * mod_inverse(x2 - x1, self.p)) % self.p

    def add(self, p1: Point | None, p2: Point | None) -> Point | None:
        if p1 is INFINITY:
            return p2
        if p2 is INFINITY:
            return p1

        x1, y1 = p1
        x2, y2 = p2

        if x1 % self.p == x2 % self.p and (y1 + y2) % self.p == 0:
            return INFINITY

        lam = self.slope(p1, p2)
        x3 = (lam**2 - x1 - x2) % self.p
        y3 = (lam * (x1 - x3) - y1) % self.p
        return (x3, y3)

    def scalar_multiply(self, k: int, point: Point | None) -> Point | None:
        if k < 0:
            return self.scalar_multiply(-k, self.negate(point))

        result: Point | None = INFINITY
        addend = point
        while k > 0:
            if k & 1:
                result = self.add(result, addend)
            addend = self.add(addend, addend)
            k >>= 1
        return result

    def scalar_multiply_trace(self, k: int, point: Point) -> list[str]:
        """Return a compact trace of the left-to-right values used by double-and-add."""
        result: Point | None = INFINITY
        addend: Point | None = point
        trace: list[str] = []
        bit_index = 0

        while k > 0:
            bit = k & 1
            if bit:
                result = self.add(result, addend)
                trace.append(f"bit {bit_index}=1: Q <- {format_point(result)}")
            else:
                trace.append(f"bit {bit_index}=0: Q unchanged")
            addend = self.add(addend, addend)
            trace.append(f"double: R <- {format_point(addend)}")
            bit_index += 1
            k >>= 1

        return trace


def double_and_add_operation_counts(k: int) -> tuple[int, int]:
    """Return (doublings, additions) for the simple bit-scanning algorithm."""
    if k <= 0:
        return 0, 0
    bits = k.bit_length()
    additions = k.bit_count()
    return bits - 1, additions - 1
