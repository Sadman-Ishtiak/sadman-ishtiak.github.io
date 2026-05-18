---
title: tryhackme room OhSHINT solving experience 
date: 2025-08-02 00:00:00 +0600
categories: [Cybersecurity, TryHackMe]
tags: [tryhackme, osint, hacking]     # TAG names should always be lowercase
description: "Solving steps of the tryhackme osint room OhSHINT with the use of hints and thought process"
math: true
---
# OhSHINT
This is probably one of the first and best capture the flag which has taught me how open source intelligence works and it is quite scary. As I have found more and more information about the user just from a single image I can say that oversharing in today's world is probably one of the most dangerous thing to do.

So I will go through how I have found and solved this problem

## File download and preliminary work
![The given file for OhSINT problem](/assets/images/WindowsXP_1551719014755.jpg)

The image looks like windows xp wallpaper and when trying to download it is appropriately name `WindowsXP_1551719014755.jpg`.  either this is the original windows xp wallpaper `bliss` or it is captured or edited by the target person.

## step 1 reverse image search
reverse search gives the answer to the ctf flags and we do not want that. so off to the next step to know who is this. 
## Step 2 metadata analysis
we put the image file into `exif.tools` and the could collect the following data

```text
    downloaded name     : WindowsXP_1551719014755.jpg
    file name           : phpoPnTtZ
    File Type Extension : jpg
    MIME Type           : image/jpeg
    Image Size          : 1920x1080
    Megapixels          : 2.1
    Encoding Process    : Baseline DCT, Huffman coding
    Bits Per Sample     : 8
    Color Components    : 3
    Y Cb Cr Sub Sampling: YCbCr4:2:0 (2 2)
    Copyright           : OWoodflint
    GPS Position:       : 54º 17' 41.27" N, 2º 15' 1.33" W
```
So we need to know who is this OWoodflint and where is this location as all the other data in the metadata is mostly image data.
## Step 3 Searching
Searching the location gives us almost nothing. It is a random location in UK in the middle of nothing. probably this is the coordinate when the file was saved last with some editor or captured but the location is not exaclty the location of the actual `bliss` photo but the empty land is somewhat similar.

searching the name on the other hand gives us a lot more new informations such as -

```text
    github account : https://github.com/OWoodfl1nt
    github repo    : people_finder
    github avatar  : default random avatar
    home address   : London
    gmail          : OWoodflint@gmail.com
    twitter        : @OWoodflint
    twitter avatar : screaming black kitten
    blog           : https://oliverwoodflint.wordpress.com
```

he is following some cyber security experts probably the creators of this problem in this case

Unfortunately despite his holiday location is not shared in his github or twitter account.
but he is using free wifi from his house with the tweet

```text
    From my house I can get free wifi ;D 

    Bssid: B4:5D:50:AA:86:41 - Go nuts!
```

but his blog says he is in new york and there is also a hidden text in the blog somewhere. which is the password

and all these solves the six questions 
1. What is this user's avatar of?
2. What city is this person in?
3. What is his personal email address? 
4. What site did you find his email address on?
5. Where has he gone on holiday?
6. What is the person's password?

and finally using the bssid we can have the actual location of his house(I had a lucky guess on his address when I saw the post where he said he is from london) and the final question what access point he uses.
