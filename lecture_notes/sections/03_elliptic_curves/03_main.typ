= Introduction to Elliptic Curves

Elliptic curves connect geometry, algebra, and number theory in a way that is especially useful for cryptography. At first, an elliptic curve looks like a geometric object defined by an equation such as $y^2 = x^3 + a x + b$. The key idea is that the points on such a curve can be added together, and this addition turns the curve into an abelian group.

This chapter develops that idea in stages:

- We first review fields and finite fields, since elliptic-curve arithmetic requires division by nonzero elements.
- Over the real numbers, we use the curve's shape to understand the chord-and-tangent rule geometrically.
- Over finite fields, the same group law becomes a finite arithmetic system suitable for computation.
- Point addition and scalar multiplication provide the basic operations used by elliptic-curve algorithms.
- The difficulty of reversing scalar multiplication, known as the Elliptic Curve Discrete Logarithm Problem (ECDLP), gives modern ECC its security.

The goal is to move from geometric intuition to the arithmetic used in protocols such as ECDH and ECDSA. Compared with RSA and classical Diffie-Hellman, elliptic-curve systems can provide similar security with much smaller keys.

#include "3.1_fields_and_finite_fields.typ"
#include "3.2_curves_over_reals.typ"
#include "3.3_curves_over_finite_fields.typ"
#include "3.4_group_law.typ"
#include "3.5_ecc_intro.typ"
