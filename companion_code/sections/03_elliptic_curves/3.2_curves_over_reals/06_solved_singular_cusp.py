from _real_curve_utils import RealEllipticCurve, singular_points_for_short_weierstrass


if __name__ == "__main__":
    # Solved problem: Show that y^2 = x^3 is singular.
    curve = RealEllipticCurve(a=0, b=0)

    print(f"discriminant = {curve.discriminant()}")
    print(f"nonsingular = {curve.is_nonsingular()}")
    print(f"singular points from partial derivatives: {singular_points_for_short_weierstrass(curve)}")
