from _finite_curve_utils import hasse_interval, trace_of_frobenius


if __name__ == "__main__":
    # Solved problem: Verify Hasse's theorem for p=5 and #E(F_5)=9.
    p = 5
    order = 9

    lower, upper = hasse_interval(p)
    trace = trace_of_frobenius(p, order)

    print(f"Hasse interval: [{lower:.2f}, {upper:.2f}]")
    print(f"order satisfies Hasse: {lower <= order <= upper}")
    print(f"trace of Frobenius: {trace}")
    print(f"|trace| <= 2sqrt(p): {abs(trace) <= 2 * (p ** 0.5)}")
