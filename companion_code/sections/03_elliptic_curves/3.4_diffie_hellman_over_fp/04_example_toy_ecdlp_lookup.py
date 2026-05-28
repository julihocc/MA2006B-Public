from _section_34_utils import (
    GENERATOR,
    GENERATOR_ORDER,
    TOY_CURVE,
    brute_force_discrete_log,
)


if __name__ == "__main__":
    # Example: recover d from Q=dG by brute force in the tiny toy subgroup.
    target_public = (9, 16)
    recovered = brute_force_discrete_log(
        TOY_CURVE,
        GENERATOR,
        target_public,
        upper_bound=GENERATOR_ORDER,
    )

    assert recovered == 5

    print(f"G = {GENERATOR}")
    print(f"Q = {target_public}")
    print(f"toy discrete logarithm d = {recovered}")
    print("This search is only feasible because the subgroup is tiny.")
