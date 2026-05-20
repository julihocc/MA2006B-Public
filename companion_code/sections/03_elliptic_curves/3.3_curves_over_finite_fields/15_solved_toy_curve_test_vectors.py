from _finite_curve_utils import FiniteFieldCurve, format_point


if __name__ == "__main__":
    # Solved problem: Test vectors on y^2 = x^3 + 2x + 2 over F_17 with G=(5,1).
    curve = FiniteFieldCurve(p=17, a=2, b=2)
    generator = (5, 1)

    for k in [2, 3, 10, 19]:
        print(f"{k}G = {format_point(curve.scalar_multiply(k, generator))}")
