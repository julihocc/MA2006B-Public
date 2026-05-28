from _finite_curve_utils import FiniteFieldCurve


if __name__ == "__main__":
    # Example: On y^2 = x^3 + 2x + 2 over F_17, double P=(5,1).
    curve = FiniteFieldCurve(p=17, a=2, b=2)
    point = (5, 1)

    assert curve.contains(point)
    assert curve.slope(point, point) == 13
    assert curve.add(point, point) == (6, 3)

    print(f"P on curve: {curve.contains(point)}")
    print(f"lambda = {curve.slope(point, point)}")
    print(f"2P = {curve.add(point, point)}")
