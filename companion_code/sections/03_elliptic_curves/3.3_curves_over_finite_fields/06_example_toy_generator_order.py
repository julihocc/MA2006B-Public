from _finite_curve_utils import FiniteFieldCurve, format_point


if __name__ == "__main__":
    # Example: On y^2 = x^3 + 2x + 2 over F_17, G=(5,1) has order 19.
    curve = FiniteFieldCurve(p=17, a=2, b=2)
    generator = (5, 1)

    print(f"G on curve: {curve.contains(generator)}")
    print(f"order of G: {curve.point_order(generator)}")
    print(f"19G = {format_point(curve.multiples(generator, 19)[-1])}")
