from _ecc_utils import DomainParameters


if __name__ == "__main__":
    # Example: Toy domain parameters (17, 2, 2, (5, 1), 19, 1).
    params = DomainParameters(p=17, a=2, b=2, generator=(5, 1), n=19, h=1)

    print(f"G on curve: {params.contains(params.generator)}")
    print(f"nG = O: {params.generator_has_declared_order()}")
    print(f"cofactor h: {params.h}")
