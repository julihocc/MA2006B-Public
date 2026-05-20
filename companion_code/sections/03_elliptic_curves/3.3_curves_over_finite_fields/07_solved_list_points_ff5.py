from _finite_curve_utils import FiniteFieldCurve, quadratic_residues


if __name__ == "__main__":
    # Solved problem: Find all points on y^2 = x^3 + x + 1 over F_5.
    curve = FiniteFieldCurve(p=5, a=1, b=1)

    print(f"quadratic residues mod {curve.p}: {sorted(quadratic_residues(curve.p))}")
    for x, points in curve.points_by_x().items():
        print(f"x={x}: rhs={curve.rhs(x)}, points={points}")
    print(f"order including O: {curve.order()}")
