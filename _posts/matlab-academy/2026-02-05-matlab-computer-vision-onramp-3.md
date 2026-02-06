---
title: Computer Vision Onramp - Part 3 - Ground Truth Data
date: 2026-02-05 00:00:00 +0600
categories: [Matlab Academy, Computer Vision]
tags: [matlab, ai, labeling]
description: "Preparing ground truth data for training object detectors."
math: true
---

## Object Detection
### Artificial Intelligence for Object Detection
Computers need to be told how to recognize an object in different positions and scenes. AI is about teaching computers to learn from previous experience. To train a computer to recognize a "general" turtle, we need **Ground Truth** data: images combined with locations and labels of the objects.

### Video Labeler App
The Video Labeler app helps automate this process:
1. **Import Video:** Add the video file to the app.
2. **Define Labels:** Create ROI (Region of Interest) labels (e.g., "turtle").
3. **Label ROI:** Click and drag boxes snugly around the objects.
4. **Automate:** Use built-in algorithms like **Point Tracker** to track features from frame to frame, handling non-linear movement and multiple objects.

### Ground Truth Data in MATLAB
Ground truth data is exported as a `gTruth` object.
```m
data = gTruth.LabelData;
bboxes = data.turtle; % Timetable of bounding boxes
bboxes12 = bboxes{12}; % 12th frame boxes [xmin ymin width height]
```

![Bounding box visualization](/assets/images/matlab/computer-vision/image-6.png)

### Visualize and Annotate
```m
video = VideoReader("lotsOturtles_forVideoLabeling.avi");
frame12 = read(video, 12);
frameBox = insertObjectAnnotation(frame12, "rectangle", bboxes12, "Turtle");
imshow(frameBox);
```

### Create Training Images
Extract every $n^{th}$ frame to provide variety and reduce redundancy:
![Training images variation](/assets/images/matlab/computer-vision/image-7.png)
```m
[imList, boxLabels] = objectDetectorTrainingData(gTruth, SamplingFactor=10, ...
    NamePrefix="turtleFrame", WriteLocation="trainingImages");

imsWithBoxLabels = combine(imList, boxLabels);
```