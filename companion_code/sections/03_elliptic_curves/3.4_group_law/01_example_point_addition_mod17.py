from _group_law_utils import Curve


if __name__ == "__main__":
    # Example: On y^2 = x^3 + 2x + 2 over F_17, add P=(5,1) and Q=(6,3).
    curve = Curve(p=17, a=2, b=2)
    p = (5, 1)
    q = (6, 3)

    print(f"P on curve: {curve.contains(p)}")
    print(f"Q on curve: {curve.contains(q)}")
    print(f"lambda = {curve.slope(p, q)}")
    print(f"P + Q = {curve.add(p, q)}")
