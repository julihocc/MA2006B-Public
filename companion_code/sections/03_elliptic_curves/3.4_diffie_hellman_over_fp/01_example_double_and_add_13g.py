from _section_34_utils import GENERATOR, TOY_CURVE, format_point


if __name__ == "__main__":
    # Example: compute 13G by double-and-add on the toy curve.
    k = 13
    powers = {
        1: TOY_CURVE.scalar_multiply(1, GENERATOR),
        2: TOY_CURVE.scalar_multiply(2, GENERATOR),
        4: TOY_CURVE.scalar_multiply(4, GENERATOR),
        8: TOY_CURVE.scalar_multiply(8, GENERATOR),
    }
    partial_sum = TOY_CURVE.add(powers[8], powers[4])
    result = TOY_CURVE.add(partial_sum, powers[1])

    assert result == TOY_CURVE.scalar_multiply(k, GENERATOR) == (16, 4)

    print(f"{k} in binary: {k:b}")
    for power, point in powers.items():
        print(f"{power}G = {format_point(point)}")
    print(f"8G + 4G = {format_point(partial_sum)}")
    print(f"13G = 8G + 4G + G = {format_point(result)}")
