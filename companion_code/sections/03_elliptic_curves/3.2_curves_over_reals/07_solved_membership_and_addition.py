from _real_curve_utils import RealEllipticCurve


if __name__ == "__main__":
    # Solved problem: Verify P=(0,1), Q=(1,1), then compute P op Q geometrically.
    curve = RealEllipticCurve(a=-1, b=1)
    p = (0, 1)
    q = (1, 1)

    print(f"P on curve: {curve.contains(p)}")
    print(f"Q on curve: {curve.contains(q)}")
    print(f"P op Q = {curve.add(p, q)}")
