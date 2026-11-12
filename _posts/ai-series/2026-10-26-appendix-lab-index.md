---
title: "Appendix A: Lab Index and Cross-Reference"
date: 2026-10-26 00:00:00 +0600
categories: [Artificial Intelligence, Academic Notes]
tags: [appendix, lab, reference]
description: "Comprehensive academic notes on Appendix A: Lab Index and Cross-Reference from the Artificial Intelligence series."
math: true
---

# Lab Index


## Cross-Reference: Lab Experiments to Book Chapters


Table~\ref{tab:lab-chapter-mapping} maps each laboratory experiment from the AI Lab course (CSE~406) to the relevant theory chapters in this book.

[htbp]

\begin{tabularx}{\textwidth}{c >{\raggedright\arraybackslash}p{3.5cm} >{\raggedright\arraybackslash}X c}
\toprule
**Exp.** & **Experiment** & **Topics Covered** & **Chapter** \\
\midrule
01 & SWI-Prolog Intro & Facts, rules, queries; family; printing; max; GPA; Fibonacci; factorial & Ch.~\ref{ch:prolog-intro} \\
02 & Prolog Rules/Arithmetic & Cube of number; list of goals; GCD/LCM & Ch.~\ref{ch:prolog-intro} \\
03 & Prolog Lists & Membership, length, concat, delete, insert; set union/intersection; bubble sort & Ch.~\ref{ch:prolog-lists} \\
04 & Loops, Trees, DFA & Recursive loops; menus; tree traversal; DFA simulation & Ch.~\ref{ch:prolog-advanced} \\
05 & NFA Simulation & Nondeterministic FA; multiple transitions; word acceptance & Ch.~\ref{ch:prolog-advanced} \\
06 & Cyclic Graphs & Path finding; visited-list cycle avoidance & Ch.~\ref{ch:prolog-advanced} \\
07 & File Handling & \texttt{tell}/\texttt{told}; \texttt{see}/\texttt{seen}; stream control & Ch.~\ref{ch:prolog-advanced} \\
\bottomrule
\end{tabularx}


*Caption: Lab experiments and corresponding book chapters*



\end{table}

## Prolog Programs (Index Items 11--20)


Table~\ref{tab:prolog-programs} lists the Prolog programs from the lab index.

[htbp]

\begin{tabularx}{\textwidth}{c >{\raggedright\arraybackslash}p{3.2cm} X}
\toprule
**\#** & **Program** & **Description** \\
\midrule
11 & Family relationships & Defines \texttt{female/1}, \texttt{male/1}, \texttt{parentof/2} facts; derives \texttt{siblingof/2}, \texttt{brotherof/2} via shared-parent rules. \\
12 & Print list & Uses \texttt{write/1}, \texttt{nl/0}, \texttt{fail/0} to iterate over \texttt{item/1} facts. \\
13 & Max of two & Compares two numbers with \texttt{>=} and \texttt{>} to return the larger. \\
14 & GPA lookup & Reads a name, looks up GPA from facts, writes the result. \\
15 & Student-prof & Relates \texttt{studies/2} and \texttt{teaches/2} to find professors. \\
16 & Fibonacci & Recursive definition using \texttt{is/2} for arithmetic on natural numbers. \\
17 & Factorial & Recursive computation with accumulator pattern. \\
18 & Cube of number & Read-process loop with \texttt{stop} sentinel and cut (\texttt{!/0}). \\
19 & List of goals & Multiple clauses for \texttt{dark/1}: black, brown, or gray. \\
20 & GCD and LCM & Euclidean GCD via recursion; LCM derived as product over GCD. \\
\bottomrule
\end{tabularx}


*Caption: Prolog programs (lab index items 11--20)*



\end{table}

## LISP Programs (Index Items 1--5)


Table~\ref{tab:lisp-programs} lists the LISP programs from the lab index.

[htbp]

\begin{tabularx}{\textwidth}{c >{\raggedright\arraybackslash}p{3.5cm} X}
\toprule
**\#** & **Program** & **Description** \\
\midrule
1 & Basic LIST manipulation & Applies \texttt{CAR}, \texttt{CDR}, \texttt{CONS}, \texttt{LIST}, \texttt{APPEND} to extract and construct lists. \\
2 & Additional manipulation & Uses \texttt{REVERSE}, \texttt{LENGTH}, \texttt{MEMBER}, \texttt{SUBST}, \texttt{NTH} for deeper list processing. \\
3 & Max and min & Computes maximum/minimum of a list using recursive comparison. \\
4 & Area of circle & Computes $\pi r^2$ with a simple arithmetic function in LISP. \\
5 & PutProp function & Demonstrates property lists with \texttt{PUTPROP} and \texttt{GET} to attach properties to symbols. \\
\bottomrule
\end{tabularx}


*Caption: LISP programs (lab index items 1--5)*



\end{table}

## C++ Programs (Index Items 8--10, 23--25)


Table~\ref{tab:cpp-programs} lists the C++ programs from the lab index.

[htbp]

\begin{tabularx}{\textwidth}{c >{\raggedright\arraybackslash}p{3.5cm} X}
\toprule
**\#** & **Program** & **Description** \\
\midrule
8 & Breadth-First Search & Explores a graph level by level using a FIFO queue with visited marking. \\
9 & Depth-First Search & Explores recursively, visiting as far as possible before backtracking. \\
10 & A* Search & Best-first search using $f(n)=g(n)+h(n)$ with priority queue and closed set. \\
23 & DFA: starts with ``101'' & 5-state DFA: initial, three progress, accept, and dead state for reject. \\
24 & DFA: contains ``10'' & 3-state DFA tracking substring progress for pattern \texttt{10}. \\
25 & DFA: odd 0's / even 1's & 4-state parity DFA with states tracking (odd0, even1) pairs. \\
\bottomrule
\end{tabularx}


*Caption: C++ programs (lab index items 8--10, 23--25)*



\end{table}
