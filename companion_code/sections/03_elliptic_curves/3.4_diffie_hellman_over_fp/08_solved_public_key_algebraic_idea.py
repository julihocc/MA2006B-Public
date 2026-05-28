from _section_34_utils import (
    GENERATOR,
    GENERATOR_ORDER,
    TOY_CURVE,
    brute_force_discrete_log,
)


if __name__ == "__main__":
    # Solved problem: Q=dG is easy forward and hard backward on large groups.
    private_scalar = 5
    public_point = TOY_CURVE.scalar_multiply(private_scalar, GENERATOR)
    recovered = brute_force_discrete_log(
        TOY_CURVE,
        GENERATOR,
        public_point,
        upper_bound=GENERATOR_ORDER,
    )

    assert public_point == (9, 16)
    assert recovered == private_scalar

    print(f"forward direction: d={private_scalar} gives Q={public_point}")
    print(f"toy reverse direction by brute force: recovered d={recovered}")
    print("On large standardized curves, brute force is computationally infeasible.")
