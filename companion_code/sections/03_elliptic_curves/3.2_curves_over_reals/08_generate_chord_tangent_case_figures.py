"""Generate case-by-case chord-and-tangent figures for Section 3.2."""

from __future__ import annotations

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


ROOT = Path(__file__).resolve().parents[4]
OUTPUT_DIR = ROOT / "lecture_notes" / "assets" / "generated" / "03_elliptic_curves"


def cubic(x: np.ndarray, *, a: float, b: float) -> np.ndarray:
    return x**3 + a * x + b


def plot_curve(ax: plt.Axes, *, a: float, b: float, color: str = "#2563eb") -> None:
    x = np.linspace(-2.6, 3.4, 1800)
    values = cubic(x, a=a, b=b)
    mask = values >= 0
    y = np.sqrt(np.maximum(values, 0))

    start: int | None = None
    for index, is_valid in enumerate(mask):
        if is_valid and start is None:
            start = index
        if start is not None and (not is_valid or index == len(mask) - 1):
            stop = index + 1 if is_valid and index == len(mask) - 1 else index
            if stop - start > 1:
                ax.plot(x[start:stop], y[start:stop], color=color, linewidth=2.2)
                ax.plot(x[start:stop], -y[start:stop], color=color, linewidth=2.2)
            start = None


def style_axes(ax: plt.Axes, *, xlim: tuple[float, float], ylim: tuple[float, float]) -> None:
    ax.axhline(0, color="#6b7280", linewidth=0.8)
    ax.axvline(0, color="#6b7280", linewidth=0.8)
    ax.set_xlim(*xlim)
    ax.set_ylim(*ylim)
    ax.set_aspect("equal", adjustable="box")
    ax.grid(color="#e5e7eb", linewidth=0.7)
    ax.set_xlabel("$x$")
    ax.set_ylabel("$y$")
    ax.tick_params(labelsize=8)
    for spine in ax.spines.values():
        spine.set_color("#9ca3af")


def scatter_point(ax: plt.Axes, point: tuple[float, float], label: str, *, color: str = "#111827") -> None:
    x, y = point
    ax.scatter([x], [y], color=color, s=32, zorder=4)
    ax.annotate(label, xy=point, xytext=(6, 6), textcoords="offset points", fontsize=9, color=color)


def save(fig: plt.Figure, filename: str) -> None:
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    path = OUTPUT_DIR / filename
    fig.savefig(path, format="svg", bbox_inches="tight")
    plt.close(fig)
    print(f"wrote {path}")


def figure_distinct_points() -> None:
    fig, ax = plt.subplots(figsize=(5.4, 4.2), constrained_layout=True)
    plot_curve(ax, a=-1, b=1)
    style_axes(ax, xlim=(-1.8, 1.8), ylim=(-2.0, 2.0))

    p = (0, 1)
    q = (1, 1)
    r_prime = (-1, 1)
    result = (-1, -1)

    ax.plot([-1.45, 1.45], [1, 1], color="#dc2626", linewidth=1.6, linestyle="--")
    scatter_point(ax, p, "$P$")
    scatter_point(ax, q, "$Q$")
    scatter_point(ax, r_prime, "$R'$", color="#dc2626")
    scatter_point(ax, result, "$P \\oplus Q=\\overline{R'}$", color="#059669")
    ax.set_title("Distinct points: chord through $P$ and $Q$", fontsize=11)
    save(fig, "3.2_chord_distinct_points.svg")


def figure_tangent_doubling() -> None:
    fig, ax = plt.subplots(figsize=(5.4, 4.2), constrained_layout=True)
    plot_curve(ax, a=-1, b=1)
    style_axes(ax, xlim=(-1.4, 1.6), ylim=(-1.8, 1.8))

    p = (0, 1)
    r_prime = (0.25, 0.875)
    result = (0.25, -0.875)

    x = np.linspace(-1.0, 1.2, 200)
    y = 1 - 0.5 * x
    ax.plot(x, y, color="#dc2626", linewidth=1.6, linestyle="--")
    scatter_point(ax, p, "$P$")
    scatter_point(ax, r_prime, "$R'$", color="#dc2626")
    scatter_point(ax, result, "$2P=\\overline{R'}$", color="#059669")
    ax.set_title("Doubling: tangent at $P$", fontsize=11)
    save(fig, "3.2_tangent_doubling.svg")


