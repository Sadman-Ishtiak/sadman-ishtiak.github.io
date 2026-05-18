---
title: Compiled DSP Questions for CSE-409
date: 2026-03-17 00:00:00 +0600
categories: [Academic, CSE-409 Digital Signal Processing]
tags: [dsp, questions, exam-prep, cse-409, lab]
description: "Compiled Digital Signal Processing (DSP) exam and lab questions for CSE-409 and CSE-410."
math: true
---

# Questions 
1. Define and classify signals with examples.
2. Explain continuous-time vs. discrete-time signals with a diagram.
3. Sketch $x(t) = \sin(\pi t)$ for $-5 \le t \le 5$.
4. Describe three major applications of DSP in the real world.
5. How is DSP used in speech recognition?
6. How does DSP contribute to medical image enhancement?
7. Why are digital filters preferred over analog in communication?
8. For $x_a(t) = 3 \sin 300\pi t$:
	1. Find the minimum sampling rate.
	2. Find the discrete signal if $F_s = 250 \text{ Hz}$.
9. Define symmetric and anti-symmetric signals.
10. Illustrate aliasing in the frequency domain caused by undersampling.
11. Define quantization and its significance.
12. Derive the formula for quantization error in a uniform quantizer.
13. Calculate step size ($\Delta$) and quantized value of 3.8V for a 16-level quantizer ranging from -10V to 10V.
14. Define time-scaling and its effects.
15. Illustrate signal shifting (left/right) with diagrams.
16. For $x[n] = \{2, 1, \mathbf{0}, -1, -2\}$, plot $x[2n]$ and $x[n/2]$.
17. Difference between DFT and DTFT.
18. Compute 4-point DFT of $\{0, 1, 2, 3\}$.
19. Advantages of FFT over DFT.
20. Calculate mean and median for $\{1, 3, 5, 7, 9\}$.
21. Derive variance/standard deviation formulas and calculate for $\{2, 4, 6, 8\}$.
22. Interpret skewness and kurtosis for $\{1, 2, 3, 4, 9\}$.
23. Differentiate analog and digital filters.
24. Explain the method of design of IIR filters using bilinear transform method.
25. Distinguish between FIR and IIR filters.
26. Explain the term "signal" in a way that satisfies a teacher.
27. Is a digital photo of Einstein a signal? Explain.
28. Share your understanding of "digital signal."
29. Is biometrics an application of DSP? List other applications.
30. Write properties of auto-correlation and cross-correlation.
31. Determine system responses (Identity, Delay, Advance, Moving Average) for $x(n) = |n|$ for $-3 \le n \le 3$.
32. Find the response of an LTI system with $h[n] = \{1, 2, 1, -1\}$ to input $x[n] = \{1, 2, 3, 1\}$.
33. What is a discrete-time system?
34. Sketch the block diagram for $y(n) = 0.25y(n-1) + 0.5x(n) + 0.5x(n-1)$.
35. Compare: Static vs. Dynamic, Time-invariant vs. Time-variant, and Linear vs. Nonlinear systems.
36. Define quantization error.
37. Explain the role of the number of bits ($B$) in a quantizer.
38. How do you convert an analog signal to digital?
39. List applications of Z-transform and define ROC.
40. Find Z-transform and ROC for $\{1, 0, \mathbf{3}, -1, 2\}$.
41. Calculate inverse Z-transform for $X(z) = \frac{z+0.2}{(z+0.5)(z-1)}$ for $|z|>1$.
42. Explain the FFT speed increase factor of 21.33.
43. How does the Decimation-in-Time (DIT) FFT algorithm work?
44. Find DFT of $\{1, 1, 0, 0\}$ and IDFT of $\{1, 0, 1, 0\}$.
45. Explain delay and advance in the time axis; find $x(2n)$ and $x(n/2)$.
46. What role does variance play in signal study?
47. Define and calculate skewness and kurtosis.
48. Define impulse.
49. Advantages of FIR over IIR filters.
50. Determine Direct Form I structure for the same IIR equation as 2022.
51. What is a signal? How is a continuous-time signal converted to digital?
52. Explain a DSP system using a block diagram.
53. State the sampling theorem and define the Nyquist rate.
54. Show graphical representations for $\delta[n]$ and $\mu[n]$.
55. Compare continuous-time and discrete-time signals.
56. Sketch a signal that has a 6 Hz sinusoid from 0-2s and a 4 Hz sinusoid from 2-4s. Is it stationary?
57. Describe the procedures to transform a continuous signal to digital.
58. Define aliasing and how to avoid it.
59. For $x_a(t) = 3 \cos 2000\pi t + 5 \sin 6000\pi t + 10 \cos 12000\pi t$:
	1. Find the Nyquist rate.
	2. Find the discrete signal if $F_s = 5000 \text{ samples/s}$.
