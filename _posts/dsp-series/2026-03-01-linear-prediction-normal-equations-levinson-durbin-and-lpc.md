---
title: "Linear Prediction: Forward, Backward, Normal Equations, and Levinson-Durbin"
date: 2026-03-01 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'linear-prediction', 'lpc', 'adaptive-filters', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Predicting the next sample from past ones, deriving the normal equations, solving them in O(p²) with Levinson-Durbin, and the lattice and AR/ARMA models.
math: true
---
## The Prediction Problem

Given samples $x[n-1],x[n-2],\dots,x[n-p]$, predict $x[n]$. A **linear predictor** of order $p$ uses a weighted sum:

$$\hat x[n]=-\sum_{k=1}^{p}a_k\,x[n-k]$$

The minus sign is a convention that makes the prediction error take the clean form below.

### The Prediction Error

$$e[n]=x[n]-\hat x[n]=x[n]+\sum_{k=1}^{p}a_k x[n-k]$$

This is exactly the output of an **FIR error filter** $A(z)$ driven by $x[n]$:

$$A(z)=1+\sum_{k=1}^{p}a_k z^{-k}$$

$$E(z)=A(z)X(z)$$

Everything else follows from choosing the coefficients $\{a_k\}$ to minimize the error power.

---

## The Normal Equations

Minimize the mean-square error

$$J=E\left\{e^2[n]\right\}=E\left\{\left(x[n]+\sum_{k=1}^{p}a_kx[n-k]\right)^2\right\}$$

Set the derivative with respect to each $a_i$ to zero:

$$\frac{\partial J}{\partial a_i}=2E\left\{x[n-i]\left(x[n]+\sum_{k=1}^{p}a_kx[n-k]\right)\right\}=0$$

$$E\{x[n]x[n-i]\}+\sum_{k=1}^{p}a_kE\{x[n-i]x[n-k]\}=0$$

Define the autocorrelation

$$r[i]=E\{x[n]x[n-i]\}$$

Then

$$r[i]+\sum_{k=1}^{p}a_k\,r[i-k]=0,\qquad i=1,\dots,p$$

These are the **normal equations** (Yule–Walker equations). In matrix form:

$$\begin{bmatrix}r[0]&r[1]&\dots&r[p-1]\\r[1]&r[0]&\dots&r[p-2]\\\vdots&&\ddots&\vdots\\r[p-1]&r[p-2]&\dots&r[0]\end{bmatrix}\begin{bmatrix}a_1\\a_2\\\vdots\\a_p\end{bmatrix}=-\begin{bmatrix}r[1]\\r[2]\\\vdots\\r[p]\end{bmatrix}$$

The matrix $\mathbf{R}$ is **Toeplitz** (constant along diagonals) and **symmetric**. That structure is what makes the fast solution possible.

The minimum error power is

$$J_{\min}=r[0]+\sum_{k=1}^{p}a_k r[k]$$

---

## Backward Prediction

Predict $x[n-p-1]$ from the $p$ samples that follow it:

$$\hat x[n-p-1]=-\sum_{k=1}^{p}c_k\,x[n-k]$$

For a stationary process the backward predictor has the **same coefficients** as the forward one, reversed in time:

$$c_k=a_{p+1-k}$$

This symmetry is not obvious but falls out of the Toeplitz structure. It is what the lattice filter exploits: forward and backward errors are updated together, and the reflection coefficient is the same in both directions.

### Forward and Backward Errors

Forward: $e_f[n]=x[n]+\sum_{k=1}^{p}a_kx[n-k]$

Backward: $e_b[n]=x[n-p]+\sum_{k=1}^{p}a_kx[n-p+k]$

Both have the same minimum mean-square value $J_{\min}$.

---

## The Levinson-Durbin Recursion

Solving the $p\times p$ Toeplitz system directly costs $O(p^3)$. Levinson-Durbin does it in $O(p^2)$ by building up the order one at a time.

**Initialize:**

$$a_1^{(1)}=-\frac{r[1]}{r[0]},\qquad J_1=r[0]+a_1^{(1)}r[1]=r[0]\left(1-\frac{r^2[1]}{r^2[0]}\right)$$

