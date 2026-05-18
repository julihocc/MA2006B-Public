from _real_curve_utils import RealEllipticCurve


if __name__ == "__main__":
    # Example: If P = (x, y) is on E(R), then overline(P) = (x, -y) is also on E(R).
    curve = RealEllipticCurve(a=-1, b=1)
    point = (0, 1)

    inverse = curve.negate(point)

    print(f"P = {point}, on curve = {curve.contains(point)}")
    print(f"overline(P) = {inverse}, on curve = {curve.contains(inverse)}")
