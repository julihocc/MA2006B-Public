from _finite_curve_utils import FiniteFieldCurve


if __name__ == "__main__":
    # Solved problem: Verify P=(2,1) on y^2 = x^3 + 2x + 3 over F_7 and find -P.
    curve = FiniteFieldCurve(p=7, a=2, b=3)
    point = (2, 1)

    print(f"P on curve: {curve.contains(point)}")
    print(f"-P = {curve.negate(point)}")