def figure_inverse_vertical_line() -> None:
    fig, ax = plt.subplots(figsize=(5.4, 4.2), constrained_layout=True)
    plot_curve(ax, a=-1, b=1)
    style_axes(ax, xlim=(-1.8, 1.8), ylim=(-2.0, 2.0))

    p = (0, 1)
    p_inverse = (0, -1)

    ax.axvline(0, color="#dc2626", linewidth=1.6, linestyle="--")
    scatter_point(ax, p, "$P$")
    scatter_point(ax, p_inverse, "$\\overline{P}$", color="#dc2626")
    ax.annotate(
        "$P \\oplus \\overline{P}=\\mathcal{O}$",
        xy=(0, 1.75),
        xytext=(-1.45, 1.75),
        fontsize=10,
        color="#059669",
    )
    ax.set_title("Inverse points: vertical line", fontsize=11)
    save(fig, "3.2_inverse_vertical_line.svg")


def figure_vertical_tangent_order_two() -> None:
    fig, ax = plt.subplots(figsize=(5.4, 4.2), constrained_layout=True)
    plot_curve(ax, a=-1, b=0)
    style_axes(ax, xlim=(-1.7, 1.7), ylim=(-1.6, 1.6))

    p = (1, 0)

    ax.axvline(1, color="#dc2626", linewidth=1.6, linestyle="--")
    scatter_point(ax, p, "$P=\\overline{P}$")
    ax.annotate("$2P=\\mathcal{O}$", xy=(1.05, 1.25), fontsize=10, color="#059669")
    ax.set_title("Vertical tangent: point of order 2", fontsize=11)
    save(fig, "3.2_vertical_tangent_order_two.svg")


def figure_identity_point_at_infinity() -> None:
    fig, ax = plt.subplots(figsize=(5.4, 4.2), constrained_layout=True)
    plot_curve(ax, a=-1, b=1)
    style_axes(ax, xlim=(-1.8, 1.8), ylim=(-2.0, 2.25))

    p = (0, 1)
    scatter_point(ax, p, "$P$")
    ax.annotate(
        "$\\mathcal{O}$ is not an affine point",
        xy=(1.15, 1.9),
        xytext=(-1.45, 1.9),
        arrowprops={"arrowstyle": "->", "color": "#6b7280", "linewidth": 0.9},
        fontsize=9,
        color="#374151",
    )
    ax.annotate("$P \\oplus \\mathcal{O}=P$", xy=(-0.7, -1.65), fontsize=10, color="#059669")
    ax.set_title("Identity: adding the point at infinity", fontsize=11)
    save(fig, "3.2_identity_point_at_infinity.svg")


def figure_point_subtraction() -> None:
    fig, ax = plt.subplots(figsize=(5.6, 4.6), constrained_layout=True)
    plot_curve(ax, a=-1, b=1)
    style_axes(ax, xlim=(-0.7, 3.3), ylim=(-5.7, 5.7))

    p = (0, 1)
    q_inverse = (1, -1)
    r_prime = (3, -5)
    result = (3, 5)

    x = np.linspace(-0.3, 3.2, 200)
    y = 1 - 2 * x
    ax.plot(x, y, color="#dc2626", linewidth=1.6, linestyle="--")
    scatter_point(ax, p, "$P$")
    scatter_point(ax, q_inverse, "$\\overline{Q}$", color="#dc2626")
    scatter_point(ax, r_prime, "$R'$", color="#dc2626")
    scatter_point(ax, result, "$P \\ominus Q=P\\oplus\\overline{Q}$", color="#059669")
    ax.set_title("Subtraction: add the inverse point", fontsize=11)
    save(fig, "3.2_point_subtraction.svg")


def main() -> None:
    figure_distinct_points()
    figure_tangent_doubling()
    figure_inverse_vertical_line()
    figure_vertical_tangent_order_two()
    figure_identity_point_at_infinity()
    figure_point_subtraction()


if __name__ == "__main__":
    main()
