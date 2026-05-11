from _group_law_utils import double_and_add_operation_counts


if __name__ == "__main__":
    # Example: For k=29, compare double-and-add with naive repeated addition.
    k = 29
    doublings, additions = double_and_add_operation_counts(k)
    naive_additions = k - 1

    print(f"{k} in binary: {k:b}")
    print(f"double-and-add doublings: {doublings}")
    print(f"nonzero-bit updates: {k.bit_count()}")
    print(f"effective additions after the first selected bit: {additions}")
    print(f"naive repeated additions: {naive_additions}")
