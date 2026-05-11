from _group_law_utils import Curve, format_point


if __name__ == "__main__":
    # Example: If P=(x,0), then P=-P and 2P=O.
    curve = Curve(p=17, a=-1, b=0)
    point = (1, 0)

    print(f"P on curve: {curve.contains(point)}")
    print(f"-P = {curve.negate(point)}")
    print(f"2P = {format_point(curve.add(point, point))}")
