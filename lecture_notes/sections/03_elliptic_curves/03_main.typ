= Introduction to Elliptic Curves

Elliptic curves connect geometry, algebra, and number theory in a way that is especially useful for cryptography. At first, an elliptic curve looks like a geometric object defined by an equation such as $y^2 = x^3 + a x + b$. The key idea is that the points on such a curve can be added together, and this addition turns the curve into an abelian group.

This chapter develops that idea in stages:

- We first review fields and finite fields, since elliptic-curve arithmetic requires division by nonzero elements.
- Over the real numbers, we define elliptic curves as completed non-singular cubic curves and use their shape to introduce the chord-and-tangent operation.
- Over finite fields, the same operation becomes a finite algebraic system suitable for computation.
- Scalar multiplication gives a basic example of how algebraic structure can support cryptographic constructions.

The goal is to move from fields to elliptic-curve groups, and then to a light view of why these groups are useful in cryptography. The emphasis remains algebraic: cryptographic protocols appear only as motivation and examples.

#include "3.1_fields_and_finite_fields.typ"
#include "3.2_curves_over_reals.typ"
#include "3.3_curves_over_finite_fields.typ"
