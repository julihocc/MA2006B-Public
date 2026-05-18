"""Generate the discriminant comparison figure for Section 3.2."""

from __future__ import annotations

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


ROOT = Path(__file__).resolve().parents[4]
OUTPUT = ROOT / "lecture_notes" / "assets" / "generated" / "03_elliptic_curves" / "3.2_discriminant_comparison.svg"


def cubic(x: np.ndarray, *, a: float, b: float) -> np.ndarray:
    return x**3 + a * x + b


def plot_real_branches(ax: plt.Axes, *, a: float, b: float, color: str) -> None:
    x = np.linspace(-2.4, 2.4, 1400)
    values = cubic(x, a=a, b=b)
    mask = values >= 0
    y = np.sqrt(np.maximum(values, 0))

    ax.plot(x[mask], y[mask], color=color, linewidth=2.2)
    ax.plot(x[mask], -y[mask], color=color, linewidth=2.2)


def style_axes(ax: plt.Axes) -> None:
    ax.axhline(0, color="#6b7280", linewidth=0.8)
    ax.axvline(0, color="#6b7280", linewidth=0.8)
    ax.set_xlim(-2.4, 2.4)
    ax.set_ylim(-3.1, 3.1)
    ax.set_aspect("equal", adjustable="box")
    ax.grid(color="#e5e7eb", linewidth=0.7)
    ax.set_xlabel("$x$")
    ax.set_ylabel("$y$")
    ax.tick_params(labelsize=8)
    for spine in ax.spines.values():
        spine.set_color("#9ca3af")


def main() -> None:
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)

    fig, axes = plt.subplots(1, 2, figsize=(8.4, 3.8), constrained_layout=True)

    plot_real_branches(axes[0], a=-1, b=1, color="#2563eb")
    style_axes(axes[0])
    axes[0].set_title("$E_1: y^2 = x^3 - x + 1$\n$\\Delta \\ne 0$ (non-singular)", fontsize=10)

    plot_real_branches(axes[1], a=0, b=0, color="#dc2626")
    style_axes(axes[1])
    axes[1].scatter([0], [0], color="#111827", s=24, zorder=3)
    axes[1].annotate(
        "cusp",
        xy=(0, 0),
        xytext=(0.35, -0.55),
        arrowprops={"arrowstyle": "->", "color": "#111827", "linewidth": 0.9},
        fontsize=9,
    )
    axes[1].set_title("$E_2: y^2 = x^3$\n$\\Delta = 0$ (singular)", fontsize=10)

    fig.suptitle("Discriminant and geometry of two cubic models", fontsize=12)
    fig.savefig(OUTPUT, format="svg", bbox_inches="tight")
    plt.close(fig)

    print(f"wrote {OUTPUT}")


if __name__ == "__main__":
    main()
