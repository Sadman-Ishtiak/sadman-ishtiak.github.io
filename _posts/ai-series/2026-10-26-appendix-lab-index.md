---
title: "Appendix A: Lab Index and Cross-Reference"
date: 2026-10-26 00:00:00 +0600
categories: [Artificial Intelligence, Academic Notes]
tags: [appendix, lab, reference]
description: "Cross-reference of lab experiments to book chapters."
excerpt: "Cross-reference of lab experiments to book chapters."
math: true
---

{% raw %}
# Lab Index

## Cross-Reference: Lab Experiments to Book Chapters

Table [tab:lab-chapter-mapping] maps each laboratory experiment from the AI Lab course (CSE 406) to the relevant theory chapters in this book.

| **Exp.** | **Experiment**          | **Topics Covered**                                                              | **Chapter**                                                                                                              |
|:---------|:------------------------|:--------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------|
| 01       | SWI-Prolog Intro        | Facts, rules, queries; family; printing; max; GPA; Fibonacci; factorial         | Ch. [ch:prolog-intro]          |
| 02       | Prolog Rules/Arithmetic | Cube of number; list of goals; GCD/LCM                                          | Ch. [ch:prolog-intro]          |
| 03       | Prolog Lists            | Membership, length, concat, delete, insert; set union/intersection; bubble sort | Ch. [ch:prolog-lists]          |
| 04       | Loops, Trees, DFA       | Recursive loops; menus; tree traversal; DFA simulation                          | Ch. [ch:prolog-advanced] |
| 05       | NFA Simulation          | Nondeterministic FA; multiple transitions; word acceptance                      | Ch. [ch:prolog-advanced] |
| 06       | Cyclic Graphs           | Path finding; visited-list cycle avoidance                                      | Ch. [ch:prolog-advanced] |
| 07       | File Handling           | `tell`/`told`; `see`/`seen`; stream control                                     | Ch. [ch:prolog-advanced] |

Lab experiments and corresponding book chapters

## Prolog Programs (Index Items 11–20)

Table [tab:prolog-programs] lists the Prolog programs from the lab index.

| **\#** | **Program**          | **Description**                                                                                                 |
|:-------|:---------------------|:----------------------------------------------------------------------------------------------------------------|
| 11     | Family relationships | Defines `female/1`, `male/1`, `parentof/2` facts; derives `siblingof/2`, `brotherof/2` via shared-parent rules. |
| 12     | Print list           | Uses `write/1`, `nl/0`, `fail/0` to iterate over `item/1` facts.                                                |
| 13     | Max of two           | Compares two numbers with `>=` and `>` to return the larger.                                                    |
| 14     | GPA lookup           | Reads a name, looks up GPA from facts, writes the result.                                                       |
| 15     | Student-prof         | Relates `studies/2` and `teaches/2` to find professors.                                                         |
| 16     | Fibonacci            | Recursive definition using `is/2` for arithmetic on natural numbers.                                            |
| 17     | Factorial            | Recursive computation with accumulator pattern.                                                                 |
| 18     | Cube of number       | Read-process loop with `stop` sentinel and cut (`!/0`).                                                         |
| 19     | List of goals        | Multiple clauses for `dark/1`: black, brown, or gray.                                                           |
| 20     | GCD and LCM          | Euclidean GCD via recursion; LCM derived as product over GCD.                                                   |

Prolog programs (lab index items 11–20)

## LISP Programs (Index Items 1–5)

Table [tab:lisp-programs] lists the LISP programs from the lab index.

| **\#** | **Program**             | **Description**                                                                       |
|:-------|:------------------------|:--------------------------------------------------------------------------------------|
| 1      | Basic LIST manipulation | Applies `CAR`, `CDR`, `CONS`, `LIST`, `APPEND` to extract and construct lists.        |
| 2      | Additional manipulation | Uses `REVERSE`, `LENGTH`, `MEMBER`, `SUBST`, `NTH` for deeper list processing.        |
| 3      | Max and min             | Computes maximum/minimum of a list using recursive comparison.                        |
| 4      | Area of circle          | Computes $\pi r^2$ with a simple arithmetic function in LISP.                         |
| 5      | PutProp function        | Demonstrates property lists with `PUTPROP` and `GET` to attach properties to symbols. |

LISP programs (lab index items 1–5)

## C++ Programs (Index Items 8–10, 23–25)

Table [tab:cpp-programs] lists the C++ programs from the lab index.

| **\#** | **Program**             | **Description**                                                              |
|:-------|:------------------------|:-----------------------------------------------------------------------------|
| 8      | Breadth-First Search    | Explores a graph level by level using a FIFO queue with visited marking.     |
| 9      | Depth-First Search      | Explores recursively, visiting as far as possible before backtracking.       |
| 10     | A\* Search              | Best-first search using $f(n)=g(n)+h(n)$ with priority queue and closed set. |
| 23     | DFA: starts with “101”  | 5-state DFA: initial, three progress, accept, and dead state for reject.     |
| 24     | DFA: contains “10”      | 3-state DFA tracking substring progress for pattern `10`.                    |
| 25     | DFA: odd 0’s / even 1’s | 4-state parity DFA with states tracking (odd0, even1) pairs.                 |

C++ programs (lab index items 8–10, 23–25)

{% endraw %}
