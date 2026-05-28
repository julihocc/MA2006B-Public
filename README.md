# MA2006B Public Materials

Student-facing materials for MA2006B, Modern Algebras for Security and Cryptography.

This repository contains:

- `lecture_notes/`: Typst source and generated assets for the course lecture notes.
- `companion_code/`: Python scripts that accompany selected examples, solved problems, and generated figures.

## Compile the Lecture Notes

From the repository root:

```bash
typst compile lecture_notes/ma2006b_lecture_notes.typ ma2006b_lecture_notes.pdf
```

## Run Companion Code

The Python environment is managed with `uv`.

```bash
uv sync
uv run python companion_code/sections/03_elliptic_curves/3.2_curves_over_reals/01_example_discriminant_comparison.py
```

Figure-generation scripts write SVG outputs under `lecture_notes/assets/generated/`.

