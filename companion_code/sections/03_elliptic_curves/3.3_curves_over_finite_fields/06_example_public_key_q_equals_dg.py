from _finite_curve_utils import FiniteFieldCurve


if __name__ == "__main__":
    # Example: In a toy public/private key picture, Q = dG with d private.
    curve = FiniteFieldCurve(p=17, a=2, b=2)
    generator = (5, 1)
    private_scalar = 10
    public_point = curve.scalar_multiply(private_scalar, generator)

    print(f"G = {generator}")
    print(f"private d = {private_scalar}")
    print(f"public Q = dG = {public_point}")
