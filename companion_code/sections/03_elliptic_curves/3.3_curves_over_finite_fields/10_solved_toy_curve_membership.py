from _finite_curve_utils import FiniteFieldCurve


if __name__ == "__main__":
    # Solved problem: Check nonsingularity and membership for y^2 = x^3 + 2x + 2 over F_17.
    curve = FiniteFieldCurve(p=17, a=2, b=2)
    generator = (5, 1)

    print(f"4a^3 + 27b^2 mod {curve.p} = {curve.discriminant_condition()}")
    print(f"nonsingular = {curve.is_nonsingular()}")
    print(f"G on curve = {curve.contains(generator)}")
    print("membership test: (y*y - x**3 - a*x - b) % p == 0")
