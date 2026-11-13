---
title: "Innovations, the Schur Algorithm, and ARMA Lattice-Ladder Filters"
date: 2026-03-22 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'linear-prediction', 'lattice', 'spectral-estimation', 'cse409', 'jkkniu']
description: Proakis 12.2, 12.4.2 and 12.6.2 - innovations representation, rational power spectra, the Schur recursion and ARMA lattice-ladder realization.
math: true
---

## Why These Three Topics Belong Together

Linear prediction gives the best all-pole model of a random signal. Three ideas complete that picture:

- the **innovations representation** explains why every rational-spectrum process is a filter driven by white noise;
- the **Schur algorithm** computes the same reflection coefficients as Levinson-Durbin, but as a stability test;
- the **lattice-ladder** turns an all-pole lattice into a full ARMA filter by adding a numerator.

Read the earlier posts first if you need the base: [Linear Prediction, Normal Equations, Levinson-Durbin and LPC](/posts/linear-prediction-normal-equations-levinson-durbin-and-lpc/) and [RLS and Lattice Structures](/posts/rls-algorithm-and-lattice-structures/).

---

## Innovations Representation (Proakis 12.2)

A stationary random process $x[n]$ with a **rational power spectrum** can be written as the output of a causal, stable LTI system driven by white noise:

$$x[n]=\sum_{k=0}^{\infty}h[k]e[n-k]$$

where $e[n]$ is white with variance $\sigma_e^2$. The sequence $e[n]$ is called the **innovation**: it is the new information in $x[n]$ that the past cannot predict.

In the Z-domain the power spectrum factorizes as

$$\Gamma_{xx}(z)=\sigma_e^2 H(z)H(z^{-1})$$

For a real process, $H(z)$ has real coefficients, and the factorization is unique once $H(z)$ is chosen causal, stable, and minimum-phase (all poles and zeros inside the unit circle). That choice is the **spectral factor**.

### Example: first-order AR process

For $x[n]=a x[n-1]+e[n]$ with $\vert a\vert<1$,

$$H(z)=\frac{1}{1-az^{-1}},\qquad \Gamma_{xx}(z)=\frac{\sigma_e^2}{(1-az^{-1})(1-az)}$$

The autocorrelation is the two-sided geometric sequence

$$r_{xx}[k]=\frac{\sigma_e^2}{1-a^2}a^{\vert k\vert}$$

The innovation variance is the prediction-error power $\sigma_e^2=(1-a^2)r_{xx}[0]$, which is exactly the minimum mean-square prediction error of a first-order predictor.

### Rational power spectra (12.2.1)

A rational spectrum has the form

$$\Gamma_{xx}(z)=\sigma_e^2\frac{B(z)B(z^{-1})}{A(z)A(z^{-1})}$$

with

$$A(z)=1+\sum_{k=1}^{p}a_k z^{-k},\qquad B(z)=1+\sum_{k=1}^{q}b_k z^{-k}$$

Two consequences follow from the $z\leftrightarrow z^{-1}$ symmetry:

- If $z_0$ is a pole, then $1/z_0$ is also a pole. The same reciprocal pairing holds for zeros.
- The spectrum depends on the poles and zeros only through their magnitudes and angles mirrored about the unit circle.

For a stable, minimum-phase model, keep the roots inside the unit circle and discard their reciprocals. That selection is why spectral factorization is unique.

### Filter parameters and autocorrelation (12.2.2)

For the AR case, the denominator coefficients and the autocorrelation are linked by the Yule-Walker equations

$$\mathbf{R}\mathbf{a}=-\mathbf{r},\qquad \mathbf{R}_{ij}=r_{xx}[\vert i-j\vert]$$

The innovation variance follows from the last equation:

$$\sigma_e^2=r_{xx}[0]+\sum_{k=1}^{p}a_k r_{xx}[k]$$

So the spectrum, the autocorrelation, and the prediction filter are three views of the same information.

---

## The Schur Algorithm (Proakis 12.4.2)

Levinson-Durbin solves the normal equations order by order. The **Schur algorithm** performs the same order recursion directly on the polynomial coefficients or on the autocorrelation sequence, and it doubles as a stability test.

### Schur-Cohn stability test

Given

$$A_p(z)=1+a_1^{(p)}z^{-1}+\cdots+a_p^{(p)}z^{-p}$$

set $k_p=a_p^{(p)}$ and step down:

$$A_{m-1}(z)=\frac{A_m(z)-k_m z^{-m}A_m(z^{-1})}{1-k_m^2},\qquad k_m=a_m^{(m)}$$

All zeros of $A_p(z)$ lie strictly inside the unit circle if and only if

$$\vert k_m\vert<1\quad\text{for }m=1,2,\dots,p$$

The numbers $k_m$ are the **reflection coefficients** (partial autocorrelations). This is the same condition that Levinson-Durbin produces, but the Schur form organizes it as a cascade of tests, so it can stop early when a coefficient crosses one.

### Worked example

Test

$$A_2(z)=1-0.5z^{-1}+0.25z^{-2}$$

First reflection coefficient: $k_2=a_2^{(2)}=0.25$.

Now $A_2(z^{-1})=1-0.5z+0.25z^2$, so

$$z^{-2}A_2(z^{-1})=0.25-0.5z^{-1}+z^{-2}$$

