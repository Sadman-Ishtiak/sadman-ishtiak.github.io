---
title: "Subband Coding, Filter Banks, and Narrowband Design"
date: 2026-02-09 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'multirate', 'decimation', 'interpolation', 'polyphase', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## Applications of Multirate DSP (Proakis 11.9)'
math: true
---
## Applications of Multirate DSP (Proakis 11.9)

### 1. Subband Coding (Speech/Audio Compression)
```
Input ──► Analysis Filter Bank ──► Quantize/Encode ──► Bitstream
         (Split into subbands)    (Allocate bits per subband)
```
- Used in: MP3, AAC, Dolby AC-3
- Perceptual coding: More bits to important subbands

### 2. Quadrature Mirror Filters (QMF) / Perfect Reconstruction
Two-channel filter bank:
```
         H_0(z) (LP)          G_0(z)
x[n] ──►───────►───►[↓2]──►───►───────►
         H_1(z) (HP)          G_1(z)
          └───────►───►[↓2]──►───────►
                └────────► Sum ◄─────┘
```
**Perfect reconstruction** if $G_0(z)H_0(z) + G_1(z)H_1(z) = 2z^{-k}$

### 3. Digital Filter Banks (Channelization)
- Split wideband signal into narrow subbands
- Process each independently (beamforming, spectrum monitoring)
- Efficient via polyphase FFT filter banks

### 4. Interfacing Systems with Different Rates
- CD (44.1k) → DAT (48k)
- ADC at high rate → process at low rate → DAC at high rate
- Oversampling ADCs/DACs

### 5. Narrowband Lowpass Filter Implementation
Very narrow transition width → high-order filter
**Multirate approach:**
1. Decimate by $M$ (reduce rate)
2. Design wider filter at lower rate
3. Interpolate back

$M$-fold reduction in filter order!

---

## Design Example: Narrowband Lowpass via Multirate

**Specs:** $F_s = 48$ kHz, passband 0–100 Hz, stopband > 200 Hz, $A_s = 80$ dB
**Direct FIR:** $\Delta f = 100$ Hz → $N \approx 4 \cdot 48000/100 = 1920$ taps!

**Multirate ($M=100$):**
1. Decimate by 100 → $F_s' = 480$ Hz
2. New specs: passband 0–100 Hz, stopband > 200 Hz at $F_s' = 480$ Hz
   - $\omega_p = 100/240 \pi = 0.417\pi$
   - $\omega_s = 200/240 \pi = 0.833\pi$
3. Design filter at low rate → $N' \approx 20$ taps
3. Interpolate by 100
**Total work:** ~100× fewer multiplies!

---

## MATLAB Implementation

```matlab
% Decimation
M = 4;
x = randn(1, 1000);
h = fir1(50, 1/M);        % Anti-aliasing filter
y = decimate(x, M);        % Built-in (filters + downsamples)

% Manual polyphase decimation
h_poly = reshape(h, M, []).';  % M branches
y_poly = zeros(1, length(x)/M);
for k = 1:M
    y_poly = y_poly + filter(h_poly(k,:), 1, x(k:M:end));
end

% Interpolation
L = 3;
y_interp = interp(x, L);    % Built-in (upsamples + filters)

% Rational rate conversion
L = 160; M = 147;
y_resamp = resample(x, L, M);  % Single function!

% Polyphase filter bank (analysis)
M = 32;  % 32 channels
h_proto = fir1(256, 1/M);       % Prototype LPF
% Modulate to create filter bank
for k = 0:M-1
    H_bank(:,k+1) = h_proto .* exp(1j*2*pi*k*(0:length(h_proto)-1)/M);
end
```

---