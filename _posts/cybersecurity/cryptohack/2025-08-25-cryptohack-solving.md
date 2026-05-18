---
title: Learning and solving cryptography with cryptohack
date: 2025-09-27 00:00:00 +0600
categories: [Cybersecurity, CryptoHack]
tags: [cryptohack, hacking, cryptography, python]     # TAG names should always be lowercase
description: "Learning and solving cryptography with cryptohack short note with program and fast explaination"
math: true
---
# Cryptohack
cryptohack is one of the website that can be used to learn cryptography according to some recommendations that I got. so this note will see how much I can learn from here. In This will try and learn from the course section.

## Introduction to cryptohack
This is supposed to teach me about the basics of using this website
### 1st challange
The flag is written directly.
### 2nd challange
Download the python program, and run it with the given instruction. 
### 3rd challange
we are given a list of numbers, we have to convert them to ASCII character. in this section we learn that in python `chr()` function converts numerical value to it's ascii/unicode character. and `ord()` function converts a character into the ascii/numeric value in unicode. given we name the given list as `arr`,
```py
# arr = [99, 114, 121, 112, 116, 125]
for i in arr:
    print(chr(i), end='')
```
### 4th challange
In this we learn about hex value. they are two character value which treanslates into ascii character/bytes. In this case, using python we can convert the bytes into hex and hex into bytes string. hex values are specially useful because after cipher the ascii value may break the text and encoding may or may not work. So hex values are quite useful. we can solve the given challange with the following program where a is the hex string,
```py
# a = "63727970....6c6f747d"
print(a)
print(bytes.fromhex(a))
```
The inverse way ie taking a string and converting it into hex is,
```py
print("Hello, World".encode().hex())
```
Both conversion does not require any library import by python.
### 5th challange
The fifth challange requires us the knowledge of base64. This converts binary data into 64bits ascii character. so each character represents 6bits of data. we also have a default library in python for base64 as this is very heavily used in many cases. the given task was to decode a hex string and encode with base64,
```py
import base64
# a = "72b...7bf"

print(a)

raw_bytes = bytes.fromhex(a)
print(raw_bytes)

b64_encoded = base64.b64encode(raw_bytes)
print(b64_encoded)
```
### 6th challange
In this case we need to use pycryptodome. so we need to install that in the environment. It is recommended that we install any python library in a venv instead of global environment.
```bash
python3 -m venv venv
./venv/bin/activate
pip install pycryptodome
```
and after the work we have to disable the venv with 
```bash
deactivate
```
before the deactivation we have to use the functions `long_to_bytes()` or `bytes_to_long()` from the `from Crypto.Util.number import *`.
```py
from Crypto.Util.number import *

# a = "1151528.....9206269"
a = int(a)
print(long_to_bytes(a))
```

### 7th challange
In this challange we learn about xor and how it has memory behaviour, and how this can be used to encrypt some text. so we can use this for encryption. So, we have to change the text label by xor'ing each character with 13. so we have to do the following, 
```py
s = "label"
a = []
for i in s:
    a.append(chr(ord(i) ^ 13))
print("crypto{", ''.join(a), "}", sep='')
```

