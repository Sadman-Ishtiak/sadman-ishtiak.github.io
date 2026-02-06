---
title: Computer Vision Onramp - Part 1 - Course Overview and Video Data
date: 2026-02-03 00:00:00 +0600
categories: [Matlab Academy, Computer Vision]
tags: [matlab, learning, computer-vision]
description: "An introduction to computer vision and setting up video readers in MATLAB."
math: true
---

# Computer Vision Onramp

## Course Overview
Computer vision is about teaching computers to interpret and understand the contents of images and videos by automating perception. It's about automating perception with cameras and other sensors. For example, identify bison in a scene or combining data from multiple cameras to create a digital reconstruction. Computer vision is where knowledge about the real world and digital data meet.

In this course, you will learn to use object detection to find, track, and count turtles in a video.

### Workflow & Outline
Tracking Turtles with Object Detection follows a five-step workflow:
1. **Import Video Data**
2. **Label Ground Truth Data**
3. **Train Detector**
4. **Detect Objects in Each Frame**
5. **Track Objects**

![Tracking-by-detection workflow](/assets/images/matlab/computer-vision/image.png)

## Video Data in MATLAB
### Create a Video Reader
Videos are sequences of images called frames, taken at fixed time intervals, with the frame rate stored as metadata. A video reader makes it easy to access both metadata and individual frames.

You can use the `VideoReader` function to create a video reader:
```m
turtleVideo = VideoReader("turtles.avi");
```

The output holds information about the video file:
```m
turtleVideo.Duration
turtleVideo.FrameRate
turtleVideo.Height
turtleVideo.Width
turtleVideo.NumFrames
```

### Read Video Data
#### Read Frames Sequentially
Use the `readFrame` function to extract the next frame. The video reader tracks progress with the `CurrentTime` property. Each call advances the time by $1/framerate$.
```m
frame = readFrame(turtleVideo);
imshow(frame)
t = turtleVideo.CurrentTime;
```

#### Read Specific Frames
The `read` function extracts a specific frame by its index:
```m
frameMid = read(turtleVideo, 50); % Read 50th frame
imshow(frameMid);
```

You can skip to the last frame using `Inf`:
```m
frameLast = read(turtleVideo, Inf);
```

To rewind, simply reset the `CurrentTime` property:
```m
turtleVideo.CurrentTime = 0;
```