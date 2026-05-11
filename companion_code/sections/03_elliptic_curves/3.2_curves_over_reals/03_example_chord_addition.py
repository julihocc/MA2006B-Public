from _real_curve_utils import RealEllipticCurve


if __name__ == "__main__":
    # Example: On y^2 = x^3 - x + 1, compute P + Q for P=(0,1), Q=(1,1).
    curve = RealEllipticCurve(a=-1, b=1)
    p = (0, 1)
    q = (1, 1)

    r = curve.add(p, q)

    print(f"P on curve: {curve.contains(p)}")
    print(f"Q on curve: {curve.contains(q)}")
    print(f"P + Q = {r}")