Subtract term by term and divide by $1-k_2^2=0.9375$:

$$A_2(z)-0.25z^{-2}A_2(z^{-1})=(1-0.5z^{-1}+0.25z^{-2})-(0.25z^{-2}-0.125z^{-1}+0.0625)$$

$$=0.9375-0.375z^{-1}$$

$$A_1(z)=\frac{0.9375-0.375z^{-1}}{0.9375}=1-0.4z^{-1},\qquad k_1=-0.4$$

Both magnitudes are below one, so the polynomial is stable. As a check, the roots of $z^2-0.5z+0.25$ are $0.25\pm j0.433$, whose magnitude is $0.5<1$.

### Schur on the autocorrelation sequence

The same recursion can start from $r_{xx}[0],\dots,r_{xx}[p]$ instead of from the polynomial. It produces the reflection coefficients without forming or inverting the Toeplitz matrix, using $O(p^2)$ operations and no explicit normal-equation solve. In practice, libraries use it as a fast positive-definiteness and stability check before committing to a predictor.

---

## ARMA Lattice-Ladder Filters (Proakis 12.6)

### AR lattice recap (12.6.1)

With $f_0[n]=b_0[n]=x[n]$, the stage recursions are

$$f_m[n]=f_{m-1}[n]+k_m b_{m-1}[n-1]$$

$$b_m[n]=b_{m-1}[n-1]+k_m f_{m-1}[n]$$

The forward error at the last stage is the prediction error, and its transfer function is $1/A_M(z)$. The backward errors $b_m[n]$ are the internal signals that the ladder will use.

### Adding the ladder (12.6.2)

An ARMA system has

$$H(z)=\frac{B(z)}{A_M(z)},\qquad B(z)=1+\sum_{k=1}^{q}b_k z^{-k}$$

The lattice realizes $1/A_M(z)$. To realize the numerator, take a weighted sum of the backward errors:

$$y[n]=\sum_{m=0}^{M}c_m b_m[n]$$

Because the transfer function from $x[n]$ to $b_m[n]$ is

$$\frac{z^{-m}A_m(z^{-1})}{A_M(z)}$$

the overall response is

$$H(z)=\frac{1}{A_M(z)}\sum_{m=0}^{M}c_m z^{-m}A_m(z^{-1})=\frac{B(z)}{A_M(z)}$$

The polynomials $z^{-m}A_m(z^{-1})$ form a basis for all polynomials of degree at most $M$, so **any numerator** $B(z)$ of degree $q\le M$ can be matched by choosing the ladder coefficients $c_m$. For a purely AR system, set $c_0=1$ and all other $c_m=0$.

### How to compute the coefficients

1. Run Levinson-Durbin (or Schur) on the autocorrelation to get $k_1,\dots,k_M$ and $A_M(z)$.
2. Form the backward prediction-error polynomials $B_m(z)=z^{-m}A_m(z^{-1})$ for $m=0,\dots,M$.
3. Solve the triangular system $B(z)=\sum_{m=0}^{M}c_m B_m(z)$ for $c_m$, starting from the highest power.

The result is a cascade of lattice stages followed by a ladder, with the same numerical advantages as the AR lattice: modular structure, bounded internal signals, and graceful behavior under coefficient quantization.

### Why lattice-ladder is used

- **Low sensitivity:** a coefficient change affects the reflection coefficient locally, not the whole polynomial.
- **Stability monitoring:** keeping $\vert k_m\vert<1$ keeps the all-pole part stable during adaptation.
- **Efficient adaptation:** gradient or RLS updates can be applied stage by stage, which is the basis of adaptive lattice filters.
- **Unified AR/ARMA:** the same hardware realizes both by changing the ladder taps.

---

## Properties of the Prediction-Error Filter (Proakis 12.5)

The prediction-error filter is

$$A(z)=1-\sum_{k=1}^{p}a_k z^{-k}$$

Its key properties:

- If the model order matches the process and the predictor is optimal, the error $e[n]$ is white with variance $\sigma_e^2$.
- For a stable AR process, $A(z)$ is **minimum-phase**: all zeros lie inside the unit circle. That is exactly the $\vert k_m\vert<1$ condition in lattice form.
- Increasing the order never increases the minimum error power: $\sigma_{e,p+1}^2\le\sigma_{e,p}^2$.
- The reflection coefficients are the negative of the last Levinson coefficient at each order, and they equal the partial autocorrelations of the process.
- The error filter whitens the signal, so $1/A(z)$ is the whitening inverse and $A(z)$ is the synthesis filter.

---

## Summary

| Idea | Core statement | Use |
|---|---|---|
| Innovations | $x[n]=h[n]*e[n]$, $e$ white | spectral factorization, simulation |
| Rational spectrum | $\Gamma=\sigma_e^2 BB^{*}/AA^{*}$ | model-based spectrum estimation |
| Schur | step-down on $A(z)$ or $r[k]$ | fast stability and reflection coefficients |
| AR lattice | $f_m,b_m$ recursions | robust all-pole realization |
| Ladder | $y=\sum c_m b_m$ | adds the numerator for ARMA |

Next: [Fast RLS, Square-Root RLS, and Least-Squares AR Estimation](/posts/fast-rls-square-root-and-least-squares-ar/).
