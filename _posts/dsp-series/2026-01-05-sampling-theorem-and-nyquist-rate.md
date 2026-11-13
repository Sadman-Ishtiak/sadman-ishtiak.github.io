---
title: "Sampling Theorem and Nyquist Rate"
date: 2026-01-05 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'sampling', 'aliasing', 'nyquist', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## The Fundamental Problem'
math: true
---
## The Fundamental Problem

Natural signals—speech, EEG, radar returns, seismic waves—are **continuous-time**. Computers can only process **discrete-time** sequences. The bridge between these worlds is **sampling**.

---

## Why Sampling Is Necessary

A continuous-time signal $x_a(t)$ contains an infinite continuum of values—impossible for digital systems to store or process. Sampling captures values at uniform intervals $T$ (the sampling period), producing a discrete sequence:

$$x[n] = x_a(nT) \quad \text{for } n = 0, \pm 1, \pm 2, \dots$$

The sampling frequency $F_s = 1/T$ (Hz) determines how many samples per second we take.

---

## The Sampling Theorem (Nyquist–Shannon)

> **If a continuous-time signal $x_a(t)$ contains no frequency components above $F_{\text{max}}$ Hz, it can be perfectly reconstructed from its samples provided the sampling frequency satisfies:**
>
> $$F_s \ge 2 F_{\text{max}}$$

The minimum rate $F_s = 2 F_{\text{max}}$ is the **Nyquist rate**. The corresponding frequency $F_s/2$ is the **Nyquist frequency**.

---