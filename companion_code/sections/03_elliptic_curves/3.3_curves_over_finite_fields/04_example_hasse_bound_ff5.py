from _finite_curve_utils import FiniteFieldCurve, hasse_interval


if __name__ == "__main__":
    # Example: Check that #E(F_5)=9 lies inside Hasse's interval.
    curve = FiniteFieldCurve(p=5, a=1, b=1)
    lower, upper = hasse_interval(curve.p)
    order = curve.order()

    print(f"Hasse interval: [{lower:.2f}, {upper:.2f}]")
    print(f"curve order: {order}")
    print(f"inside interval = {lower <= order <= upper}")
