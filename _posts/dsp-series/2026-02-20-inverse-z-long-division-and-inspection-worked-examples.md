---
title: "Inverse Z-Transform by Long Division and Inspection: Worked Examples"
date: 2026-02-20 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'z-transform', 'inverse-z', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Power-series long division, direct inspection, and partial fractions applied to the exact examples asked in the CSE 409 finals.
math: true
---
## Four Ways to Invert

$$x[n] = \mathcal{Z}^{-1}\{X(z)\} = \frac{1}{2\pi j}\oint_C X(z)z^{n-1}\,dz$$

The contour integral is the definition; nobody does it by hand. The practical methods are:

1. **Inspection / transform equation** — read coefficients straight off the series.
2. **Long division (power series)** — expand into $\sum x[n]z^{-n}$.
3. **Partial fraction expansion + table lookup** — the standard exam method.
4. **Contour integration** — theory only.

The **ROC decides the answer**. The same $X(z)$ gives a right-sided, left-sided, or two-sided sequence depending on the ROC.

---

## Method 1: Inspection (Direct Comparison)

Since

$$X(z)=\sum_{n=-\infty}^{\infty}x[n]z^{-n}$$

the coefficient of $z^{-n}$ **is** $x[n]$.

### Example i: $X(z)=2z^2+3$

Rewrite every term as a power of $z$:

$$X(z)=2z^2+0\cdot z^1+3z^0$$

Matching coefficients: $x[-2]=2$, $x[-1]=0$, $x[0]=3$.

$$\boxed{x[n]=\{2,\,0,\,3\}}$$

with the arrow at $n=0$ under the 3.

### Example ii: $X(z)=4z^4-z^3-3z+4z^{-1}+3z^{-2}$

Pad the missing powers with zeros:

$$X(z)=4z^4-1z^3+0z^2-3z^1+0z^0+4z^{-1}+3z^{-2}$$

| Power | $z^4$ | $z^3$ | $z^2$ | $z^1$ | $z^0$ | $z^{-1}$ | $z^{-2}$ |
|---|---|---|---|---|---|---|---|
| $n$ | $-4$ | $-3$ | $-2$ | $-1$ | $0$ | $1$ | $2$ |
| $x[n]$ | $4$ | $-1$ | $0$ | $-3$ | $0$ | $4$ | $3$ |

$$\boxed{x[n]=\{4,\,-1,\,0,\,-3,\,0,\,4,\,3\}}$$

with $x[-4]=4$ and $x[2]=3$. Note this sequence is **non-causal**: it starts at $n=-4$.

### Example iii: $X(z)=3+2z^{-1}+3z^{-3}$

$$x[0]=3,\quad x[1]=2,\quad x[2]=0,\quad x[3]=3$$

$$\boxed{x[n]=\{3,\,2,\,0,\,3\}}$$

Inspection is instant whenever $X(z)$ is already a finite polynomial. It also tells you the ROC is the whole plane except $z=0$ or $z=\infty$.

---

## Method 2: Long Division (Power Series)

For a rational $X(z)=N(z)/D(z)$, divide to produce a power series. **The direction of division depends on the ROC:**

- ROC $\vert z\vert>r$ (causal): divide so the result is a series in $z^{-1}$.
- ROC $\vert z\vert<r$ (anti-causal): divide so the result is a series in $z$.

### Example i: $X(z)=\dfrac{z+0.2}{(z+0.5)(z-1)}$, $\vert z\vert>1$

Expand the denominator: $(z+0.5)(z-1)=z^2-0.5z-0.5$.

Multiply numerator and denominator by $z^{-2}$ so both are in $z^{-1}$:

$$X(z)=\frac{z^{-1}+0.2z^{-2}}{1-0.5z^{-1}-0.5z^{-2}}$$

Now divide:

