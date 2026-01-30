--- 
title: "CSES: Increasing Array"
date: 2025-10-30 00:00:00 +0600
categories: [Competitive Programming, CSES]
tags: [cses, introductory-problems]
math: true
---

## Introductory Problems - Increasing Array

- **Time limit:** 1.00 s  
- **Memory limit:** 512 MB

You are given an array of n integers. You want to modify the array so that it is non-decreasing: every element is at least as large as the previous element. On each move, you may increase the value of any element by one. What is the minimum number of moves required?

#### Input
The first input line contains an integer n: the size of the array.  
The second line contains n integers x_1, x_2, ..., x_n: the contents of the array.

#### Output
Print the minimum number of moves.

#### Constraints
$$1 \le n \le 2\cdot 10^5$$
$$1 \le x_i \le 10^9$$

#### Example
Input:
```text
5
3 2 5 1 7
```
Output:
```text
5
```

#### Code
```cpp
#include<iostream>
 
using namespace std;
int main() {
    long long int k, ans = 0, i;
    cin >> k;
    long long int n[k];
    for(i = 0; i < k; i++)
        cin >> n[i];
    for(i=1; i<k; i++)
    {
        if(n[i-1]>n[i])
        {
            ans += n[i-1]-n[i];
            n[i] = n[i -1];
        }
    }
    cout << ans << endl;
    return 0;
}
```
