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

#supplementary[
  Perform the addition of two 3-bit integers $A=101_2$ and $B=110_2$ word-by-word (assuming 1-bit word size) and track the carry bit at each step.
]

#supplementary[
  Trace the "Square-and-Multiply" algorithm to compute $5^9 mod 13$. Show the value of the accumulator at each step.
]

#supplementary[
  Explain why constant-time implementations of modular exponentiation are necessary to prevent Side-Channel Attacks (e.g., Timing Attacks).
]

#supplementary[
  Compute the modular inverse of $7 mod 16$ using the Extended Euclidean Algorithm.
]

#supplementary[
  What is the "Montgomery Form" of the integer $a=5$ modulo $n=13$ with $R=16$?
]

#supplementary[
  Compare the complexity of addition ($O(n)$) vs multiplication ($O(n^2)$) for $n=4096$ bits. How many additions is one multiplication roughly equivalent to (ignoring constants)?
]

#supplementary[
  Describe "Barrett Reduction" and efficient modular reduction. How does it differ from Montgomery Reduction?
]

#supplementary[
  In RSA, we often choose $e=65537$ ($2^16 + 1$). How many multiplications are needed to compute $m^e mod n$ using Square-and-Multiply?
]

=== Self-Evaluation Quiz

#quiz[
  #question(
    [Which operation is generally the most computationally expensive in public key cryptography?],
    (
      "Modular Addition",
      "Bitwise XOR",
      "Modular Exponentiation",
      "Modular Subtraction",
    ),
    2,
  )

  #question(
    [The "Square-and-Multiply" algorithm reduces the complexity of exponentiation from $O(e)$ to:],
    (
      [$O(log e)$],
      [$O(e^2)$],
      [$O(sqrt(e))$],
      [$O(1)$],
    ),
    0,
  )

  #question(
    [What is the time complexity of the standard "schoolbook" multiplication for two $n$-bit integers?],
    (
      [$O(n)$],
      [$O(n^2)$],
      [$O(n^3)$],
      [$O(log n)$],
    ),
    1,
  )

  #question(
    [Karatsuba multiplication improves the complexity of multiplication to approximately:],
    (
      [$O(n^1.585)$],
      [$O(n log n)$],
      [$O(n^2)$],
      [$O(n)$],
    ),
    0,
  )

  #question(
    [Montgomery Multiplication is primarily used to optimize:],
    (
      "Modular Addition",
      "Modular Multiplication (avoiding division)",
      "Prime Factorization",
      "Hashing",
    ),
    1,
  )

  #question(
    [The Extended Euclidean Algorithm is used to efficiently find:],
    (
      "The product of two numbers",
      "The modular multiplicative inverse",
      "The square root of a number",
      "The logarithm of a number",
    ),
    1,
  )

  #question(
    [A "Side-Channel Attack" might exploit:],
    (
      "Weak passwords",
      "Variations in execution time or power consumption",
      "Social engineering",
      "Brute force",
    ),
    1,
  )

  #question(
    [In big integer arithmetic, a 2048-bit integer is typically represented as:],
    (
      "A floating point number",
      "A string of characters",
      "An array of smaller words (e.g., 64-bit)",
      "A single CPU register",
    ),
    2,
  )

  #question(
    [If $gcd(a, n) != 1$, then the modular inverse of $a$ modulo $n$:],
    (
      [Is always 1],
      [Does not exist],
      [Is 0],
      [Is $a^(n-2)$],
    ),
    1,
  )

  #question(
    [To compute $b^e mod m$ where $e$ has $k$ bits, Square-and-Multiply requires approx how many squarings?],
    (
      [$k$ squarings],
      [$k/2$ squarings],
      [$2^k$ squarings],
      [1 squaring],
    ),
    0,
  )
]

