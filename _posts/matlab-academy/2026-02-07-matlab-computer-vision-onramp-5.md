---
title: Computer Vision Onramp - Part 5 - Object Tracking and Kalman Filters
date: 2026-02-07 00:00:00 +0600
categories: [Matlab Academy, Computer Vision]
tags: [matlab, tracking, kalman-filter]
description: "Finalizing the tracking workflow and earning the course certificate."
math: true
---

## Object Tracking
### Why Kalman Filters?
Tracking by detection uses a detector and a Kalman filter to follow objects. The filter predicts where an object will be, which is crucial for handling **occlusions** (when an object is temporarily hidden).

### Initialize a Kalman Filter
To set up a Kalman filter, you define assumptions about motion:
1. **Motion Model:** "ConstantVelocity" for the turtle.
2. **Initial Location:** Centroid of the first detection: `[xmin + width/2, ymin + height/2]`.
3. **Measurement Noise:** Variance in centroid measurement (e.g., 100).
4. **Motion Noise:** Deviation from the model (e.g., `[1 25]` for location/velocity).
5. **Initial Estimate Error:** Allows the filter to adjust quickly initially (e.g., `[1 25]`).

```m
kf = configureKalmanFilter(motionModel, initialLoc, initialError, motionNoise, measurementNoise);
```
![Crawling turtle with glitch](/assets/images/matlab/computer-vision/image-11.png)

### Track a Single Object: Predict, Detect, Correct
The workflow for each frame:
1. **Predict:** Where should the object be now?
2. **Detect:** Run the detector.
3. **Correct:** If detected, refine the filter with the actual location.

```m
while hasFrame(turtleVideo)
    trackedLoc = predict(kf);
    frame = readFrame(turtleVideo);
    [bbox, score] = detect(detector, frame);

    if ~isempty(bbox)
        strongestBbox = selectStrongestBbox(bbox, score, NumStrongest=1);
        centroid = [strongestBbox(1)+strongestBbox(3)/2 strongestBbox(2)+strongestBbox(4)/2];
        trackedLoc = correct(kf, centroid);
    end
    
    % Red circle for tracked location, Green for detection
    frame = insertShape(frame, "filled-circle", [trackedLoc 20], Color="red");
    imshow(frame)
    drawnow
end
```

---

## Achievement Certificate
Congratulations on completing the Computer Vision Onramp!

[View Course Completion Certificate](https://matlabacademy.mathworks.com/progress/share/certificate.html?id=81b5f8fb-2bff-4147-a1bf-fa55e079d8c9&)

<iframe src="/assets/pdf/Matlab04.pdf" width="100%" height="600px" style="border:none;">
    Your browser does not support iframes. <a href="/assets/pdf/Matlab04.pdf">Download the PDF</a> instead.
</iframe>

<p align="center">
  <a href="/assets/pdf/Matlab04.pdf">
    <img src="/assets/images/matlab/computer-vision/image.png" alt="MATLAB Computer Vision Certificate" width="400">
    <br>
    Click to view certificate
  </a>
</p>