from _real_curve_utils import INFINITY, RealEllipticCurve


def format_point(point):
    return "cal(O)" if point is INFINITY else point


if __name__ == "__main__":
    # Example: On y^2 = x^3 + 1, P=(0,1) satisfies 3P = cal(O).
    curve = RealEllipticCurve(a=0, b=1)
    point = (0, 1)

    double = curve.add(point, point)
    triple = curve.add(double, point)

    print(f"E is non-singular: {curve.is_nonsingular()}")
    print(f"P on curve: {curve.contains(point)}")
    print(f"2P = {format_point(double)}")
    print(f"3P = {format_point(triple)}")
