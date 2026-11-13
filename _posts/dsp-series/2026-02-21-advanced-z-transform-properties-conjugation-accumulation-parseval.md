---
title: "Advanced Z-Transform Properties: Conjugation, Accumulation, Correlation, and Parseval"
date: 2026-02-21 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'z-transform', 'properties', 'parseval', 'academic', 'cse409', 'cse410', 'jkkniu']
description: The full property table beyond shifting and convolution, with ROC rules and proofs of accumulation and Parseval.
math: true
---
## The Complete Property Table

Let

$$x[n]\;\xleftrightarrow{\;\mathcal{Z}\;}X(z),\quad \text{ROC}=R_x \qquad y[n]\;\xleftrightarrow{\;\mathcal{Z}\;}Y(z),\quad \text{ROC}=R_y$$

| Property | Time domain | Z-domain | ROC |
|---|---|---|---|
| Linearity | $ax[n]+by[n]$ | $aX(z)+bY(z)$ | contains $R_x\cap R_y$ |
| Time shift | $x[n-n_0]$ | $z^{-n_0}X(z)$ | $R_x$ (minus $z=0$ or $\infty$) |
| Frequency shift | $e^{j\omega_0 n}x[n]$ | $X(e^{-j\omega_0}z)$ | $R_x$ |
| Exponential scaling | $a^n x[n]$ | $X(a^{-1}z)$ | $\vert a\vert R_x$ |
| Differentiation | $n\,x[n]$ | $-z\dfrac{dX(z)}{dz}$ | $R_x$ |
| **Conjugation** | $x^*[n]$ | $X^*(z^*)$ | $R_x$ |
| **Reversal** | $x[-n]$ | $X(1/z)$ | $1/R_x$ |
| **Real part** | $\operatorname{Re}\{x[n]\}$ | $\tfrac12[X(z)+X^*(z^*)]$ | $R_x$ |
| **Imaginary part** | $\operatorname{Im}\{x[n]\}$ | $\tfrac{1}{2j}[X(z)-X^*(z^*)]$ | $R_x$ |
| Convolution | $x[n]*y[n]$ | $X(z)Y(z)$ | contains $R_x\cap R_y$ |
| **Correlation** | $r_{xy}[n]=\sum_k x[k]y[k-n]$ | $X(z)Y(z^{-1})$ | contains $R_x\cap 1/R_y$ |
| **Accumulation** | $\sum_{k=-\infty}^{n}x[k]$ | $\dfrac{X(z)}{1-z^{-1}}$ | contains $R_x\cap\{\vert z\vert>1\}$ |
| Multiplication | $x[n]y[n]$ | $\dfrac{1}{2\pi j}\oint_C X(v)Y(z/v)v^{-1}dv$ | — |
| **Parseval** | $\sum_n x[n]y^*[n]$ | $\dfrac{1}{2\pi j}\oint_C X(z)Y^*(1/z^*)z^{-1}dz$ | — |

---

## Conjugation and Its Consequences

$$x^*[n]\;\longleftrightarrow\;X^*(z^*),\qquad \text{ROC}=R_x$$

**Proof.**

$$\sum_n x^*[n]z^{-n}=\left(\sum_n x[n](z^*)^{-n}\right)^*=X^*(z^*)$$

### What Conjugation Buys You

For a **real** sequence $x[n]=x^*[n]$, the property forces

$$X(z)=X^*(z^*)$$

On the unit circle $z=e^{j\omega}$, $z^*=e^{-j\omega}$, so

$$X(e^{j\omega})=X^*(e^{-j\omega})$$

This is **conjugate symmetry** of the DTFT of any real signal. Splitting into magnitude and phase:

$$\vert X(e^{j\omega})\vert=\vert X(e^{-j\omega})\vert \quad\text{(even)}$$

$$\angle X(e^{j\omega})=-\angle X(e^{-j\omega}) \quad\text{(odd)}$$

Consequences you use constantly:

