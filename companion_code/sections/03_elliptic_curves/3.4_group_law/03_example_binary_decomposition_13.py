def powers_selected_by_scalar(k: int) -> list[int]:
    return [2**i for i, bit in enumerate(reversed(bin(k)[2:])) if bit == "1"]


if __name__ == "__main__":
    # Example: 13 = 1101_2, so 13P = 8P + 4P + P.
    k = 13

    print(f"{k} in binary: {k:b}")
    print(f"selected powers: {powers_selected_by_scalar(k)}")