```
                     z⁻¹ + 0.7z⁻² + 0.85z⁻³ + ...
        ┌────────────────────────────────────────
1 -0.5z⁻¹ -0.5z⁻² )  z⁻¹ + 0.2z⁻²
                     z⁻¹ - 0.5z⁻² - 0.5z⁻³
                     ─────────────────────
                            0.7z⁻² + 0.5z⁻³
                            0.7z⁻² - 0.35z⁻³ - 0.35z⁻⁴
                            ───────────────────────
                                     0.85z⁻³ + 0.35z⁻⁴
```

Reading the quotient:

$$X(z)=z^{-1}+0.7z^{-2}+0.85z^{-3}+\cdots$$

$$\boxed{x[n]=\{0,\ 1,\ 0.7,\ 0.85,\ \dots\}}$$

so

$$x[0]=0,\quad x[1]=1,\quad x[2]=0.7,\quad x[3]=0.85,\ \dots$$

**Cross-check by partial fractions.** Write $X(z)/z$:

$$\frac{X(z)}{z}=\frac{z+0.2}{z(z+0.5)(z-1)}=\frac{A}{z}+\frac{B}{z+0.5}+\frac{C}{z-1}$$

$$A=\frac{0.2}{(0.5)(-1)}=-0.4$$

$$B=\frac{-0.5+0.2}{(-0.5)(-0.5-1)}=\frac{-0.3}{0.75}=-0.4$$

$$C=\frac{1+0.2}{(1)(1.5)}=\frac{1.2}{1.5}=0.8$$

$$X(z)=-0.4-0.4\frac{z}{z+0.5}+0.8\frac{z}{z-1}$$

For $\vert z\vert>1$ all terms are causal, and $\dfrac{z}{z+0.5}=\dfrac{1}{1+0.5z^{-1}}$ gives $(-0.5)^n u[n]$:

$$\boxed{x[n]=-0.4\delta[n]-0.4(-0.5)^n u[n]+0.8u[n]}$$

Check: $x[0]=-0.4-0.4+0.8=0$ ✓, $x[1]=0.2+0.8=1$ ✓, $x[2]=-0.1+0.8=0.7$ ✓, $x[3]=0.05+0.8=0.85$ ✓.

### Example ii: $X(z)=\dfrac{z}{(z-3)(z-4)}$, $\vert z\vert<3$

Here the ROC is **inside** the smallest pole, so the sequence is **left-sided**. Divide in positive powers of $z$:

$$X(z)=\frac{z}{z^2-7z+12}=\frac{z}{12-7z+z^2}$$

$$\frac{z}{12}\cdot\frac{1}{1-\frac{7}{12}z+\frac{1}{12}z^2}=\frac{z}{12}+\frac{7z^2}{144}+\cdots$$

So $x[-1]=\frac{1}{12}$, $x[-2]=\frac{7}{144}$, and so on — a left-sided sequence.

**Cross-check by partial fractions.**

$$\frac{X(z)}{z}=\frac{1}{(z-3)(z-4)}=\frac{-1}{z-3}+\frac{1}{z-4}$$

$$X(z)=-\frac{z}{z-3}+\frac{z}{z-4}$$

For $\vert z\vert<3$, both terms are anti-causal. Using $\dfrac{z}{z-a}\leftrightarrow -a^n u[-n-1]$:

$$x[n]=\left(3^n-4^n\right)u[-n-1]$$

Check: $x[-1]=\frac{1}{3}-\frac{1}{4}=\frac{1}{12}$ ✓, $x[-2]=\frac{1}{9}-\frac{1}{16}=\frac{7}{144}$ ✓.

> **Key exam point:** identical $X(z)$, different ROC, completely different $x[n]$. The long-division direction *is* the ROC choice.

---

## Method 3: Partial Fraction Expansion

### The Procedure

1. Make the numerator degree **less than** the denominator degree (long-divide first if not).
2. Form $X(z)/z$ — this is the trick that makes the numerators come out as table entries.
3. Expand into $\dfrac{A_k}{z-p_k}$.
4. Multiply back by $z$.
5. Match each term to a table pair using the ROC.

### Example: $X(z)=\dfrac{1+3z^{-1}}{1+3z^{-1}+2z^{-2}}$, $\vert z\vert>2$

