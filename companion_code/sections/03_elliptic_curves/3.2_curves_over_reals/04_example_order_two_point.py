from _real_curve_utils import INFINITY, RealEllipticCurve


def format_point(point):
    return "O" if point is INFINITY else point


if __name__ == "__main__":
    # Example: On y^2 = x^3 - x, P=(1,0) satisfies 2P = cal(O).
    curve = RealEllipticCurve(a=-1, b=0)
    point = (1, 0)

    doubled = curve.add(point, point)

    print(f"P on curve: {curve.contains(point)}")
    print(f"2P = {format_point(doubled)}")
