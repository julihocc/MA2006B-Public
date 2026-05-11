"""Toy ECC helpers for introductory examples."""

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
class DomainParameters:
    """ECC domain parameters (p, a, b, G, n, h)."""

    p: int
    a: int
    b: int
    generator: Point
    n: int
    h: int

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

    def scalar_multiply(self, k: int, point: Point | None = None) -> Point | None:
        if point is None:
            point = self.generator
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

    def public_key(self, private_key: int) -> Point | None:
        return self.scalar_multiply(private_key, self.generator)

    def shared_secret(self, private_key: int, peer_public_key: Point) -> Point | None:
        return self.scalar_multiply(private_key, peer_public_key)

    def brute_force_discrete_log(self, public_key: Point) -> int | None:
        for k in range(1, self.n):
            if self.scalar_multiply(k, self.generator) == public_key:
                return k
        return None

    def generator_has_declared_order(self) -> bool:
        return self.scalar_multiply(self.n, self.generator) is INFINITY


def ecdh_exchange(
    params: DomainParameters,
    alice_private: int,
    bob_private: int,
) -> tuple[Point | None, Point | None, Point | None, Point | None]:
    alice_public = params.public_key(alice_private)
    bob_public = params.public_key(bob_private)
    if alice_public is INFINITY or bob_public is INFINITY:
        raise ValueError("public keys must not be O in this toy exchange")

    alice_secret = params.shared_secret(alice_private, bob_public)
    bob_secret = params.shared_secret(bob_private, alice_public)
    return alice_public, bob_public, alice_secret, bob_secret


def security_size_table() -> list[tuple[int, int, int, int]]:
    """Return rows as (security_bits, ecc_bits, rsa_dh_bits, symmetric_bits)."""
    return [
        (80, 160, 1024, 80),
        (128, 256, 3072, 128),
        (192, 384, 7680, 192),
        (256, 521, 15360, 256),
    ]
