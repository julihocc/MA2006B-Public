#import "../../utils.typ": *

== Large Integer Arithmetic

=== Theory

#definition("Big Integer Arithmetic")[
  *Big integer arithmetic* refers to calculations performed on integers that are larger than the word size of the processor (e.g., $> 64$ bits). In cryptography, we routinely deal with integers of 256, 1024, or even 4096 bits. These numbers are stored as arrays of words (e.g., an array of 64-bit integers).
]

#example("Multi-Precision Addition")[
  To add two $n$-bit integers $A$ and $B$:
  1. Start from the least significant word.
  2. Add the words $a_i + b_i + "carry"$.
  3. The result is stored in $c_i$, and the new carry is passed to the next word.
  This is analogous to elementary school addition but with base $2^64$ instead of base 10.
]

#definition("Modular Exponentiation")[
  The operation $c = b^e mod m$ is fundamental in public-key cryptography. Computing this efficiently requires algorithms like *Square-and-Multiply* (or Exponentiation by Squaring), which allows the computation in $O(log e)$ modular multiplications rather than $e$ multiplications.
]

#theorem("Complexity of Operations")[
  For $n$-bit integers:
  - Addition: $O(n)$
  - Multiplication (Schoolbook): $O(n^2)$. Faster algorithms like Karatsuba exist ($O(n^(log_2 3)) approx O(n^1.585)$).
  - Modular Exponentiation: $O(n^3)$ (using naive multiplication), or better with efficient multiplication.
]

#definition("Montgomery Multiplication")[
  *Montgomery Multiplication* is a method for performing fast modular multiplication without a division instruction. It transforms numbers into "Montgomery form", performs multiplications in that form, and transforms them back. This is crucial for hardware implementations where division is expensive.
]

=== Solved Problems

#solved_problem[
  Compute $3^5 mod 7$ using square-and-multiply.
]
#solution[
  Binary of exponent $5$ is $101_2$.
  1. Initialize $x = 1$.
  2. Bit 1 ($1$): Square $x$ ($1^2=1$), multiply by base $3$ ($1 dot 3 = 3$). $x=3$.
  3. Bit 2 ($0$): Square $x$ ($3^2=9 equiv 2 mod 7$). No multiply. $x=2$.
  4. Bit 3 ($1$): Square $x$ ($2^2=4$), multiply by base $3$ ($4 dot 3 = 12 equiv 5 mod 7$). $x=5$.
  Result is 5.
]

#solved_problem[
  Find the modular inverse of $17 mod 26$ using the Extended Euclidean Algorithm.
]
#solution[
  We want to find $d$ such that $17d equiv 1 (mod 26)$.
  1. Euclidean Algorithm:
    $ 26 = 1(17) + 9 $
    $ 17 = 1(9) + 8 $
    $ 9 = 1(8) + 1 $
  2. Back-substitution:
    $ 1 = 9 - 1(8) $
    Substitute $8 = 17 - 1(9)$:
    $ 1 = 9 - 1(17 - 1(9)) = 2(9) - 1(17) $
    Substitute $9 = 26 - 1(17)$:
    $ 1 = 2(26 - 1(17)) - 1(17) = 2(26) - 3(17) $
  3. Linear combination: $1 = 2(26) - 3(17)$.
  Taking modulo 26: $1 equiv -3(17) (mod 26)$.
  So $d = -3 equiv 23 (mod 26)$.
  Check: $17 times 23 = 391 = 15(26) + 1$. Correct.
]

=== Supplementary Problems

#supplementary[
  Estimate the number of atomic operations (additions/multiplications) required to multiply two 2048-bit numbers using the standard grammar school algorithm versus Karatsuba algorithm.
]

#supplementary[
  Why is the efficiency of modular inverse (Euclidean Algorithm) crucial for RSA key generation?
]
