from _real_curve_utils import RealEllipticCurve


if __name__ == "__main__":
    # Solved problem: Determine whether y^2 = x^3 - x is nonsingular.
    curve = RealEllipticCurve(a=-1, b=0)

    print(f"discriminant = {curve.discriminant()}")
    print(f"valid elliptic curve = {curve.is_nonsingular()}")