**For $m=2,3,\dots,p$:**

$$k_m=-\frac{r[m]+\sum_{i=1}^{m-1}a_i^{(m-1)}r[m-i]}{J_{m-1}}$$

$$a_m^{(m)}=k_m$$

$$a_i^{(m)}=a_i^{(m-1)}+k_m\,a_{m-i}^{(m-1)},\qquad i=1,\dots,m-1$$

$$J_m=J_{m-1}\left(1-k_m^2\right)$$

The quantity $k_m$ is the **reflection coefficient** (also called the partial correlation or PARCOR coefficient).

### Why It Is Stable

For a valid autocorrelation sequence, $\vert k_m\vert<1$ for all $m$. Conversely, any set of coefficients with $\vert k_m\vert<1$ produces a stable all-pole filter. This gives a **built-in stability guarantee** that direct coefficient quantization does not have.

### Worked Example: Order 2

Given $r[0]=1$, $r[1]=0.5$, $r[2]=0.25$.

**Order 1:**

$$a_1^{(1)}=-\frac{0.5}{1}=-0.5$$
$$J_1=1(1-0.25)=0.75$$

**Order 2:**

$$k_2=-\frac{r[2]+a_1^{(1)}r[1]}{J_1}=-\frac{0.25+(-0.5)(0.5)}{0.75}=-\frac{0}{0.75}=0$$

Since the autocorrelation is already geometric with ratio $0.5$, the order-1 model is exact and the order-2 correction is zero. That is a useful sanity check: a purely exponential autocorrelation is a first-order AR process.

---

## The Lattice Structure

The Levinson recursion maps directly onto a **lattice filter**:

```
        e_f^{(m-1)}[n] ──●──────────────► e_f^{(m)}[n]
                          │
                    k_m   │
                          │
        e_b^{(m-1)}[n-1] ●──────────────► e_b^{(m)}[n]
```

The stage equations are

$$e_f^{(m)}[n]=e_f^{(m-1)}[n]+k_m\,e_b^{(m-1)}[n-1]$$

$$e_b^{(m)}[n]=e_b^{(m-1)}[n-1]+k_m\,e_f^{(m-1)}[n]$$

### Lattice Properties

| Property | Benefit |
|---|---|
| Coefficients are reflection coefficients | $\vert k_m\vert<1$ guarantees stability |
| Modular stages | Add or remove an order without redesigning |
| Low coefficient sensitivity | Quantization of $k_m$ degrades gracefully |
| Both forward and backward errors | Used in adaptive lattice (RLS lattice, gradient lattice) |
| Orthogonalizing | Successive stages decorrelate the signal |

The lattice is the preferred structure when coefficients must be quantized or adapted, because stability is structural rather than numerical.

---

## AR, MA, and ARMA Models

The prediction error filter $A(z)$ defines the model of the signal.

| Model | Equation | Spectrum shape | All-pole? |
|---|---|---|---|
| **AR(p)** | $x[n]=-\sum_{k=1}^{p}a_kx[n-k]+w[n]$ | Peaks (resonances) | Yes |
| **MA(q)** | $x[n]=\sum_{k=0}^{q}b_kw[n-k]$ | Smooth, no sharp peaks | No (all zeros) |
| **ARMA(p,q)** | $x[n]=-\sum a_kx[n-k]+\sum b_kw[n-k]$ | Peaks and notches | Poles + zeros |

Here $w[n]$ is white noise of variance $\sigma_w^2$.

### AR Model

$$\frac{X(z)}{W(z)}=\frac{1}{A(z)}=\frac{1}{1+\sum_{k=1}^{p}a_kz^{-k}}$$

$$S_{xx}(e^{j\omega})=\frac{\sigma_w^2}{\vert A(e^{j\omega})\vert^2}$$

The denominator creates **poles**, so the AR spectrum has sharp peaks at the pole angles. This is why AR is excellent for **spectral estimation of narrowband signals** — a small number of poles captures sharp resonances that would need a huge FFT to resolve.

### MA Model

