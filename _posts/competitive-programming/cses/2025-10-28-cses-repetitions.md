--- 
title: "CSES: Repetitions"
date: 2025-10-28 00:00:00 +0600
categories: [Competitive Programming, CSES]
tags: [cses, introductory-problems]
math: true
---

## Introductory Problems - Repetitions

- **Time limit:** 1.00 s
- **Memory limit:** 512 MB

You are given a DNA sequence: a string consisting of characters A, C, G, and T. Find the longest repetition in the sequence — the maximum-length substring consisting of a single repeated character.

#### Input
The only input line contains a string of n characters.

#### Output
Print one integer: the length of the longest repetition.

#### Constraints
$$1 \le n \le 10^6$$

#### Example
##### Input:
```text
ATTCGGGA
```
##### Output:
```text
3
```

#### Code
```cpp
#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

int main() {
    string code;
    long long int n = 0, len, i = 0, flag = 0, ans = 0;
    cin >> code;
    len = code.length();
    while (i <= len) {
        if (code[flag] == code[i])
            n++;
        else {
            ans = max(n, ans);
            n = 1;
            flag = i;
        }
        i++;
    }
    cout << ans << endl;
    return 0;
}
```
