from _real_curve_utils import RealEllipticCurve


if __name__ == "__main__":
    # Example: Compare E_1: y^2 = x^3 - x + 1 and E_2: y^2 = x^3.
    curves = {
        "E_1": RealEllipticCurve(a=-1, b=1),
        "E_2": RealEllipticCurve(a=0, b=0),
    }

    for name, curve in curves.items():
        print(f"{name}: discriminant = {curve.discriminant()}")
        print(f"{name}: nonsingular = {curve.is_nonsingular()}")
