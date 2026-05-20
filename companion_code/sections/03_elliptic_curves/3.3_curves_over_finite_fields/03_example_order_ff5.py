from _finite_curve_utils import FiniteFieldCurve


if __name__ == "__main__":
    # Example: Count points on y^2 = x^3 + x + 1 over F_5.
    curve = FiniteFieldCurve(p=5, a=1, b=1)

    affine_points = curve.affine_points()

    print(f"affine points: {affine_points}")
    print(f"number of affine points: {len(affine_points)}")
    print(f"curve order including O: {curve.order()}")
