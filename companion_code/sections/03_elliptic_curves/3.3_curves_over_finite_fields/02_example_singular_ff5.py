from _finite_curve_utils import FiniteFieldCurve


if __name__ == "__main__":
    # Example: y^2 = x^3 + 2x + 2 is singular over F_5.
    curve = FiniteFieldCurve(p=5, a=2, b=2)
    singular_candidate = (1, 0)

    integer_discriminant_condition = 4 * curve.a**3 + 27 * curve.b**2

    print(f"4a^3 + 27b^2 over the integers = {integer_discriminant_condition}")
    print(f"4a^3 + 27b^2 mod {curve.p} = {curve.discriminant_condition()}")
    print(f"nonsingular = {curve.is_nonsingular()}")
    print(f"(1,0) on curve = {curve.contains(singular_candidate)}")
