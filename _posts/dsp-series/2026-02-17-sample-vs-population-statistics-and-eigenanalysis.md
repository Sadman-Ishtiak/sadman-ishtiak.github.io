---
title: "Sample vs Population Statistics, Covariance, and Eigenanalysis"
date: 2026-02-17 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'statistics', 'signal-analysis', 'linear-algebra', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Why standard deviation divides by n-1, a worked A/B/C spread comparison, sample covariance, and what eigenvectors and eigenvalues mean for signals.
math: true
---
## Two Kinds of Standard Deviation

The lecture formula for standard deviation is

$$\text{SD} = \sqrt{\frac{\sum_{i=1}^{n}(X_i-\bar X)^2}{n-1}}$$

The $n-1$ is not a typo and not a convention. It is the **Bessel correction**.

### Why n-1 and not n?

To compute the deviation you must first compute the sample mean $\bar X$. That mean is itself estimated from the same $n$ data points, so the deviations are not independent: once $n-1$ of them are known, the last one is forced, because

$$\sum_{i=1}^{n}(X_i-\bar X)=0$$

Only $n-1$ deviations carry new information. Dividing by $n$ would therefore **underestimate** the true spread. Dividing by $n-1$ (the degrees of freedom) makes the estimator **unbiased**:

$$E\left[\frac{1}{n-1}\sum (X_i-\bar X)^2\right] = \sigma^2$$

| Estimator | Denominator | Use |
|---|---|---|
| Population variance | $N$ | You have the whole population |
| Sample variance | $n-1$ | You have a sample and estimate $\sigma^2$ |
| Biased ML estimate | $n$ | Used when you want the minimum-MSE estimate, not an unbiased one |

For large $n$ the difference vanishes; for $n=4$ it is a 33% difference.

---

## Worked Example: Same Mean, Different Spread

The lecture asks for the SD of three sets:

$$A=[0,\ 8,\ 12,\ 20],\quad B=[8,\ 9,\ 11,\ 12],\quad C=[10,\ 10,\ 10,\ 10]$$

All three have mean

$$\bar X = \frac{0+8+12+20}{4} = \frac{40}{4} = 10$$

### Set A

Deviations from 10: $-10,\ -2,\ 2,\ 10$. Squared: $100,\ 4,\ 4,\ 100$.

$$\sum (X_i-\bar X)^2 = 208$$

$$s_A^2 = \frac{208}{3} = 69.33, \qquad s_A = 8.33$$

### Set B

Deviations: $-2,\ -1,\ 1,\ 2$. Squared: $4,\ 1,\ 1,\ 4$.

$$\sum (X_i-\bar X)^2 = 10$$

$$s_B^2 = \frac{10}{3} = 3.33, \qquad s_B = 1.83$$

### Set C

Every deviation is zero.

$$s_C^2 = 0, \qquad s_C = 0$$

### The Point

| Set | Mean | Sample SD | Interpretation |
|---|---|---|---|
| A | 10 | 8.33 | Widely spread |
| B | 10 | 1.83 | Tightly clustered |
| C | 10 | 0 | Perfectly constant |

**Same mean, completely different signals.** The mean alone is not enough to describe a signal; the second moment is what captures "how much is happening."

> If you use the population formula, A gives $\sqrt{52}=7.21$, B gives $\sqrt{2.5}=1.58$, C gives 0. The ordering is identical; only the scale changes.

---

## Sample Covariance

Covariance measures whether two variables move together:

$$\text{cov}(X,Y) = \frac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar X)(Y_i-\bar Y)$$

- $\text{cov} > 0$: when $X$ is above its mean, $Y$ tends to be above its mean too (positively related).
- $\text{cov} < 0$: $X$ above its mean goes with $Y$ below its mean (inversely related).
- $\text{cov} = 0$: no **linear** relationship.

**Worked example.** $X=[1,2,3,4]$, $Y=[2,4,6,8]$.

$$\bar X = 2.5,\quad \bar Y = 5$$

