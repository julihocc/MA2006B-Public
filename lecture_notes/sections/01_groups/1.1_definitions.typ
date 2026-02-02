#import "../../utils.typ": *
== Definition and Examples of Groups

=== Theory
#definition("Group")[
  A *group* is a set $G$ equipped with a binary operation $dot: G times G arrow G$ satisfying the following axioms:
  + *Closure*: For all $a, b in G$, the result $a dot b$ is also in $G$.
  + *Associativity*: For all $a, b, c in G$, $(a dot b) dot c = a dot (b dot c)$.
  + *Identity Element*: There exists an element $e in G$ such that for every element $a in G$, $e dot a = a dot e = a$.
  + *Inverse Element*: For each $a in G$, there exists an element $b in G$, commonly denoted $a^(-1)$, such that $a dot b = b dot a = e$.

  If the operation is also commutative (i.e., $a dot b = b dot a$ for all $a, b in G$), the group is called an *abelian group*.
]

#example[
  The set of integers $ZZ$ under addition is an infinite abelian group.
  - *Closure*: $a + b$ is an integer for all $a, b in ZZ$.
  - *Associativity*: $(a + b) + c = a + (b + c)$.
  - *Identity*: $0$ is the identity ($a + 0 = a$).
  - *Inverse*: The inverse of $a$ is $-a$ ($a + (-a) = 0$).
  - *Commutativity*: $a + b = b + a$.
]

#example[
  The set $ZZ_n = {0, 1, ..., n-1}$ under addition modulo $n$ is a finite abelian group of order $n$.
  For instance, in $Z_4 = {0, 1, 2, 3}$:
  - The identity is $0$.
  - Inverses: $0^(-1)=0, 1^(-1)=3, 2^(-1)=2, 3^(-1)=1$.
  - Closure is satisfied modulo $n$ (e.g., $2+3 = 5 equiv 1 mod 4$).
]

#example[
  *Cryptography*: Groups are the foundation of many cryptographic primitives.
  - *Diffie-Hellman Key Exchange*: Relies on the difficulty of the Discrete Logarithm Problem (DLP) in a cyclic group $G$. Given $g$ and $g^x$, it is computationally hard to find $x$.
  - *RSA*: Uses the multiplicative group of integers modulo $n$, denoted $ZZ_n^*$. This group consists of integers coprime to $n$. Its order is given by Euler's totient function $phi(n)$.
]

=== Solved Problems

#solved_problem[
  *Modular Addition*

  In $ZZ_(26)$ (often used for classical ciphers), compute $15 + 18 mod 26$.
]
#solution[
  1. Perform integer addition: $15 + 18 = 33$.
  2. Apply the division algorithm simply by dividing by the modulus $n=26$:
    $ 33 = 1 dot 26 + 7 $
  3. The remainder is 7.
  Thus, $33 equiv 7 (mod 26)$.
]

#solved_problem[
  Verify if the set of non-zero real numbers $RR^*$ under multiplication forms a group.
]
#solution[
  Yes, $(RR^*, dot)$ is a group. We verify the four axioms:
  - *Closure*: Let $a, b in RR^*$. Since both are non-zero, their product $a b$ is also non-zero ($a != 0, b != 0 => a b != 0$). Thus $a b in RR^*$.
  - *Associativity*: Multiplication of real numbers is associative: $(a b)c = a(b c)$.
  - *Identity*: The number $1$ is observing the property $1 dot a = a dot 1 = a$. Since $1 != 0$, $1 in RR^*$.
  - *Inverse*: For any $a in RR^*$, we have $a != 0$. Thus the real number $1/a$ exists and is non-zero. $a dot (1/a) = 1$. So $a^(-1) = 1/a$.
]

#solved_problem[
  Compute the inverse of $3$ in the group $ZZ_(11)$ under multiplication.
]
#solution[
  We seek an integer $x$ such that $3x equiv 1 (mod 11)$.
  Since 11 is small, we can test multiples of 3:
  - $3 times 1 = 3$
  - $3 times 2 = 6$
  - $3 times 3 = 9$
  - $3 times 4 = 12$. Notice that $12 = 1 dot 11 + 1$, so $12 equiv 1 (mod 11)$.

  Since $3(4) equiv 1$, the multiplicative inverse of 3 is 4.
  $3^(-1) = 4$ in $ZZ_(11)$.
]

=== Supplementary Problems

#supplementary[
  Determine if the set of $2 times 2$ matrices with integer entries forms a group under matrix addition.
]

#supplementary[
  Does the set of integers $ZZ$ form a group under subtraction?
]

#supplementary[
  Prove that the identity element in a group is unique.
]

#supplementary[
  Show that for every element $a$ in a group $G$, the inverse $a^(-1)$ is unique.
]

#supplementary[
  Let $G$ be a group such that $x^2 = e$ for all $x in G$. Prove that $G$ is abelian.
]
