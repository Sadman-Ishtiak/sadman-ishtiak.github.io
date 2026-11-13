---
title: "Signal Operations: Amplitude Domain"
date: 2026-01-13 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'time-domain', 'signal-operations', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## Why Time-Domain Operations Matter'
math: true
---
## Why Time-Domain Operations Matter

Before we transform signals to frequency domains or filter them, we manipulate them in the time domain. These operations are the **building blocks of all DSP systems**—delay lines, filters, interpolators, decimators, and more.

Every discrete-time signal operation falls into two categories:
- **Amplitude (y-axis) operations**: Addition, subtraction, multiplication, scaling
- **Time (x-axis) operations**: Shifting, scaling, reversal (folding)

---

## Amplitude Operations (Vertical Axis)

Given two sequences $x_1[n]$ and $x_2[n]$:

| Operation | Formula | Block Diagram |
|---|---|---|
| **Addition** | $y[n] = x_1[n] + x_2[n]$ | Summer |
| **Subtraction** | $y[n] = x_1[n] - x_2[n]$ | Subtractor |
| **Multiplication** | $y[n] = x_1[n] \cdot x_2[n]$ | Modulator |
| **Amplitude Scaling** | $y[n] = \alpha x[n]$ | Gain block |

**Applications:**
- Addition: Mixing audio signals, combining sensor readings
- Multiplication: Amplitude modulation (AM), gating/windowing
- Scaling: Volume control, normalization

---