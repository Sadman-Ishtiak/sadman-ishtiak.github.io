---
title: Computer Vision Onramp - Part 4 - Training and Postprocessing
date: 2026-02-06 00:00:00 +0600
categories: [Matlab Academy, Computer Vision]
tags: [matlab, training, postprocessing]
description: "Training an ACF detector and refining results with thresholding and NMS."
math: true
---

## Detect and Count Objects
### Choose a Detection Algorithm
Object detection training algorithms fall into two categories:
1. **Machine Learning (e.g., ACF):** Faster, require less data, detect one class at a time. Good for consistent viewpoints.
2. **Deep Learning (e.g., YOLO):** More accurate, handle more variability and multiple classes, but require more data and a GPU.

**ACF (Aggregated Channel Features)** is ideal for turtles because they don't change significantly in appearance.

### Train an ACF Detector
```m
detector = trainACFObjectDetector(imsWithBoxLabels, NumStages=5);
[bbox, score] = detect(detector, frame);
```
![Bounding box format](/assets/images/matlab/computer-vision/image-8.png)

If the detector mislabels objects (like a rock), increase the `NumStages` (e.g., to 20) to improve accuracy.

### Postprocess Detections
#### 1. Thresholding Scores
Remove low-confidence detections. Use a histogram to determine a threshold:
```m
histogram(score, 10)
bbox = bbox(score > 30, :);
score = score(score > 30);
```

#### 2. Non-Maximum Suppression (NMS)
Remove overlapping boxes identifying the same object using `selectStrongestBbox`:
![Overlapping boxes issue](/assets/images/matlab/computer-vision/image-10.png)
```m
[selectedBbox, selectedScore] = selectStrongestBbox(bbox, score, OverlapThreshold=0.1);
```

### Count and Annotate
```m
numBoxes = size(selectedBbox, 1);
str = numBoxes + " turtle(s) detected";
imgCounted = insertText(frame, [250 550], str);
imshow(imgCounted)
```

### Apply to Each Video Frame
Use a `while` loop with `hasFrame` to process a video stream:
```m
while hasFrame(turtleVideo)
    frame = readFrame(turtleVideo);
    % ... detect, postprocess, and count ...
    imshow(img)
    drawnow
end
```