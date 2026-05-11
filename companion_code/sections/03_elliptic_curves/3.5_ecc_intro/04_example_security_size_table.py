from _ecc_utils import security_size_table


if __name__ == "__main__":
    # Example: ECC key sizes are much smaller for comparable security.
    print("security | ECC | RSA/DH | symmetric")
    for security_bits, ecc_bits, rsa_dh_bits, symmetric_bits in security_size_table():
        print(f"{security_bits:>8} | {ecc_bits:>3} | {rsa_dh_bits:>6} | {symmetric_bits:>9}")
