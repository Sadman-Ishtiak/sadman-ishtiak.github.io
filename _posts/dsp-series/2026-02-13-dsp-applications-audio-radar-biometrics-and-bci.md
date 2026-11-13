---
title: "DSP Applications: Audio, Radar, Biometrics, and BCI"
date: 2026-02-13 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'applications', 'fundamentals', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Where DSP is actually used, from speech recognition to brain-computer interfaces.
math: true
---
## Why Signals Are Processed

Signals carry both **useful information** and **unwanted noise**. Signal processing exists to extract, enhance, store, and transmit the useful part. There are two ways to do it:

| Approach | How | Examples |
|---|---|---|
| **Analog signal processing** | Continuous circuits: resistors, capacitors, op-amps | Passive filters, analog radio |
| **Digital signal processing** | Sample, quantize, then compute | Everything modern |

DSP is preferred because a program can be changed without touching hardware, and because digital arithmetic has no component tolerance drift.

---

## The Five Core Application Areas (CSE 409)

### 1. Audio Processing and Speech Recognition

Speech recognition is a two-stage DSP pipeline:

```
Microphone → Pre-emphasis → Framing/Window → Feature Extraction → Feature Matching → Text
             (boost highs)   (20-30 ms)       (MFCC, LPC, mel)     (HMM/DNN)
```

- **Feature extraction** turns each short frame into a compact vector (MFCCs are the classic choice).
- **Feature matching** compares that vector sequence against acoustic models.

Other audio jobs: noise suppression, echo cancellation, equalization, compression (MP3/AAC), pitch shifting.

### 2. Echo Location (Radar and Sonar)

A wave is bounced off a remote object; the echo reveals **distance** (delay), **speed** (Doppler shift), and **size/shape** (amplitude and signature).

- **Radar**: electromagnetic pulses.
- **Sonar**: acoustic pulses underwater.
- **Ultrasound**: the same idea at MHz frequencies inside the body.

DSP performs matched filtering (pulse compression), clutter rejection, beamforming, and data compression of the returns.

### 3. Pattern Recognition

> "The act of taking in raw data and taking an action based on the category of the data."

Pattern recognition classifies data using **a priori knowledge** or **statistical information extracted from patterns**. DSP supplies the feature vector; the classifier supplies the decision.

Examples: handwritten digit recognition, ECG arrhythmia detection, fault diagnosis from vibration, image classification.

### 4. Biometrics

Biometrics identifies a person from intrinsic **physical or behavioural traits**: face, voice, fingerprint, iris, handwriting, gait.

Each trait is a signal:

| Trait | Signal | DSP stage |
|---|---|---|
| Face | 2-D image | Enhancement, segmentation, feature extraction |
| Voice | 1-D waveform | MFCC, speaker modelling |
| Fingerprint | 2-D ridge image | Gabor filtering, minutiae extraction |
| Gait | Accelerometer time series | Periodicity and spectral features |

> **Exam answer:** Yes, biometrics is a DSP application. Every biometric system measures a physical quantity, conditions it, extracts features, and matches it.

### 5. Brain-Computer Interface (BCI)

A BCI provides communication between a brain and a computer from measurements of brain activity (EEG, ECoG, implanted arrays) with **no muscle motion** involved.

DSP chain: artifact removal → band-power extraction (alpha/beta/gamma) → spatial filtering (CSP) → classifier → control command.

---

## Beyond the Lecture List

| Domain | DSP task |
|---|---|
| **Medical imaging** | CT/MRI reconstruction, denoising, edge enhancement |
| **Communications** | Modulation, equalization, channel coding, OFDM |
| **Consumer electronics** | Noise-cancelling headphones, image stabilization, voice assistants |
| **Seismology** | Deconvolution, velocity analysis, event detection |
| **Finance** | Trend/seasonality extraction, volatility filtering |
| **Industrial control** | Sensor conditioning, vibration monitoring |

---

## Applications Mapped to Course Topics

| Application | Topics used |
|---|---|
| Speech recognition | Sampling, framing, windowing, FFT, cepstrum, LPC |
| Radar | Correlation, matched filtering, FFT, Doppler spectral analysis |
| Noise cancellation | Adaptive filters (LMS/RLS), Wiener filtering |
| Audio compression | Filter banks, QMF, psychoacoustic models |
| Image processing | 2-D DFT/DCT, 2-D filtering, wavelets |
| BCI | Bandpass filtering, spatial filtering, spectral estimation |

---

## Key Takeaways

1. DSP is not one algorithm; it is a **pipeline** of sampling → conditioning → transformation → decision.
2. The same four tools — **convolution, transforms, filters, statistics** — appear in every application.
3. Applications are the reason the theory exists: pick the tool that matches the signal's structure.