60. Define Skewness and Kurtosis.
61. Explain why quantization is considered the "opposite" of sampling.
62. Define time shifting and find $x(n-3)$ and $x(n+2)$ for a given graph.
63. Mention differences between Z-transform and Fourier transform.
64. Find Z-transform and ROC of $x[n] = a^n u[n]$.
65. Find the inverse Z-transform of $X(z) = \frac{z+0.2}{(z+0.5)(z-1)}$ for $|z|>1$.
66. What is FFT?
67. Find the Fourier transform of $x(t) = e^{-a|t|}, a>0$.
68. Find the DFT of $\{1, 1, 0, 0\}$ and IDFT of $\{1, 0, 1, 0\}$.
69. Explain the speed increase factor (21.33) provided by FFT.
70. Write the radix-2 DIT-FFT algorithm.
71. Determine the 8-point DFT of $\{1, 1, 1, 1, 1, 1, 0, 0\}$.
72. Define an impulse signal.
73. Compare FIR and IIR filters.
74. Determine the Direct Form I structure for the IIR filter: $y(n) = 0.5y(n-1) - 0.76y(n-2) + 0.63y(n-3) + x(n) + 0.875x(n-1)$.
75. What is signal processing? Write down the differences between analog and digital signals.
76. Imagine you have an analog signal; how do you convert it to a digital signal? Explain. Which step introduces error in an analog-to-digital converter? Why and how can you minimize this problem?
77. Briefly discuss applications of digital signal processing.
78. Explain different types of discrete-time signal representations.
79. What do you mean by data acquisition? Draw the block diagram of a data acquisition system.
80. Graphically represent the signal $x(n)$: $x(n) = 0$ for $n < 0$ and $x(n) = 1$ for $n \ge 0$.
81. Why do we need sampling of a continuous-time signal? Explain the sampling theorem.
82. What is aliasing? How do you avoid it?
83. Consider the signal $x_a(t) = 3 \cos 50\pi t + 10 \sin 300\pi t - \cos 100\pi t$.
	1. Determine the minimum sampling rate required to avoid aliasing.
	2. If sampled at $F_s = 200 \text{ Hz}$, what is the obtained discrete-time signal?
	3. If sampled at $F_s = 75 \text{ Hz}$, what is the obtained discrete-time signal?
84. What do you mean by standard deviation and variance?
85. Explain the Discrete Fourier Transform (DFT).
86. Find the DFT of $x(n) = \{1, 1, 1, 0\}$ for $N=4$.
87. Briefly discuss the relation between the Fourier transformation and Z-transformation.
88. What is the Region of Convergence (ROC)? State its properties.
89. Explain the convolution property of Z-transformation.
90. Why is it necessary to transform a time-domain signal to the frequency domain?
91. Find $X(k)$ for $x(n) = 1/4$ for $0 \le n \le 2$ (and $0$ otherwise).
92. Determine the Z-transform of $x(n) = \{1, 0, \mathbf{3}, -1, 2\}$.
93. Define continuous-time sinusoidal signals.
94. Differentiate between deterministic and random signals.
95. Explain Nyquist theorem and determine the minimum sampling rate for $x(a) = 3 \cos 400\pi t$.
96. Define energy and power signals.
97. Write the advantages of FIR filters over IIR filters.
98. Write the steps to design analog Butterworth filters.
99. What is the principle of designing FIR filters using windows?

### DSP Lab (CSE 410) - Compiled Questions
1. Write a MATLAB program to generate the following elementary signals:
	1. Cosine wave
	2. Unit impulse
	3. Square wave
	4. Sine wave
 Plot the signals in a figure using the `subplot` function.
2. Write a MATLAB program to illustrate:
	1. The effect of up-sampling in the frequency domain.
	2. The effect of the Interpolation process.
3. Write a MATLAB program to find the FFT of a given sequence.
4. Write a MATLAB program to obtain:
	1. N-point DFT of a sequence
	2. N-point IDFT of a sequence.
5. Write the formula for calculating covariance of sample data. Consider two sets of samples. Compute covariance by using the formula then compare the result with the one obtained by MATLAB command.
6. If $q = [1, 5, 6, 8, 3, 2, 4, 5, 9, 10]$ and $x = [3, 5, 7, 8, 3, 1, 2, 4, 11, 5, 9]$, then:
	1. find elements of (q) that are greater than 4.
	2. find elements of (q) that are equal to those in (x).
	3. find elements of (x) that are less than or equal to 7.
7. Using MATLAB find the FFT of a given sequence.
8. Generate a $4 \times 4$ Identity matrix.
9. If $x = [2, 6, 12, 15, 6, 3, 10, 11]$, then:
	1. replace the first row elements of matrix x with its average value.
	2. reshape this matrix into a row vector.