$$\sum (X_i-\bar X)(Y_i-\bar Y) = (-1.5)(-3)+(-0.5)(-1)+(0.5)(1)+(1.5)(3) = 4.5+0.5+0.5+4.5 = 10$$

$$\text{cov}(X,Y) = \frac{10}{3} = 3.33$$

Positive, because $Y=2X$ is an increasing relationship.

### Covariance vs Correlation

Covariance is **scale-dependent** — volts times seconds, or volts squared. Correlation normalizes it away:

$$r_{XY} = \frac{\text{cov}(X,Y)}{\sigma_X \sigma_Y}, \qquad -1 \le r_{XY} \le 1$$

| Quantity | Units | Range | Meaning |
|---|---|---|---|
| Covariance | product of units | unbounded | Direction of linear relation |
| Correlation | none | $[-1,1]$ | Direction **and strength** |

In DSP the same idea applied to a signal and its shifted self is the **autocorrelation**:

$$r_{xx}[k] = \frac{1}{N}\sum_{n=0}^{N-1}x[n]\,x[n+k]$$

and the normalized version is the correlation coefficient.

---

## Eigenvectors and Eigenvalues

"Eigen" is German for "proper" or "characteristic". An **eigenvector** of a square matrix $A$ is a non-zero vector whose **direction does not change** when $A$ is applied:

$$A\mathbf{x} = \lambda \mathbf{x}$$

- $\mathbf{x}$ is the eigenvector.
- $\lambda$ is the eigenvalue — the scalar by which the eigenvector is stretched or shrunk.

The lecture picture is a **shear mapping**: one arrow changes direction under the shear, but the blue arrow does not, and its length is unchanged, so its eigenvalue is 1.

### Finding Them

Solve the **characteristic equation**:

$$\det(A-\lambda I)=0$$

**Example.** Let

$$A=\begin{bmatrix}2 & 1\\ 1 & 2\end{bmatrix}$$

$$\det\begin{bmatrix}2-\lambda & 1\\ 1 & 2-\lambda\end{bmatrix} = (2-\lambda)^2-1 = 0$$

$$\lambda^2-4\lambda+3=0 \;\Rightarrow\; (\lambda-1)(\lambda-3)=0$$

So $\lambda_1=1$ and $\lambda_2=3$.

For $\lambda=1$: $(A-I)\mathbf{x}=0$ gives $x_1+x_2=0$, so $\mathbf{x}_1=[1,-1]^T$.

For $\lambda=3$: $(A-3I)\mathbf{x}=0$ gives $-x_1+x_2=0$, so $\mathbf{x}_2=[1,1]^T$.

**Check:** $A[1,1]^T=[3,3]^T=3[1,1]^T$. Correct.

### Why DSP Cares

| Application | What the eigen-structure provides |
|---|---|
| **Covariance / correlation matrices** | Eigenvectors give the principal directions of the signal's variability (PCA) |
| **LPC / spectral estimation** | Eigenvalues of the autocorrelation matrix separate signal subspace from noise subspace (MUSIC, ESPRIT, Pisarenko) |
| **Adaptive filters** | Eigenvalue spread of the input autocorrelation matrix sets the convergence rate of LMS |
| **Filter banks / KLT** | The KLT basis is the eigenvector basis of the covariance matrix — the optimal decorrelating transform |
| **Stability analysis** | Eigenvalues of the state matrix must lie inside the unit circle |

The eigenvalue spread $\lambda_{\max}/\lambda_{\min}$ is the single number that decides how hard an adaptive filter has to work.

---

## Summary

1. Use $n-1$ when the mean is estimated from the same data — it removes the bias.
2. Identical means can hide completely different signals; SD and variance expose that.
3. Covariance gives direction, correlation gives direction plus strength on a fixed $[-1,1]$ scale.
4. Eigenvectors are the directions a matrix leaves unchanged; eigenvalues are the stretch factors.
5. The eigen-structure of the autocorrelation matrix underlies PCA, MUSIC, ESPRIT, and LMS convergence.
