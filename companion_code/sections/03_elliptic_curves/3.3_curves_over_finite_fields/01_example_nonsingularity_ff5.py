from _finite_curve_utils import FiniteFieldCurve


if __name__ == "__main__":
    # Example: y^2 = x^3 + x + 1 over F_5 is nonsingular.
    curve = FiniteFieldCurve(p=5, a=1, b=1)

    print(f"4a^3 + 27b^2 mod {curve.p} = {curve.discriminant_condition()}")
    print(f"nonsingular = {curve.is_nonsingular()}")