- A real signal's spectrum needs only $\omega\in[0,\pi]$; the negative half is redundant.
- The DFT of a real $N$-point sequence satisfies $X[N-k]=X^*[k]$.
- Real filters have real coefficients, so $H(e^{j\omega})$ is conjugate-symmetric — the phase is odd and the magnitude is even.

---

## Real and Imaginary Parts

Decompose $x[n]=x_r[n]+jx_i[n]$. Then

$$x_r[n]=\tfrac12\left(x[n]+x^*[n]\right) \;\longleftrightarrow\; \tfrac12\left[X(z)+X^*(z^*)\right]$$

$$x_i[n]=\tfrac{1}{2j}\left(x[n]-x^*[n]\right) \;\longleftrightarrow\; \tfrac{1}{2j}\left[X(z)-X^*(z^*)\right]$$

These are just conjugation combined with linearity. They are useful when separating the response of a complex-valued system into its real and quadrature channels.

---

## Time Reversal

$$x[-n]\;\longleftrightarrow\;X(1/z),\qquad \text{ROC}=1/R_x$$

**Proof:** substitute $m=-n$:

$$\sum_n x[-n]z^{-n}=\sum_m x[m](z^{-1})^{-m}=X(z^{-1})$$

The ROC inverts: if $R_x$ is $\vert z\vert>r$, the reversed signal's ROC is $\vert z\vert<1/r$.

Practical use: reversing a sequence turns a causal filter into an anti-causal one, which is exactly how **zero-phase filtering** (`filtfilt`) works — filter forward, reverse, filter again, reverse back, so the phase distortions cancel.

---

## Convolution and Correlation

**Convolution:**

$$y[n]=x[n]*y_0[n]=\sum_k x[k]\,y_0[n-k] \;\longleftrightarrow\; Y_0(z)=X(z)Y_0(z)$$

**Correlation** (note the missing time reversal compared with convolution):

$$r_{xy}[n]=\sum_{k=-\infty}^{\infty}x[k]\,y[k-n] \;\longleftrightarrow\; R_{xy}(z)=X(z)Y(z^{-1})$$

**Proof.** Let $m=k-n$, so $k=m+n$:

$$\sum_n r_{xy}[n]z^{-n}=\sum_n\sum_k x[k]y[k-n]z^{-n}=\sum_k x[k]z^{k}\sum_m y[m]z^{-m}$$

$$=\left(\sum_k x[k](z^{-1})^{-k}\right)\left(\sum_m y[m]z^{-m}\right)=X(z^{-1})\,Y(z)$$

(equivalently $X(z)Y(z^{-1})$ by re-indexing). For the autocorrelation, $Y=X$:

$$r_{xx}[n]\;\longleftrightarrow\;X(z)X(z^{-1})$$

On the unit circle this becomes $\vert X(e^{j\omega})\vert^2$ — the **energy spectral density**. That is the Z-domain statement of the Wiener–Khinchine theorem.

---

## Accumulation

$$y[n]=\sum_{k=-\infty}^{n}x[k]\;\longleftrightarrow\;Y(z)=\frac{X(z)}{1-z^{-1}}$$

**Proof.** Note $y[n]-y[n-1]=x[n]$. Transform both sides:

$$Y(z)-z^{-1}Y(z)=X(z)\;\Rightarrow\;Y(z)(1-z^{-1})=X(z)$$

The ROC must contain both $R_x$ and $\vert z\vert>1$, because the accumulator has a pole at $z=1$. This is the discrete counterpart of integration ($1/s$ in the Laplace domain).

**Example.** $x[n]=\delta[n]$ accumulates to $u[n]$:

$$X(z)=1,\qquad Y(z)=\frac{1}{1-z^{-1}}=U(z) \;\checkmark$$

**Stability warning:** the accumulator is **marginally stable** — its pole sits exactly on the unit circle at $z=1$. A bounded input like $u[n]$ produces an unbounded output, so the accumulator is not BIBO stable.

---

## Parseval's Relation

For two sequences:

$$\sum_{n=-\infty}^{\infty}x[n]\,y^*[n]=\frac{1}{2\pi j}\oint_C X(z)\,Y^*(1/z^*)\,z^{-1}\,dz$$

For $y=x$ this is the **energy theorem**:

$$\sum_n \vert x[n]\vert^2=\frac{1}{2\pi j}\oint_C X(z)X^*(1/z^*)\,z^{-1}\,dz$$

On the unit circle $z=e^{j\omega}$, $dz=j e^{j\omega}d\omega=jz\,d\omega$, so $z^{-1}dz=j\,d\omega$ and the contour integral collapses to

$$\boxed{\sum_n \vert x[n]\vert^2=\frac{1}{2\pi}\int_{-\pi}^{\pi}\vert X(e^{j\omega})\vert^2\,d\omega}$$

**Meaning:** energy computed in time equals energy computed in frequency. No energy is lost or created by the transform; the transform only redistributes it.

### Discrete (DFT) Version

$$\sum_{n=0}^{N-1}\vert x[n]\vert^2=\frac{1}{N}\sum_{k=0}^{N-1}\vert X[k]\vert^2$$

This is the version you actually use numerically. It lets you compute signal energy from the FFT without ever reconstructing the time signal.

---

## Worked ROC Problems

### Example 1: Sum of Two Right-Sided Sequences

$$x[n]=\left(\tfrac12\right)^n u[n]+\left(\tfrac13\right)^n u[n]$$

Poles at $z=\tfrac12$ and $z=\tfrac13$. Both are right-sided, so

$$X(z)=\frac{z}{z-\frac12}+\frac{z}{z-\frac13},\qquad \text{ROC: }\vert z\vert>\frac12$$

The ROC is the **intersection** of the individual ROCs, bounded by the outermost pole.

### Example 2: Right-Sided Plus Left-Sided

$$x[n]=\left(\tfrac12\right)^n u[n]-\left(\tfrac13\right)^n u[-n-1]$$

First term: pole at $\tfrac12$, ROC $\vert z\vert>\tfrac12$. Second term: pole at $\tfrac13$, ROC $\vert z\vert<\tfrac13$.

$$X(z)=\frac{z}{z-\frac12}+\frac{z}{z-\tfrac13},\qquad \text{ROC: }\frac13<\vert z\vert<\frac12$$

The intersection is empty unless the two sides do not overlap — here $\tfrac13<\tfrac12$, so the ROC is the annulus between the poles and is **non-empty**. If the second pole had been at $\tfrac23$, the intersection would be empty and no Z-transform would exist for that combination.

### Example 3: Finite-Length Sequence

$$x[n]=\{1,\ 2,\ 3\},\quad n=0,1,2$$

$$X(z)=1+2z^{-1}+3z^{-2}$$

The ROC is the entire $z$-plane except $z=0$ (because of the $z^{-1}$ and $z^{-2}$ terms). A finite sequence has no poles, so nothing bounds its ROC.

### Example 4: Does the DTFT Exist?

$$x[n]=2^n u[n]$$

$$X(z)=\frac{z}{z-2},\qquad \text{ROC: }\vert z\vert>2$$

The ROC does **not** include the unit circle $\vert z\vert=1$, so the DTFT does not exist — the sequence grows without bound. The Z-transform still exists as a formal object, which is precisely why the Z-transform is more general.

---

## Property Cheat Sheet by Question Type

| Question asks | Property to reach for |
|---|---|
| "Effect of delaying by 3?" | $z^{-3}X(z)$ |
| "Effect of multiplying by $n$?" | $-z\,dX/dz$ |
| "Effect of reversing?" | $X(1/z)$, ROC inverts |
| "Is the DTFT real/even?" | Conjugation + real signal |
| "Relate convolution and correlation" | $X(z)Y(z)$ vs $X(z)Y(z^{-1})$ |
| "Energy in frequency domain" | Parseval |
| "Output of an accumulator" | $X(z)/(1-z^{-1})$ |
| "Where can the ROC be?" | Intersection of individual ROCs, never containing poles |
