---
title: tryhackme room "CTF collection volume 1" solving experience 
date: 2025-09-30 00:00:00 +0600
categories: [Hacking, Tryhackme]
tags: [tryhackme, hacking, ctf]     # TAG names should always be lowercase
description: "tryhackme room CTF collection volume 1 solving experience and tutorial note"
math: true
---
# CTF collection volume 1
This is a room full of basic ctf flags which shows how to find flags in ctf.
## Task 1
Task 1 is no answer. It is a reading note from the author about the room.
## Task 2
The given text is `VEhNe2p1NTdfZDNjMGQzXzdoM19iNDUzfQ==`. Which has two `==` at the end. It generally is a sign of being encoded into base 64 or something similar. so we code the following,

```py
import base64
a = "VEhNe2p1NTdfZDNjMGQzXzdoM19iNDUzfQ=="

print(a)
print(base64.b64decode(a))
```
which gives us the flag.
## Task 3
This task gives us an image. and says meta meta meta. so first we check the metadata of the image with the `exiftool` by the command,
```bash
exiftool ./find_me.jpg
```
you may need to install exiftool.
## Task 4
Task 4 is gives hint of hiding. The technique of hiding information is steganography. so we use steghide in this image,
```bash
steghide extract -sf Extinction_1577976250757.jpg
```
Since we dont know the passohrase we directly input nothing and see if that works or not. which works and so we cat the output and find the flag.
## Task 5
Flag is hidden in plaintext. so we have to select everything with `CTRL+A` and we can find the flag in the page.  
## Task 6
This gives us an image. which is a QR code. and reading the qr code directly gave us the flag.
## Task 7
This gives us a binary file and gives us a hint of both reading and reverse engineering works here. so we strings it by
```bash
strings hello_1577977122465.hello
```
and among the output we get the flag.
## Task 8
This is another decryption task. we give this to decode.fr and see that it says it is base58 with high probability. so we check it and find the flag.
## Task 9
This one is given with the hint that it may be rot or ceaser cipher. so we go to cyberchef and use rot13 and then check for all the values of shifts. find the flag this way.
## Task 10
The flag is hidden in the html. We have to use inspect element with display hidden style and comment that hidden option.
## Task 11
We are given a curropted png image file so we use pngcheck on it. 
```bash
$pngcheck -v spoil_1577979329740.png 
File: spoil_1577979329740.png (70759 bytes)
  this is neither a PNG or JNG image nor a MNG stream
ERRORS DETECTED in spoil_1577979329740.png
```
we then check for the magic png id in the hex
```bash
$xxd -l 16 spoil_1577979329740.png 
00000000: 2333 445f 0d0a 1a0a 0000 000d 4948 4452  #3D_........IHDR
```
which does not exist and so we try and replace them with the magic numbers.
```bash
$printf '\x89\x50\x4E\x47' | dd of=spoil_1577979329740.png bs=1 count=4 conv=notrunc
```
which fixes the image.
```bash
$pngcheck spoil_1577979329740.png
OK: spoil_1577979329740.png (800x800, 32-bit RGB+alpha, non-interlaced, 97.2%).
```
the flag is in the image.
## Task 12
This one is a google dorking task. I had to filter and search through a lot of reddit posts to find it in the reddit since there are a lot of people searching for THM or tryhackme and there are a lot of posts with the keyword in the reddit. 
I had searched site:reddit.com/r/tryhackme "THM" for quite a while to find the post
[https://www.reddit.com/r/tryhackme/comments/eizxaq/new_room_coming_soon/](https://www.reddit.com/r/tryhackme/comments/eizxaq/new_room_coming_soon/)
## Task 13
This one I needed the hint. It says brainfuck. so once I searched and read some basics it seemed it is a brainfuck code. so I just compiled the code in an online brainfuck compiler. and I got the flag.
## Task 14
The two string looked like they are hex value of ascii character and the xor key. So in cyberchef I did the exactly the same and the flag came out.
## Task 15
The hint says binwalk, so I put the file in binwalk and find out that 
```bash
binwalk hell_1578018688127.jpg 

DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             JPEG image data, JFIF standard 1.02
30            0x1E            TIFF image data, big-endian, offset of first image directory: 8
265845        0x40E75         Zip archive data, at least v2.0 to extract, uncompressed size: 69, name: hello_there.txt
266099        0x40F73         End of Zip archive, footer length: 22
```
there is a hello.txt file in the image as a zip archive. so we extract the file.
```bash
binwalk -e hell_1578018688127.jpg

DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             JPEG image data, JFIF standard 1.02
30            0x1E            TIFF image data, big-endian, offset of first image directory: 8
265845        0x40E75         Zip archive data, at least v2.0 to extract, uncompressed size: 69, name: hello_there.txt
266099        0x40F73         End of Zip archive, footer length: 22

┌[parrot]─[21:05-30/09]─[/home/sadman/Downloads/ctf/tryhackme/ctf-collection-vol-1/task15]
└╼sadman$ls
total 264K
-rw-r--r-- 1 sadman sadman 260K Sep 30 20:53 hell_1578018688127.jpg
drwxr-xr-x 1 sadman sadman   48 Sep 30 21:05 _hell_1578018688127.jpg.extracted
-rw-r--r-- 1 sadman sadman   69 Jan  3  2020 hello_there.txt
┌[parrot]─[21:05-30/09]─[/home/sadman/Downloads/ctf/tryhackme/ctf-collection-vol-1/task15]
└╼sadman$cd _hell_1578018688127.jpg.extracted/
┌[parrot]─[21:05-30/09]─[/home/sadman/Downloads/ctf/tryhackme/ctf-collection-vol-1/task15/_hell_1578018688127.jpg.extracted]
└╼sadman$ls
total 8.0K
-rw-r--r-- 1 sadman sadman 276 Sep 30 21:05 40E75.zip
-rw-r--r-- 1 sadman sadman  69 Jan  3  2020 hello_there.txt
┌[parrot]─[21:05-30/09]─[/home/sadman/Downloads/ctf/tryhackme/ctf-collection-vol-1/task15/_hell_1578018688127.jpg.extracted]
└╼sadman$cat hello_there.txt
Thank you for extracting me, you are the best!

THM{y0u_w4lk_m3_0u7}
┌[parrot]─[21:05-30/09]─[/home/sadman/Downloads/ctf/tryhackme/ctf-collection-vol-1/task15/_hell_1578018688127.jpg.extracted]
└╼sadman$
```
and then find out the txt file containing flag
## Task 16
The image required editing and color playing with the gimp color graph tool to get the flag. 
## Task 17
The flag is spoken in the url of the qr code which contains a soundcloud link. 
## Task 18
I needed to use the wayback machine for that url in that specif date. and the flag was in the page, in plain sight.
## Task 19
It seems this is a ceaser cipher with a key. so we have to find the key by individually calculating each character from the given context,
```txt
T --- 7
R --- 19
Y --- 14
H --- 7
A --- 19
C --- 14
K --- 7
M --- 19
E --- 14
```
with this context we can loop 7 19 14 and see how this goes. and It was correct.
## Task 20
We are given a very long decimal number. lets assume it is long format of bytes.
```py
from Crypto.Util.number import *

print(long_to_bytes(581695969015253365094191591547859387620042736036246486373595515576333693))
```
which turns out to be correct.
## Task 21
This required us to use wireshark to open the given file and then we greped for all ack and then http requests. where we get there is a flag.txt file which is sent and recieved. we then read that flag file.