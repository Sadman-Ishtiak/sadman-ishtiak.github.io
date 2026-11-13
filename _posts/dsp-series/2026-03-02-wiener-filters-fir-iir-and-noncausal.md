---
title: "Wiener Filters: FIR, IIR, and Noncausal Optimum Filtering"
date: 2026-03-02 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'wiener-filter', 'optimum-filtering', 'adaptive-filters', 'academic', 'cse409', 'cse410', 'jkkniu']
description: The orthogonality principle, the Wiener-Hopf equation, FIR and IIR solutions, and why the noncausal Wiener filter is unrealizable but useful.
math: true
---
## The Optimum Filtering Problem

We observe

$$x[n]=s[n]+v[n]$$

where $s[n]$ is the desired signal and $v[n]$ is additive noise. We want a filter $h[n]$ whose output $\hat s[n]$ is as close as possible to $s[n]$ in the **mean-square** sense:

$$J=E\left\{(s[n]-\hat s[n])^2\right\}=\min$$

The estimate is a linear convolution:

$$\hat s[n]=\sum_{k}h[k]\,x[n-k]$$

This is the **Wiener filter** problem. It is the linear minimum-mean-square-error (LMMSE) estimator.

---

## The Orthogonality Principle

The error

$$e[n]=s[n]-\hat s[n]$$

must be **orthogonal to the data** used to form the estimate:

$$E\left\{e[n]\,x[n-m]\right\}=0,\qquad \forall m$$

### Why

Suppose the error had a nonzero correlation with some $x[n-m]$. Then you could adjust $h[m]$ slightly to reduce the error power — contradicting optimality. At the optimum, no such adjustment is possible, so the error contains nothing more that the data can explain.

This is the single most important idea in optimum filtering. Every derivation below is just this principle written out.

### Geometric Picture

The estimate $\hat s[n]$ is the **projection** of $s[n]$ onto the subspace spanned by $\{x[n-k]\}$. The error is the component orthogonal to that subspace. This is exactly the least-squares projection from linear algebra, applied to random variables.

---

## The Wiener–Hopf Equation

Substitute the estimate into the orthogonality condition:

$$E\left\{\left(s[n]-\sum_k h[k]x[n-k]\right)x[n-m]\right\}=0$$

$$E\{s[n]x[n-m]\}=\sum_k h[k]E\{x[n-k]x[n-m]\}$$

Define the cross-correlation and autocorrelation:

$$r_{sx}[m]=E\{s[n]x[n-m]\},\qquad r_{xx}[m-k]=E\{x[n-k]x[n-m]\}$$

Then

$$\boxed{r_{sx}[m]=\sum_{k}h[k]\,r_{xx}[m-k],\qquad \forall m}$$

This is the **Wiener–Hopf equation**. It is a convolution: the cross-correlation equals the filter convolved with the autocorrelation.

### Minimum Error

$$J_{\min}=E\{s^2[n]\}-\sum_k h[k]r_{sx}[k]=r_{ss}[0]-\sum_k h[k]r_{sx}[k]$$

The second term is the part of the signal power the filter recovers.

---

## FIR Wiener Filter

Restrict the filter to $M$ taps: $k=0,1,\dots,M-1$. The Wiener–Hopf equation becomes a finite matrix system:

$$\mathbf{R}\mathbf{h}=\mathbf{p}$$

where

$$\mathbf{R}=\begin{bmatrix}r_{xx}[0]&r_{xx}[1]&\dots&r_{xx}[M-1]\\r_{xx}[1]&r_{xx}[0]&\dots&r_{xx}[M-2]\\\vdots&&\ddots&\vdots\\r_{xx}[M-1]&r_{xx}[M-2]&\dots&r_{xx}[0]\end{bmatrix}$$

$$\mathbf{h}=[h[0],h[1],\dots,h[M-1]]^T$$

$$\mathbf{p}=[r_{sx}[0],r_{sx}[1],\dots,r_{sx}[M-1]]^T$$

The solution is

$$\mathbf{h}_{\text{opt}}=\mathbf{R}^{-1}\mathbf{p}$$

$\mathbf{R}$ is Toeplitz, so Levinson-Durbin solves this in $O(M^2)$ rather than $O(M^3)$.

### Worked Example: Noise Reduction

Let $s[n]$ and $v[n]$ be uncorrelated, with $s[n]$ white of power $\sigma_s^2$ and $v[n]$ white of power $\sigma_v^2$.

Then

$$r_{xx}[m]=(\sigma_s^2+\sigma_v^2)\delta[m],\qquad r_{sx}[m]=\sigma_s^2\delta[m]$$

$\mathbf{R}=(\sigma_s^2+\sigma_v^2)\mathbf{I}$ and $\mathbf{p}=[\sigma_s^2,0,\dots,0]^T$. Therefore

$$h[0]=\frac{\sigma_s^2}{\sigma_s^2+\sigma_v^2},\qquad h[k]=0\ \text{for }k\ge1$$

The optimum filter is a **single scalar gain**. That makes sense: white signal plus white noise has no temporal structure to exploit, so the best you can do is scale down by the SNR factor.

$$\text{SNR}=\frac{\sigma_s^2}{\sigma_v^2}:\qquad h[0]=\frac{\text{SNR}}{1+\text{SNR}}$$

As $\text{SNR}\to\infty$, $h[0]\to1$ (pass the signal). As $\text{SNR}\to0$, $h[0]\to0$ (block everything).

---

## IIR Wiener Filter

Allow an infinite causal filter. The Wiener–Hopf equation becomes

$$r_{sx}[m]=\sum_{k=0}^{\infty}h[k]r_{xx}[m-k],\qquad m\ge0$$

Taking the bilateral Z-transform:

$$S_{sx}(z)=H(z)S_{xx}(z)$$

so formally

$$H(z)=\frac{S_{sx}(z)}{S_{xx}(z)}$$

But this is not directly realizable, because $h[n]$ must be **causal**. The solution requires **spectral factorization**.

### Spectral Factorization

Write the power spectrum as

$$S_{xx}(z)=\sigma_w^2\,L(z)L(z^{-1})$$

where $L(z)$ is causal, minimum-phase, and monic ($L(0)=1$). Only the causal, minimum-phase factor can be inverted stably.

The causal IIR Wiener filter is

$$H(z)=\frac{1}{\sigma_w^2L(z)}\left[\frac{S_{sx}(z)}{L(z^{-1})}\right]_{+}$$

where $[\cdot]_+$ means "keep the causal part" of the partial-fraction expansion.

### The Intuition

Without the causality constraint, the filter is $S_{sx}/S_{xx}$ — a simple ratio. The constraint forces you to split $S_{xx}$ into a part you can invert causally ($L$) and a part you cannot ($L(z^{-1})$), then keep only what is realizable. The result is always worse than the noncausal solution.

---

## Noncausal Wiener Filter

If you allow the filter to look into the future ($k$ from $-\infty$ to $\infty$), the Wiener–Hopf equation has no causality restriction and the Z-transform gives directly

$$\boxed{H(z)=\frac{S_{sx}(z)}{S_{xx}(z)}}$$

or in the frequency domain

$$H(e^{j\omega})=\frac{S_{sx}(e^{j\omega})}{S_{xx}(e^{j\omega})}$$

This is the **noncausal Wiener filter**. It is the best possible linear filter, and it is not realizable in real time — but it is extremely useful as a **performance bound** and as a building block for offline processing.

### Special Case: Signal Plus Uncorrelated Noise

If $s$ and $v$ are uncorrelated, then

$$S_{sx}=S_{ss},\qquad S_{xx}=S_{ss}+S_{vv}$$

$$H(e^{j\omega})=\frac{S_{ss}(e^{j\omega})}{S_{ss}(e^{j\omega})+S_{vv}(e^{j\omega})}$$

This is a **frequency-dependent Wiener gain**:

| Frequency | Filter gain | Interpretation |
|---|---|---|
| $S_{ss}\gg S_{vv}$ | $\approx1$ | Signal dominates — pass |
| $S_{ss}\ll S_{vv}$ | $\approx0$ | Noise dominates — block |
| $S_{ss}=S_{vv}$ | $0.5$ | Equal — attenuate by 6 dB |

The filter opens where the signal is strong and closes where the noise is strong. This is the optimal **spectral subtraction** rule, and it is the basis of every noise-suppression algorithm.

### Minimum MSE

$$J_{\min}=\frac{1}{2\pi}\int_{-\pi}^{\pi}\frac{S_{ss}(e^{j\omega})S_{vv}(e^{j\omega})}{S_{ss}(e^{j\omega})+S_{vv}(e^{j\omega})}\,d\omega$$

The integrand is the harmonic mean of signal and noise spectra — small when either is small, which is exactly why the filter works.

---

## Comparison of the Three

| Filter | Constraint | Solution | Realizable? | MSE |
|---|---|---|---|---|
| Noncausal | none | $S_{sx}/S_{xx}$ | No | Lowest |
| IIR causal | causal, infinite | spectral factorization | Yes | Between |
| FIR causal | causal, $M$ taps | $\mathbf{R}^{-1}\mathbf{p}$ | Yes | Highest |

The ordering is always the same: more constraints means higher error. The noncausal filter is the lower bound.

---

## Wiener vs LMS

| Aspect | Wiener | LMS |
|---|---|---|
| Statistics | Known in advance | Estimated on the fly |
| Cost | Solve $\mathbf{R}\mathbf{h}=\mathbf{p}$ once | $O(M)$ per sample, iterative |
| Non-stationary signals | Must re-solve | Tracks automatically |
| Steady-state error | Optimal | Excess MSE above optimal |
| Use | Offline, known statistics | Real-time, unknown statistics |

The LMS update

$$\mathbf{h}[n+1]=\mathbf{h}[n]+\mu\,e[n]\mathbf{x}[n]$$

is a stochastic gradient descent on the same MSE surface. At convergence, the LMS filter approaches the Wiener solution, with an excess MSE set by the step size $\mu$.

---

## Applications

| Application | Signal | Noise | Filter role |
|---|---|---|---|
| **Noise cancellation** | Speech | Correlated reference noise | Adaptive Wiener/LMS |
| **Channel equalization** | Transmitted symbols | ISI | Inverse channel filter |
| **Echo cancellation** | Near-end speech | Far-end echo | Adaptive Wiener |
| **Signal prediction** | Past samples | — | One-step predictor |
| **Beamforming** | Desired direction | Interference | Spatial Wiener filter |
| **Image denoising** | Image | Sensor noise | Noncausal Wiener in 2-D |

---

## Summary

1. The Wiener filter minimizes mean-square error and is characterized by the orthogonality principle: the error is orthogonal to the data.
2. The Wiener–Hopf equation is $r_{sx}[m]=\sum_k h[k]r_{xx}[m-k]$.
3. The FIR solution is $\mathbf{h}=\mathbf{R}^{-1}\mathbf{p}$ with a Toeplitz autocorrelation matrix.
4. The causal IIR solution needs spectral factorization; the noncausal solution is simply $S_{sx}/S_{xx}$.
5. For uncorrelated signal and noise, the optimal gain is $S_{ss}/(S_{ss}+S_{vv})$ — open where the signal is strong.
6. LMS is the adaptive, sample-by-sample approximation to the Wiener solution.
