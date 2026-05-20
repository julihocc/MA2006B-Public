from _finite_curve_utils import FiniteFieldCurve, quadratic_residues


if __name__ == "__main__":
    # Example: Count points on y^2 = x^3 + x + 1 over F_5.
    curve = FiniteFieldCurve(p=5, a=1, b=1)
    comparison_curve = FiniteFieldCurve(p=5, a=1, b=2)

    affine_points = curve.affine_points()

    print(f"quadratic residues mod {curve.p}: {sorted(quadratic_residues(curve.p))}")
    for x, points in curve.points_by_x().items():
        rhs = curve.rhs(x)
        case = "r=0" if rhs == 0 else (
            "nonzero quadratic residue"
            if rhs in quadratic_residues(curve.p)
            else "quadratic non-residue"
        )
        print(f"x={x}: r={rhs}, case={case}, points={points or 'none'}")

    print(f"affine points: {affine_points}")
    print(f"number of affine points: {len(affine_points)}")
    print(f"curve order including O: {curve.order()}")

    print()
    print("Comparison curve y^2 = x^3 + x + 2 over F_5:")
    print(f"nonsingular = {comparison_curve.is_nonsingular()}")
    print(f"x=4 gives r={comparison_curve.rhs(4)}, points={comparison_curve.points_by_x()[4]}")
    print(f"x=1 gives r={comparison_curve.rhs(1)}, points={comparison_curve.points_by_x()[1]}")
