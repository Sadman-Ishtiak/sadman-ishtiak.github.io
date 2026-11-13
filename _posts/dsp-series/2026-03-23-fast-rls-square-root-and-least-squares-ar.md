---
title: "Fast RLS, Square-Root RLS, and Least-Squares AR Estimation"
date: 2026-03-23 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'adaptive-filters', 'rls', 'linear-prediction', 'cse409', 'jkkniu']
description: Proakis 13.3.2-13.3.3 and 14.3.4-14.3.5 - LDU and square-root RLS, fast RLS, unconstrained least-squares AR models, and sequential estimation.
math: true
---

## Where This Fits

The [RLS post](/posts/rls-algorithm-and-lattice-structures/) derived the exact recursive least-squares update and showed the lattice-ladder form. That still leaves four practical questions:

- How do you keep RLS numerically stable when the covariance matrix loses positive definiteness?
- How do you get the cost down from $O(N^2)$ to $O(N)$ per sample?
- What changes if the AR model is fitted by least squares on the data instead of by Yule-Walker on the autocorrelation?
- How is that fit updated when new samples arrive?

This post answers all four.

---

## Standard RLS in One Block

With regressor $\mathbf{u}[n]$, desired signal $d[n]$, and forgetting factor $\lambda\in(0,1]$:

$$\mathbf{k}[n]=\frac{\lambda^{-1}\mathbf{P}[n-1]\mathbf{u}[n]}{1+\lambda^{-1}\mathbf{u}^{T}[n]\mathbf{P}[n-1]\mathbf{u}[n]}$$

$$\alpha[n]=d[n]-\mathbf{w}^{T}[n-1]\mathbf{u}[n]$$

$$\mathbf{w}[n]=\mathbf{w}[n-1]+\mathbf{k}[n]\alpha[n]$$

$$\mathbf{P}[n]=\lambda^{-1}\mathbf{P}[n-1]-\lambda^{-1}\mathbf{k}[n]\mathbf{u}^{T}[n]\mathbf{P}[n-1]$$

The cost is $O(N^2)$ per sample because $\mathbf{P}$ is $N\times N$. The update subtracts a rank-one matrix, and in finite precision that subtraction can destroy symmetry or push an eigenvalue slightly negative. Once $\mathbf{P}$ is indefinite, the filter can diverge.

---

## LDU and Square-Root RLS (Proakis 13.3.2)

### LDU factorization

Write the inverse correlation matrix as

$$\mathbf{P}=\mathbf{L}\mathbf{D}\mathbf{L}^{T}$$

where $\mathbf{L}$ is unit lower triangular and $\mathbf{D}$ is diagonal. Instead of updating $\mathbf{P}$ directly, the LDU-RLS algorithm updates $\mathbf{L}$ and $\mathbf{D}$. The diagonal entries of $\mathbf{D}$ are positive for a positive-definite matrix, so a sign check after each update catches numerical trouble immediately.

### Square-root RLS

The square-root form keeps a factor $\mathbf{S}$ such that

$$\mathbf{P}=\mathbf{S}\mathbf{S}^{T}$$

The update propagates $\mathbf{S}$ through a sequence of Givens rotations or Householder transformations. Because the factor is updated rather than the product, $\mathbf{P}$ stays positive semidefinite by construction: the algorithm cannot produce a negative variance.

**Cost and benefit.** Square-root RLS costs roughly two to three times the standard RLS arithmetic, but it is the version used when the filter must run for millions of samples in fixed or single precision. The extra cost buys numerical robustness, not a different convergence rate.

### Practical comparison

| Form | Cost per sample | Numerical behavior |
|---|---|---|
| Standard RLS | $O(N^2)$ | fast, can lose symmetry |
| LDU RLS | $O(N^2)$ | stable, easy sign check |
| Square-root RLS | $O(N^2)$, 2–3x | very stable, rotation based |
| Fast RLS | $O(N)$ | fastest, most fragile |
| Lattice RLS | $O(N)$ | stable, stage-wise |

---

## Fast RLS (Proakis 13.3.3)

The data vector at time $n$ and time $n-1$ share $N-1$ entries: only one sample is new. **Fast RLS** exploits that shift structure.

The algorithm carries, in addition to the weight vector, a set of forward and backward prediction errors and a gain vector. The gain update uses those errors instead of the full $N\times N$ matrix, reducing the cost to $O(N)$ per sample. The best-known members of the family are the fast transversal filter (FTF) and the fast Kalman algorithm.

The price is numerical fragility. Fast RLS has modes that can drift even when the theoretical algorithm is stable, because the recursion subtracts nearly equal quantities. Practical fixes are:

- periodic reinitialization of the covariance,
- leakage or soft constraint on the gain vector,
- a numerically stabilized fast RLS that propagates error energies carefully.

For most teaching and lab work, standard RLS or lattice RLS is the safer choice; fast RLS matters when $N$ is large and the sample rate is high.

---

