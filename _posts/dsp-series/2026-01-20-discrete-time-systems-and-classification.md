---
title: Discrete-Time Systems and Classification
date: 2026-01-20 00:00:00 +0600
categories:
- Academic
- Digital Signal Processing
tags:
- dsp
- lti-systems
- convolution
- academic
- cse409
- cse410
- jkkniu
description: A **discrete-time system** transforms an input sequence $x[n]$ into an
  output sequence
$y[n]$: ''
math: true
---
## What Is a Discrete-Time System?

A **discrete-time system** transforms an input sequence $x[n]$ into an output sequence $y[n]$:

$$y[n] = \mathcal{T}\{x[n]\}$$

The system is an **operator** or **mapping** from input space to output space. Examples:
- $y[n] = 2x[n]$ (scaling)
- $y[n] = x[n-1]$ (delay)
- $y[n] = \frac{1}{M}\sum_{k=0}^{M-1} x[n-k]$ (moving average)

---

## System Classification: The Five Critical Properties

Every system can be classified by these five independent properties. **LTI systems** (Linear + Time-Invariant) are the "sweet spot"—powerful theory, realizable, and ubiquitous.

| Property | Test | Pass = |
|---|---|---|
| **Static (Memoryless) vs Dynamic** | Output depends only on current input? | Static |
| **Time-Invariant vs Time-Variant** | Delayed input → delayed output? | TI |
| **Linear vs Nonlinear** | Superposition holds? | Linear |
| **Causal vs Non-Causal** | Output depends only on present/past? | Causal |
| **BIBO Stable vs Unstable** | Bounded input → bounded output? | Stable |

---

## 1. Static vs Dynamic (Memory)

**Static (Memoryless):** $y[n] = f(x[n])$ — output at $n$ depends only on input at $n$.

**Dynamic (With Memory):** $y[n]$ depends on past/future inputs $x[n-k]$.

| System | Classification | Reason |
|---|---|---|
| $y[n] = x^2[n]$ | Static | Only $x[n]$ |
| $y[n] = x[n] + 2x[n-1] + x[n-2]$ | Dynamic | Uses $x[n-1], x[n-2]$ |
| $y[n] = e^{x[n]}$ | Static | Only $x[n]$ |

---