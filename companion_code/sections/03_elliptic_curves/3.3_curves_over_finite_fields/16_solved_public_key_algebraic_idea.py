from _finite_curve_utils import FiniteFieldCurve, brute_force_discrete_log


if __name__ == "__main__":
    # Solved problem: Explain algebraically why Q = dG is easy forward and hard backward.
    curve = FiniteFieldCurve(p=17, a=2, b=2)
    generator = (5, 1)
    private_scalar = 10
    public_point = curve.scalar_multiply(private_scalar, generator)

    recovered = brute_force_discrete_log(curve, generator, public_point, upper_bound=19)

    print(f"forward direction: d={private_scalar} gives Q={public_point}")
    print(f"toy reverse direction by brute force: recovered d = {recovered}")
    print("on large standardized curves, brute force is computationally infeasible")
