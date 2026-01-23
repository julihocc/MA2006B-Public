#import "../../utils.typ": *

== Teoría de números en enteros grandes

=== Theory

#definition("Big Integer Arithmetic")[
  *Big integer arithmetic* refers to calculations performed on integers that are larger than the word size of the processor (e.g., $> 64$ bits). In cryptography, we routinely deal with integers of 256, 1024, or even 4096 bits.
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

=== Supplementary Problems

#supplementary[
  Estimate the number of atomic operations (additions/multiplications) required to multiply two 2048-bit numbers using the standard grammar school algorithm versus Karatsuba algorithm.
]

#supplementary[
  Why is the efficiency of modular inverse (Euclidean Algorithm) crucial for RSA key generation?
]