$$S_{xx}(e^{j\omega})=\sigma_w^2\vert B(e^{j\omega})\vert^2$$

Zeros only, so the spectrum is smooth. An MA model is a **moving average**, which is why it cannot represent a sharp resonance without a very high order.

### ARMA Model

$$S_{xx}(e^{j\omega})=\sigma_w^2\frac{\vert B(e^{j\omega})\vert^2}{\vert A(e^{j\omega})\vert^2}$$

Both peaks and notches, with fewer parameters than a pure AR or MA of equivalent fit. The price is that parameter estimation is nonlinear (or requires a two-step approach).

---

## Linear Predictive Coding (LPC)

LPC is linear prediction applied to **speech**.

### The Source–Filter Model

Speech is modelled as

$$s[n]=h[n]*e[n]$$

where $e[n]$ is the excitation (pitch pulses or noise) and $h[n]$ is the vocal tract, modelled as an all-pole filter of order $p$.

The predictor coefficients $a_k$ describe the **vocal tract**, and the prediction residual $e[n]$ is the **excitation**.

### Why It Compresses

- The vocal tract changes slowly, so $a_k$ can be sent at a low rate (e.g. every 20 ms).
- The residual has much lower energy than the speech and can be quantized coarsely or replaced by a pitch/voicing decision.
- Order $p=8$–$12$ is enough for 8 kHz speech; $p=16$–$20$ for wideband.

### LPC Encoder Chain

```
Speech → Pre-emphasis → Frame (20 ms) → Window (Hamming)
       → Autocorrelation → Levinson-Durbin → {a_k}, gain
       → Residual → Pitch/voicing → Quantize → Bitstream
```

**Decoder:** inverse filter $1/A(z)$ driven by the quantized residual. The synthesis filter is an all-pole IIR, which is stable because the Levinson reflection coefficients satisfy $\vert k_m\vert<1$.

### Pre-emphasis

Speech has a −6 dB/octave spectral tilt from the glottal source. A first-order highpass

$$H_{pre}(z)=1-0.95z^{-1}$$

flattens the spectrum so the predictor spends its poles on the formants rather than the tilt. The decoder applies the inverse de-emphasis $1/(1-0.95z^{-1})$.

### Bandwidth Expansion

Multiplying the reflection coefficients by a factor $\gamma<1$ moves the poles radially inward, broadening the formants and increasing stability margin. Standard practice in LPC vocoders.

---

## Practical Notes

| Issue | Recommendation |
|---|---|
| Frame length | 20–30 ms: long enough for stable statistics, short enough for stationarity |
| Window | Hamming or Hann, to avoid edge discontinuities |
| Order selection | AR: AIC or MDL; speech: 2 + Fs/1000 |
| Autocorrelation | Compute via FFT of zero-padded frame, or directly with a biased estimator |
| Stability | Always check $\vert k_m\vert<1$; use lattice or bandwidth expansion |
| Levinson failure | If $J_m\le0$, the autocorrelation is not valid (numerical error); regularize $r[0]$ |

### Order Selection Criteria

**Akaike information criterion (AIC):**

$$\text{AIC}(p)=N\ln J_p+2p$$

**Minimum description length (MDL):**

$$\text{MDL}(p)=N\ln J_p+p\ln N$$

Choose the $p$ that minimizes the criterion. Both penalize extra parameters; MDL penalizes more strongly for large $N$.

---

## Summary

1. A linear predictor estimates $x[n]$ from $p$ past samples; the error filter is $A(z)=1+\sum a_kz^{-k}$.
2. Minimizing the error power gives the Toeplitz normal (Yule–Walker) equations $\mathbf{R}\mathbf{a}=-\mathbf{r}$.
3. Levinson-Durbin solves them in $O(p^2)$ and yields reflection coefficients with $\vert k_m\vert<1$, guaranteeing stability.
4. The lattice structure is the numerically robust realization for quantization and adaptation.
5. AR models give sharp spectral peaks with few parameters; MA is smooth; ARMA has both.
6. LPC compresses speech by sending the slowly varying vocal-tract coefficients plus a low-rate excitation.
