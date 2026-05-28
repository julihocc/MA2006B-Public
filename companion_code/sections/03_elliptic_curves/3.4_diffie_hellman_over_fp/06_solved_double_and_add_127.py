from _section_34_utils import double_and_add_operation_counts


if __name__ == "__main__":
    # Solved problem: explain why double-and-add is efficient for 127P.
    k = 127
    doublings, additions = double_and_add_operation_counts(k)

    assert k.bit_length() == 7
    assert doublings == 6
    assert additions == 6

    print(f"{k} in binary: {k:b}")
    print(f"double-and-add operations: {doublings + additions}")
    print(f"  doublings: {doublings}")
    print(f"  additions: {additions}")
    print(f"naive repeated additions: {k - 1}")
