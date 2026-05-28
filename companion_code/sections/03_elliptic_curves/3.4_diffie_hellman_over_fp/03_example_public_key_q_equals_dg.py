from _section_34_utils import GENERATOR, TOY_CURVE


if __name__ == "__main__":
    # Example: a private scalar d gives the public point Q=dG.
    private_scalar = 5
    public_point = TOY_CURVE.scalar_multiply(private_scalar, GENERATOR)

    assert public_point == (9, 16)

    print(f"private d = {private_scalar}")
    print(f"public G = {GENERATOR}")
    print(f"public Q = dG = {public_point}")