Factor the denominator:

$$1+3z^{-1}+2z^{-2}=(1+z^{-1})(1+2z^{-1})$$

$$\frac{1+3z^{-1}}{(1+z^{-1})(1+2z^{-1})}=\frac{A}{1+z^{-1}}+\frac{B}{1+2z^{-1}}$$

Cover-up at $z^{-1}=-1$:

$$A=\frac{1+3(-1)}{1+2(-1)}=\frac{-2}{-1}=2$$

Cover-up at $z^{-1}=-1/2$:

$$B=\frac{1+3(-1/2)}{1+(-1/2)}=\frac{-1/2}{1/2}=-1$$

$$X(z)=\frac{2}{1+z^{-1}}-\frac{1}{1+2z^{-1}}$$

$$\boxed{x[n]=\left[2(-1)^n-(-2)^n\right]u[n]}$$

Check: $x[0]=2-1=1$, which equals $\lim_{z\to\infty}X(z)=1$ ✓.

### Example: $X(z)=\dfrac{z(z^2-4z+5)}{(z-3)(z-1)(z-2)}$, $\vert z\vert>3$

$$\frac{X(z)}{z}=\frac{z^2-4z+5}{(z-3)(z-1)(z-2)}=\frac{A}{z-3}+\frac{B}{z-1}+\frac{C}{z-2}$$

$$A=\frac{9-12+5}{(3-1)(3-2)}=\frac{2}{2}=1$$

$$B=\frac{1-4+5}{(1-3)(1-2)}=\frac{2}{2}=1$$

$$C=\frac{4-8+5}{(2-3)(2-1)}=\frac{1}{-1}=-1$$

$$X(z)=\frac{z}{z-3}+\frac{z}{z-1}-\frac{z}{z-2}$$

$$\boxed{x[n]=\left(3^n+1-2^n\right)u[n]}$$

Check: $x[0]=1+1-1=1=\lim_{z\to\infty}X(z)$ ✓.

---

## Standard Transform Pairs Used Above

| $X(z)$ | ROC | $x[n]$ |
|---|---|---|
| $1$ | all $z$ | $\delta[n]$ |
| $\dfrac{z}{z-1}$ | $\vert z\vert>1$ | $u[n]$ |
| $\dfrac{z}{z-a}$ | $\vert z\vert>a$ | $a^nu[n]$ |
| $\dfrac{z}{z-a}$ | $\vert z\vert<a$ | $-a^nu[-n-1]$ |
| $\dfrac{az^{-1}}{(1-az^{-1})^2}$ | $\vert z\vert>a$ | $na^nu[n]$ |
| $\dfrac{1}{1-z^{-1}}$ | $\vert z\vert>1$ | $u[n]$ |

---

## Choosing a Method

| Situation | Best method |
|---|---|
| $X(z)$ already a polynomial | Inspection |
| Need the first few samples only | Long division |
| Rational, need a closed form | Partial fractions |
| Denominator has repeated poles | Partial fractions with $A/(z-p)+B/(z-p)^2$ |
| Improper rational (num degree $\ge$ den) | Divide first, then partial fractions |

---

## Worked Mini-Drill

**Q:** Find $x[n]$ for $X(z)=\dfrac{1}{1-0.5z^{-1}}$, ROC $\vert z\vert>0.5$.

**A:** Direct table: $x[n]=(0.5)^n u[n]$.

**Q:** Same $X(z)$, ROC $\vert z\vert<0.5$.

**A:** Rewrite as a series in positive powers: $\dfrac{1}{1-0.5z^{-1}}=-\dfrac{0.5^{-1}z}{1-0.5^{-1}z}$, so $x[n]=-(0.5)^n u[-n-1]$.

**Q:** $X(z)=1+2z^{-1}+3z^{-2}$, all $z\ne0$.

**A:** $x[n]=\delta[n]+2\delta[n-1]+3\delta[n-2]=\{1,2,3\}$.
