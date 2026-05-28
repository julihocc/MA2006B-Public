from _finite_curve_utils import FiniteFieldCurve, format_point


if __name__ == "__main__":
    # Examples: inverse, identity, y=0 doubling, and point subtraction.
    curve = FiniteFieldCurve(p=17, a=2, b=2)
    point = (5, 1)
    other = (6, 3)
    point_inverse = curve.negate(point)
    other_inverse = curve.negate(other)

    assert point_inverse == (5, 16)
    assert other_inverse == (6, 14)
    assert curve.add(point, point_inverse) is None
    assert curve.add(point, None) == point
    assert curve.add(point, other_inverse) == (5, 16)

    special_curve = FiniteFieldCurve(p=5, a=1, b=2)
    order_two_point = (4, 0)

    assert special_curve.contains(order_two_point)
    assert special_curve.negate(order_two_point) == order_two_point
    assert special_curve.add(order_two_point, order_two_point) is None

    print(f"overline({point}) = {point_inverse}")
    print(f"{point} + overline({point}) = {format_point(curve.add(point, point_inverse))}")
    print(f"{point} + O = {format_point(curve.add(point, None))}")
    print(f"overline({other}) = {other_inverse}")
    print(f"{point} - {other} = {point} + overline({other}) = {curve.add(point, other_inverse)}")
    print(f"overline({order_two_point}) = {special_curve.negate(order_two_point)}")
    print(f"2{order_two_point} = {format_point(special_curve.add(order_two_point, order_two_point))}")
