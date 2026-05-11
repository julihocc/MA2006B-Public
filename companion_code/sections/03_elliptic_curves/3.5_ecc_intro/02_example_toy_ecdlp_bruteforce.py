from _ecc_utils import DomainParameters


if __name__ == "__main__":
    # Example: On toy curves, recovering k from Q=kG can be brute-forced.
    params = DomainParameters(p=17, a=2, b=2, generator=(5, 1), n=19, h=1)
    private_key = 10
    public_key = params.public_key(private_key)

    recovered_key = params.brute_force_discrete_log(public_key)

    print(f"Q = {private_key}G = {public_key}")
    print(f"brute-forced k: {recovered_key}")
