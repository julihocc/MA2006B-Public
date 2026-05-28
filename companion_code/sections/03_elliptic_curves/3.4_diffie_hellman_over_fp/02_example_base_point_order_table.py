from _section_34_utils import GENERATOR, GENERATOR_ORDER, TOY_CURVE, format_point


if __name__ == "__main__":
    # Example: verify the order-19 table for G=(5,1).
    computed_order = TOY_CURVE.point_order(GENERATOR)
    assert computed_order == GENERATOR_ORDER

    print(f"G = {GENERATOR}")
    print(f"G on curve: {TOY_CURVE.contains(GENERATOR)}")
    print(f"order of G: {computed_order}")
    for k in range(1, GENERATOR_ORDER + 1):
        point = TOY_CURVE.scalar_multiply(k, GENERATOR)
        print(f"{k:2d}G = {format_point(point)}")