### 8th challange
In this case we were supposed to use pwntools xor operation but we have directly used xor operatoin in the program and found the desired flag
```py
KEY1 = "a6c8b6733c9b22de7bc0253266a3867df55acde8635e19c73313"
KEY2_KEY1 = "37dcb292030faa90d07eec17e3b1c6d8daf94c35d4c9191a5e1e"
KEY2_KEY3 = "c1545756687e7573db23aa1c3452a098b71a7fbf0fddddde5fc1"
FLAG_KEY1_KEY3_KEY2 = "04ee9855208a2cd59091d04767ae47963170d1660df7f56f5faf"

k1 = bytes.fromhex(KEY1)
k2_k1 = bytes.fromhex(KEY2_KEY1)
k2_k3 = bytes.fromhex(KEY2_KEY3)
flag_k1_k3_k2 = bytes.fromhex(FLAG_KEY1_KEY3_KEY2)

print(k1)
print(k2_k1)
print(k2_k3)
print(flag_k1_k3_k2)

def xor_bytes(a, b):
    return bytes([x ^ y for x, y in zip(a, b)])

k2 = xor_bytes(k2_k1, k1)
print(f"KEY2: {k2.hex()}")

k3 = xor_bytes(k2_k3, k1)
print(f"KEY3: {k3.hex()}")

flag = xor_bytes(flag_k1_k3_k2, xor_bytes(k1, xor_bytes(k3, k1)))
print("flag :", flag)
```
Since we were supposed to find the flag with that tool the code will look like following (The entire code is converted with AI),
```py
from pwn import *

# Define the hexadecimal keys and flag
KEY1 = "a6c8b6733c9b22de7bc0253266a3867df55acde8635e19c73313"
KEY2_KEY1 = "37dcb292030faa90d07eec17e3b1c6d8daf94c35d4c9191a5e1e"
KEY2_KEY3 = "c1545756687e7573db23aa1c3452a098b71a7fbf0fddddde5fc1"
FLAG_KEY1_KEY3_KEY2 = "04ee9855208a2cd59091d04767ae47963170d1660df7f56f5faf"

# Convert hexadecimal strings to bytes using unhex() from pwntools
k1 = unhex(KEY1)
k2_k1 = unhex(KEY2_KEY1)
k2_k3 = unhex(KEY2_KEY3)
flag_k1_k3_k2 = unhex(FLAG_KEY1_KEY3_KEY2)

# Find KEY2 and KEY3 using the xor() function from pwntools
k2 = xor(k2_k1, k1)
k3 = xor(k2_k3, k2)

# Use xor() from pwntools to calculate the flag
# The expression flag = xor(flag_k1_k3_k2, xor(k1, xor(k3, k2))) is correct
# because XOR is associative, meaning xor(a, xor(b, c)) is the same as xor(xor(a, b), c).
flag = xor(flag_k1_k3_k2, xor(k1, xor(k3, k2)))

# Print the keys and the flag
print(f"KEY1: {k1.hex()}")
print(f"KEY2: {k2.hex()}")
print(f"KEY3: {k3.hex()}")
print("Flag:", flag.decode())
```

### 9th challlange
The 9th challange flag is xored all of the character with the same value. so I got lazy here and converted all of the text into a file with the following program in python, 
```py
c = "73626960647f6b206821204f21254f7d694f7624662065622127234f726927756d"

c = bytes.fromhex(c)
print(c)

for i in range(255):
    # print(i)
    print(i, "".join([chr(i^int(j)) for j in c]))
```
and then running it through `>` symbol
```bash
python3 code.py > a.txt
```
and then I just searched through the a.txt for the text `flag`.

### 10th challange
the 10th challange here was to find the key and get the flag. in this case we were supposed to use the flag structure to guesstimate the flag. so we did,
```py
c = "0e0b213f26041e480b26217f27342e175d0e070a3c5b103e2526217f27342e175d0e077e263451150104"

c = bytes.fromhex(c)
print(chr(c[0]^ord('c')))
print(chr(c[1]^ord('r')))
print(chr(c[2]^ord('y')))
print(chr(c[3]^ord('p')))
print(chr(c[4]^ord('t')))
print(chr(c[5]^ord('o')))
print(chr(c[6]^ord('{')))
print(chr(c[-1]^ord('}')))

key = "GUESS THE KEY HERE"
kl = len(key)

pt = [chr(c[i]^ord(key[i%kl])) for i in range(len(c))]
print("".join(pt))
```
This concludes the first course room which is supposed to be for me. Generally it is recommended that you find the solution with the hint by yourself. and even if you do want to use it please rewrite the code yourself instead of copying from here. These are codes that barely works. And you will not run anything if you do so as well.