## Unconstrained Least-Squares AR Estimation (Proakis 14.3.4)

Yule-Walker fits the model to the **autocorrelation** sequence and implicitly applies a window. Least squares fits the model directly to the **data**.

### Forward least squares

For an AR($p$) model, minimize

$$E=\sum_{n=p}^{N-1}\left(x[n]+\sum_{k=1}^{p}a_k x[n-k]\right)^2$$

In matrix form, with $\mathbf{x}_n=[x[n-1],\dots,x[n-p]]^T$,

$$\mathbf{X}\mathbf{a}=-\mathbf{y}$$

where row $n$ of $\mathbf{X}$ is $\mathbf{x}_n^T$ and $y_n=x[n]$. The normal equations are

$$(\mathbf{X}^{T}\mathbf{X})\mathbf{a}=-\mathbf{X}^{T}\mathbf{y}$$

This is the **covariance method**. Using both forward and backward prediction errors gives the **modified covariance method**, which behaves better for short records because it uses each interior sample twice.

### Worked example: order 1

For $x=\{1,2,4,8\}$ and the model $x[n]=-a x[n-1]$,

$$a=-\frac{\sum_{n=1}^{3}x[n]x[n-1]}{\sum_{n=1}^{3}x[n-1]^2}=-\frac{2+8+32}{1+4+16}=-2$$

The fit is exact for $x[n]=2x[n-1]$. It is also **unstable**: the pole is at $z=2$, outside the unit circle. Least squares is allowed to return an unstable model because it only minimizes the residual; it does not enforce stability.

### Least squares versus Yule-Walker and Burg

| Method | Data used | Stability guaranteed |
|---|---|---|
| Yule-Walker | biased autocorrelation | yes, all poles inside |
| Burg | forward and backward errors, order recursion | yes |
| Covariance LS | forward error only | no |
| Modified covariance LS | forward and backward errors | no |

If stability matters, either use Yule-Walker or Burg, or check the roots of $A(z)$ and reflect any root outside the unit circle back inside.

---

## Sequential Estimation (Proakis 14.3.5)

Sequential estimation is RLS applied to the AR regressor. Define

$$\boldsymbol{\theta}=[a_1,a_2,\dots,a_p]^{T},\qquad \boldsymbol{\varphi}[n]=[x[n-1],x[n-2],\dots,x[n-p]]^{T}$$

The model is $x[n]=\boldsymbol{\varphi}^{T}[n]\boldsymbol{\theta}+e[n]$, so the RLS update is

$$\mathbf{k}[n]=\frac{\lambda^{-1}\mathbf{P}[n-1]\boldsymbol{\varphi}[n]}{1+\lambda^{-1}\boldsymbol{\varphi}^{T}[n]\mathbf{P}[n-1]\boldsymbol{\varphi}[n]}$$

$$\hat{\boldsymbol{\theta}}[n]=\hat{\boldsymbol{\theta}}[n-1]+\mathbf{k}[n]\left(x[n]-\boldsymbol{\varphi}^{T}[n]\hat{\boldsymbol{\theta}}[n-1]\right)$$

$$\mathbf{P}[n]=\lambda^{-1}\left(\mathbf{P}[n-1]-\mathbf{k}[n]\boldsymbol{\varphi}^{T}[n]\mathbf{P}[n-1]\right)$$

With $\lambda=1$ this is growing-memory least squares; with $\lambda<1$ it tracks slow changes in the signal. The residual $x[n]-\boldsymbol{\varphi}^{T}\hat{\boldsymbol{\theta}}$ is the **innovation** from the previous post, which is why the two topics link naturally.

### Why sequential matters

- It avoids recomputing the normal equations for every new block.
- It gives an online spectrum estimate: update $\hat{\boldsymbol{\theta}}$, then evaluate the AR spectrum.
- It handles non-stationary signals through $\lambda$.
- It is the same recursion used in adaptive line enhancement and adaptive AR spectrum estimation.

The cost is $O(p^2)$ per sample, so for large $p$ the lattice or fast forms are preferable.

---

## Summary

| Topic | Main result |
|---|---|
| LDU RLS | factor $\mathbf{P}=\mathbf{L}\mathbf{D}\mathbf{L}^{T}$, update factors |
| Square-root RLS | keep $\mathbf{P}=\mathbf{S}\mathbf{S}^{T}$, positive definite by construction |
| Fast RLS | $O(N)$ using shift structure, numerically fragile |
| Covariance LS | fit the data directly, may be unstable |
| Modified covariance | forward plus backward errors, better short-record behavior |
| Sequential AR | RLS on $[x[n-1],\dots,x[n-p]]$ |

Previous: [Innovations, the Schur Algorithm, and ARMA Lattice-Ladder Filters](/posts/innovations-schur-and-arma-lattice-ladder/). Next: [PCM Coding, DFT Quantization Errors, and Unit-Circle Spectra](/posts/pcm-coding-dft-quantization-and-unit-circle-spectra/).
