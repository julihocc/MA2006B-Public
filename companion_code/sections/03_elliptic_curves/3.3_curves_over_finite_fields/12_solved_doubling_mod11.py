from _finite_curve_utils import FiniteFieldCurve


if __name__ == "__main__":
    # Solved problem: On y^2 = x^3 + x + 6 over F_11, compute 2P for P=(2,7).
    curve = FiniteFieldCurve(p=11, a=1, b=6)
    point = (2, 7)

    print(f"P on curve: {curve.contains(point)}")
    print(f"lambda = {curve.slope(point, point)}")
    print(f"2P = {curve.add(point, point)}")
