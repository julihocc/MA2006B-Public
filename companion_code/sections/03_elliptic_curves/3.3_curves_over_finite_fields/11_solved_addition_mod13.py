from _finite_curve_utils import FiniteFieldCurve


if __name__ == "__main__":
    # Solved problem: On y^2 = x^3 + 3x + 8 over F_13, compute P + Q.
    curve = FiniteFieldCurve(p=13, a=3, b=8)
    p = (1, 5)
    q = (9, 6)

    print(f"P on curve: {curve.contains(p)}")
    print(f"Q on curve: {curve.contains(q)}")
    print(f"lambda = {curve.slope(p, q)}")
    print(f"P + Q = {curve.add(p, q)}")
