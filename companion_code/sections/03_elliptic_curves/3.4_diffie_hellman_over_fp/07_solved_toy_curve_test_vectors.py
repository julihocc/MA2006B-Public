from _section_34_utils import GENERATOR, TOY_CURVE, format_point


if __name__ == "__main__":
    # Solved problem: compute 2G, 3G, 10G, and verify 19G=O.
    expected = {
        2: (6, 3),
        3: (10, 6),
        10: (7, 11),
        19: None,
    }

    for k, expected_point in expected.items():
        point = TOY_CURVE.scalar_multiply(k, GENERATOR)
        assert point == expected_point
        print(f"{k}G = {format_point(point)}")
