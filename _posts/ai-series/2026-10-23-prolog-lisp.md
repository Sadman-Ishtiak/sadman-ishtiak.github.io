---
title: "LISP Programming and Symbolic Computation"
date: 2026-10-23 00:00:00 +0600
categories: [Artificial Intelligence, Academic Notes]
tags: [lisp, functional-programming, ai-lab]
description: "Comprehensive academic notes on LISP Programming and Symbolic Computation from the Artificial Intelligence series."
math: true
---

# Introduction to LISP


% ==================== Section 18.1 ====================

## LISP Overview


**LISP** (LISt Processing) is the second-oldest high-level programming language, created by John McCarthy in 1958. It was designed for symbolic computation and has been the primary language for artificial intelligence research for decades.



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 LISP</strong>


**LISP** (LISt Processing) is a family of programming languages in which both code and data are represented as lists. The language treats programs as data structures that can be inspected, modified, and executed. Common Lisp is the most widely used dialect.

</div>



### Key Features of LISP

\begin{itemize}
  \item **Symbolic computation:** LISP manipulates symbols and symbolic expressions, not just numeric values.
  \item **Homoiconicity:** LISP code and data share the same representation (lists), enabling macros and metaprogramming.
  \item **Automatic memory management:** LISP provides garbage collection, freeing the programmer from manual memory management.
  \item **First-class functions:** Functions can be passed as arguments, returned as values, and stored in data structures.
  \item **Interactive development:** The read---eval---print loop (REPL) allows incremental testing and debugging.
  \item **Recursion as a control structure:** LISP relies on recursion rather than iteration as the primary looping mechanism.
\end{itemize}

### LISP Syntax

LISP syntax is based on **S-expressions** (Symbolic Expressions). An S-expression is either:
\begin{itemize}
  \item An **atom**: a number, symbol, or string (e.g., \texttt{42}, \texttt{hello}, \texttt{"AI"})
  \item A **list**: a sequence of S-expressions enclosed in parentheses (e.g., \texttt{(+ 1 2)}, \texttt{(car '(a b c))})
\end{itemize}

[ht]

\begin{tikzpicture}[scale=1, transform shape]
  \node[draw, fill=blue!10, rectangle, minimum width=5cm, minimum height=0.8cm, font=\small] (sexp) at (0,3) {**S-Expression**};
  \node[draw, fill=green!10, rectangle, minimum width=2.5cm, minimum height=0.8cm, font=\small] (atom) at (-2.5,1.5) {**Atom**};
  \node[draw, fill=yellow!10, rectangle, minimum width=2.5cm, minimum height=0.8cm, font=\small] (list) at (2.5,1.5) {**List**};
  \draw[->, thick] (sexp.south) -- ++(0,-0.2) -| (atom.north);
  \draw[->, thick] (sexp.south) -- ++(0,-0.2) -| (list.north);

  \node[draw, fill=red!10, rectangle, minimum width=1.3cm, minimum height=0.6cm, font=\small] (num) at (-4.7,-0.5) {Number};
  \node[draw, fill=red!10, rectangle, minimum width=1.3cm, minimum height=0.6cm, font=\small] (sym) at (-2.5,-0.5) {Symbol};
  \node[draw, fill=red!10, rectangle, minimum width=1.3cm, minimum height=0.6cm, font=\small] (str) at (-0.9,-0.5) {String};
  \draw[->, thick] (atom.south) -- ++(0,-0.2) -| (num.north);
  \draw[->, thick] (atom.south) -- ++(0,-0.2) -| (sym.north);
  \draw[->, thick] (atom.south) -- ++(0,-0.2) -| (str.north);

  \node[draw, fill=red!10, rectangle, minimum width=1.8cm, minimum height=0.6cm, font=\small] (proper) at (1.2,-0.5) {Proper};
  \node[draw, fill=red!10, rectangle, minimum width=1.8cm, minimum height=0.6cm, font=\small] (dotted) at (4.5,-0.5) {Dotted};
  \draw[->, thick] (list.south) -- ++(0,-0.2) -| (proper.north);
  \draw[->, thick] (list.south) -- ++(0,-0.2) -| (dotted.north);
\end{tikzpicture}

*Caption: LISP S-expression hierarchy.*


\end{figure}



<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 LISP Expressions</strong>


\begin{itemize}
  \item **Atom:** \texttt{42} (number), \texttt{hello} (symbol), \texttt{"AI"} (string) --- evaluate to themselves.
  \item **List as function call:** \texttt{(+ 1 2)} evaluates to \texttt{3}.
  \item **List as data (quoted):** \texttt{'(a b c)} evaluates to the list \texttt{(A B C)}.
  \item **Nested expression:** \texttt{(* (+ 2 3) (- 5 1))} evaluates to \texttt{20}.
\end{itemize}

</div>



% ==================== Section 18.2 ====================

## Basic List Manipulation Functions


A **list** in LISP is the fundamental data structure. Lists are built from **cons cells** --- pairs with two parts: the \texttt{car} (first element) and the \texttt{cdr} (rest of the list). The empty list is denoted \texttt{nil} or \texttt{()}.



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 CAR and CDR</strong>


\texttt{CAR} returns the first element of a list. \texttt{CDR} returns the list without its first element.
\begin{itemize}
  \item \texttt{(car list)} --- first element
  \item \texttt{(cdr list)} --- the rest of the list (a list)
\end{itemize}

</div>




```lisp
(car '(a b c d))
(cdr '(a b c d))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 CAR and CDR</strong>


\begin{itemize}
  \item \texttt{(car '(a b c d))} $\rightarrow$ \texttt{A}
  \item \texttt{(cdr '(a b c d))} $\rightarrow$ \texttt{(B C D)}
  \item \texttt{(car '((a b) c d))} $\rightarrow$ \texttt{(A B)}
  \item \texttt{(cdr '((a b) c d))} $\rightarrow$ \texttt{(C D)}
\end{itemize}

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 CONS</strong>


\texttt{CONS} constructs a new cons cell. It takes two arguments: the first becomes the \texttt{car} and the second becomes the \texttt{cdr} of the new cell.
\begin{itemize}
  \item \texttt{(cons x y)} --- creates a pair \texttt{(x . y)}
  \item If \texttt{y} is a list, \texttt{cons} prepends \texttt{x} to \texttt{y}.
\end{itemize}

</div>




```lisp
(cons 'a '(b c d))
(cons 'a (cons 'b (cons 'c nil)))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 CONS</strong>


\begin{itemize}
  \item \texttt{(cons 'a '(b c d))} $\rightarrow$ \texttt{(A B C D)}
  \item \texttt{(cons 'a 'b)} $\rightarrow$ \texttt{(A . B)} (dotted pair)
  \item \texttt{(cons 'a nil)} $\rightarrow$ \texttt{(A)}
  \item \texttt{(cons 1 (cons 2 (cons 3 nil)))} $\rightarrow$ \texttt{(1 2 3)}
\end{itemize}

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 LIST</strong>


\texttt{LIST} creates a list from its arguments. Unlike \texttt{cons} which builds pairs, \texttt{list} always produces a proper list.
\begin{itemize}
  \item \texttt{(list arg1 arg2 ... argn)} --- creates a new list of n elements
\end{itemize}

</div>




```lisp
(list 'a 'b 'c 'd)
(list 1 2 3)
(list 'a '(b c) 'd)
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 LIST</strong>


\begin{itemize}
  \item \texttt{(list 'a 'b 'c 'd)} $\rightarrow$ \texttt{(A B C D)}
  \item \texttt{(list 1 2 3)} $\rightarrow$ \texttt{(1 2 3)}
  \item \texttt{(list 'a '(b c) 'd)} $\rightarrow$ \texttt{(A (B C) D)}
  \item \texttt{(list)} $\rightarrow$ \texttt{NIL}
\end{itemize}

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 APPEND</strong>


\texttt{APPEND} concatenates two or more lists. It returns a new list containing the elements of all argument lists in order.
\begin{itemize}
  \item \texttt{(append list1 list2 ... listn)} --- concatenates lists
  \item Arguments except the last are copied; the last is shared.
\end{itemize}

</div>




```lisp
(append '(a b) '(c d))
(append '(1 2) '(3 4) '(5 6))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 APPEND</strong>


\begin{itemize}
  \item \texttt{(append '(a b) '(c d))} $\rightarrow$ \texttt{(A B C D)}
  \item \texttt{(append '(1 2) '(3 4) '(5 6))} $\rightarrow$ \texttt{(1 2 3 4 5 6)}
  \item \texttt{(append '(a) '(b) nil '(c))} $\rightarrow$ \texttt{(A B C)}
\end{itemize}

</div>



% ==================== Section 18.3 ====================

## Additional List Manipulation Functions


LISP provides many built-in functions for common list operations. Table~\ref{tab:additional-list-functions} summarises the most frequently used ones.

[ht]

\begin{tabular}{@{}lll@{}}
\toprule
**Function** & **Format** & **Purpose** \\
\midrule
LENGTH & \texttt{(length list)} & Returns the number of elements \\
REVERSE & \texttt{(reverse list)} & Returns a reversed copy of the list \\
MEMBER & \texttt{(member item list)} & Tests membership; returns tail or nil \\
NTH & \texttt{(nth n list)} & Returns the nth element (0-indexed) \\
LAST & \texttt{(last list)} & Returns the last cons cell \\
FIRST & \texttt{(first list)} & Synonym for car \\
REST & \texttt{(rest list)} & Synonym for cdr \\
BUTLAST & \texttt{(butlast list)} & Returns list without the last element \\
\bottomrule
\end{tabular}


*Caption: Additional list manipulation functions in LISP.*



\end{table}



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 LENGTH</strong>


\texttt{LENGTH} returns the number of elements in a list.
\begin{itemize}
  \item \texttt{(length list)} --- integer count of top-level elements
\end{itemize}

</div>




```lisp
(length '(a b c d))
(length '())
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 LENGTH</strong>


\begin{itemize}
  \item \texttt{(length '(a b c d))} $\rightarrow$ \texttt{4}
  \item \texttt{(length '())} $\rightarrow$ \texttt{0}
  \item \texttt{(length '((a b) c (d e)))} $\rightarrow$ \texttt{3}
\end{itemize}

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 REVERSE</strong>


\texttt{REVERSE} returns a new list with elements in reverse order. The original list is not modified.
\begin{itemize}
  \item \texttt{(reverse list)} --- reversed copy of the list
\end{itemize}

</div>




```lisp
(reverse '(a b c d))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 REVERSE</strong>


\begin{itemize}
  \item \texttt{(reverse '(a b c d))} $\rightarrow$ \texttt{(D C B A)}
  \item \texttt{(reverse '((a b) c d))} $\rightarrow$ \texttt{(D C (A B))}
\end{itemize}

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 MEMBER</strong>


\texttt{MEMBER} tests whether an item appears in a list. If found, it returns the tail of the list starting from that item; otherwise it returns \texttt{nil}.
\begin{itemize}
  \item \texttt{(member item list)} --- tail starting at item, or nil
\end{itemize}

</div>




```lisp
(member 'b '(a b c d))
(member 'x '(a b c d))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 MEMBER</strong>


\begin{itemize}
  \item \texttt{(member 'b '(a b c d))} $\rightarrow$ \texttt{(B C D)}
  \item \texttt{(member 'x '(a b c d))} $\rightarrow$ \texttt{NIL}
  \item \texttt{(member 3 '(1 2 3 4))} $\rightarrow$ \texttt{(3 4)}
\end{itemize}

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 NTH</strong>


\texttt{NTH} returns the nth element of a list using zero-based indexing. \texttt{(nth n list)} is equivalent to \texttt{(car (nthcdr n list))}.
\begin{itemize}
  \item \texttt{(nth n list)} --- element at position n
\end{itemize}

</div>




```lisp
(nth 0 '(a b c d))
(nth 2 '(a b c d))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 NTH</strong>


\begin{itemize}
  \item \texttt{(nth 0 '(a b c d))} $\rightarrow$ \texttt{A}
  \item \texttt{(nth 2 '(a b c d))} $\rightarrow$ \texttt{C}
  \item \texttt{(nth 5 '(a b c d))} $\rightarrow$ \texttt{NIL}
\end{itemize}

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 LAST</strong>


\texttt{LAST} returns the last cons cell of a list. For a proper list, this is the last element wrapped in a list of length 1.
\begin{itemize}
  \item \texttt{(last list)} --- returns the last cons cell
\end{itemize}

</div>




```lisp
(last '(a b c d))
(last '(1 2 3))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 LAST</strong>


\begin{itemize}
  \item \texttt{(last '(a b c d))} $\rightarrow$ \texttt{(D)}
  \item \texttt{(last '(1 2 3))} $\rightarrow$ \texttt{(3)}
  \item \texttt{(last '(a))} $\rightarrow$ \texttt{(A)}
  \item \texttt{(last '())} $\rightarrow$ \texttt{NIL}
\end{itemize}

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 FIRST and REST</strong>


\texttt{FIRST} is a synonym for \texttt{CAR} --- it returns the first element of a list. \texttt{REST} is a synonym for \texttt{CDR} --- it returns the list without its first element.
\begin{itemize}
  \item \texttt{(first list)} --- first element (same as \texttt{car})
  \item \texttt{(rest list)} --- the rest of the list (same as \texttt{cdr})
\end{itemize}

</div>




```lisp
(first '(a b c d))
(rest '(a b c d))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 FIRST and REST</strong>


\begin{itemize}
  \item \texttt{(first '(a b c d))} $\rightarrow$ \texttt{A}
  \item \texttt{(rest '(a b c d))} $\rightarrow$ \texttt{(B C D)}
  \item \texttt{(first '((1 2) 3 4))} $\rightarrow$ \texttt{(1 2)}
  \item \texttt{(rest '((1 2) 3 4))} $\rightarrow$ \texttt{(3 4)}
\end{itemize}

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 BUTLAST</strong>


\texttt{BUTLAST} returns a list with the last element removed. The original list is not modified.
\begin{itemize}
  \item \texttt{(butlast list)} --- list without the last element
\end{itemize}

</div>




```lisp
(butlast '(a b c d))
(butlast '(1 2 3))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 BUTLAST</strong>


\begin{itemize}
  \item \texttt{(butlast '(a b c d))} $\rightarrow$ \texttt{(A B C)}
  \item \texttt{(butlast '(1 2 3))} $\rightarrow$ \texttt{(1 2)}
  \item \texttt{(butlast '(a))} $\rightarrow$ \texttt{NIL}
  \item \texttt{(butlast '())} $\rightarrow$ \texttt{NIL}
\end{itemize}

</div>



% ==================== Section 18.4 ====================

## Conditional Constructs


LISP provides **COND** and **IF** as the primary conditional constructs for decision-making in programs.



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 COND</strong>


\texttt{COND} is the general conditional construct. It evaluates a sequence of test--action pairs. Each pair is a list where the first element is a test expression and the remaining elements are actions. For the first test that evaluates to true (non-nil), the corresponding actions are evaluated and the last value is returned.
\begin{itemize}
  \item \texttt{(cond (test1 action1) (test2 action2) ... (t default))}
  \item The symbol \texttt{t} is used for the default/else case.
\end{itemize}

</div>




```lisp
(setq x 5)
(cond ((> x 0) 'positive)
      ((< x 0) 'negative)
      (t 'zero))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 COND</strong>


\begin{itemize}
  \item If \texttt{x = 5}: \texttt{(cond ((> x 0) 'positive) ((< x 0) 'negative) (t 'zero))} $\rightarrow$ \texttt{POSITIVE}
  \item If \texttt{x = -3}: same expression $\rightarrow$ \texttt{NEGATIVE}
  \item If \texttt{x = 0}: same expression $\rightarrow$ \texttt{ZERO}
\end{itemize}

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 IF</strong>


\texttt{IF} is a simpler conditional that takes a test, a then-form, and an optional else-form.
\begin{itemize}
  \item \texttt{(if test then-form else-form)}
  \item If test evaluates to true (non-nil), then-form is evaluated; otherwise else-form is evaluated.
\end{itemize}

</div>




```lisp
(setq x 10)
(if (> x 5) 'large 'small)
(if (> x 15) 'large 'small)
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 IF</strong>


\begin{itemize}
  \item \texttt{(if (> 10 5) 'yes 'no)} $\rightarrow$ \texttt{YES}
  \item \texttt{(if (> 3 5) 'yes 'no)} $\rightarrow$ \texttt{NO}
  \item \texttt{(if '() 'true 'false)} $\rightarrow$ \texttt{FALSE} (empty list is false)
  \item \texttt{(if 42 'true 'false)} $\rightarrow$ \texttt{TRUE} (any non-nil is true)
\end{itemize}

</div>



% ==================== Section 18.5 ====================

## Recursion in LISP


Recursion is the primary control mechanism in LISP. A recursive function calls itself with modified arguments until a base case is reached.



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Recursion</strong>


A **recursive function** is a function that calls itself. Every recursive function must have:
\begin{itemize}
  \item A **base case** that stops the recursion
  \item A **recursive case** that reduces the problem toward the base case
\end{itemize}
In LISP, recursion naturally follows the structure of lists: operate on the \texttt{car}, then recurse on the \texttt{cdr}.

</div>



The factorial function is the classic example of recursion:


```lisp
(defun factorial (n)
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))
```


[htbp]



![](/assets/images/ai-book/figures/book-003-p3.png)



*Caption: Recursive flow for \texttt{(factorial 5)*
.}

\end{figure}



<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Factorial Execution Trace</strong>


Evaluation of \texttt{(factorial 5)}:
\begin{enumerate}
  \item \texttt{(factorial 5)} $\rightarrow$ $5 \times$ \texttt{(factorial 4)}
  \item \texttt{(factorial 4)} $\rightarrow$ $4 \times$ \texttt{(factorial 3)}
  \item \texttt{(factorial 3)} $\rightarrow$ $3 \times$ \texttt{(factorial 2)}
  \item \texttt{(factorial 2)} $\rightarrow$ $2 \times$ \texttt{(factorial 1)}
  \item \texttt{(factorial 1)} $\rightarrow$ $1$ (base case reached)
  \item Unwinding: $2 \times 1 = 2$, $3 \times 2 = 6$, $4 \times 6 = 24$, $5 \times 24 = 120$
  \item Final result: \texttt{120}
\end{enumerate}

</div>



% ==================== Section 18.6 ====================

## Practical Programs


This section presents complete LISP programs that solve common computational problems. Each program is defined as a function using \texttt{defun}.

### Area of a Circle




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Area of a Circle</strong>


The area $A$ of a circle with radius $r$ is given by $A = \pi r^2$.
\begin{itemize}
  \item \texttt{(area-circle r)} --- returns $\pi r^2$ using $\pi \approx 3.1416$
\end{itemize}

</div>




```lisp
(defun area-circle (r)
  (* 3.1416 r r))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Area of a Circle</strong>


\begin{itemize}
  \item \texttt{(area-circle 5)} $\rightarrow$ $3.1416 \times 5 \times 5 = 78.54$
  \item \texttt{(area-circle 7)} $\rightarrow$ $3.1416 \times 7 \times 7 = 153.9384$
\end{itemize}

</div>



### Area of a Triangle




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Area of a Triangle</strong>


The area $A$ of a triangle with base $b$ and height $h$ is $A = \frac{1}{2} b h$.
\begin{itemize}
  \item \texttt{(area-triangle b h)} --- returns $\frac{1}{2} \times b \times h$
\end{itemize}

</div>




```lisp
(defun area-triangle (b h)
  (* 0.5 b h))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Area of a Triangle</strong>


\begin{itemize}
  \item \texttt{(area-triangle 10 5)} $\rightarrow$ $0.5 \times 10 \times 5 = 25.0$
  \item \texttt{(area-triangle 7 3)} $\rightarrow$ $0.5 \times 7 \times 3 = 10.5$
\end{itemize}

</div>



### Sum and Average of Numbers




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Sum and Average</strong>


Given a list of numbers, \texttt{sum-list} computes the total by recursively adding the first element to the sum of the rest. \texttt{average-list} divides the sum by the length of the list.
\begin{itemize}
  \item \texttt{(sum-list lst)} --- recursively computes the sum
  \item \texttt{(average-list lst)} --- computes the arithmetic mean
\end{itemize}

</div>




```lisp
(defun sum-list (lst)
  (if (null lst)
      0
      (+ (car lst) (sum-list (cdr lst)))))

(defun average-list (lst)
  (/ (sum-list lst) (length lst)))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Sum and Average</strong>


\begin{itemize}
  \item \texttt{(sum-list '(10 20 30 40))} $\rightarrow$ $10 + 20 + 30 + 40 = 100$
  \item \texttt{(average-list '(10 20 30 40))} $\rightarrow$ $100 / 4 = 25.0$
  \item \texttt{(sum-list '(5 15 25))} $\rightarrow$ $45$
  \item \texttt{(average-list '(5 15 25))} $\rightarrow$ $15.0$
\end{itemize}

</div>



### Maximum and Minimum of Numbers




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Maximum and Minimum</strong>


Given a list of numbers, \texttt{max-list} finds the largest element and \texttt{min-list} finds the smallest. Both use recursion to compare elements.
\begin{itemize}
  \item \texttt{(max-list lst)} --- recursively finds the maximum
  \item \texttt{(min-list lst)} --- recursively finds the minimum
\end{itemize}

</div>




```lisp
(defun max-list (lst)
  (if (null (cdr lst))
      (car lst)
      (max (car lst) (max-list (cdr lst)))))

(defun min-list (lst)
  (if (null (cdr lst))
      (car lst)
      (min (car lst) (min-list (cdr lst)))))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Maximum and Minimum</strong>


\begin{itemize}
  \item \texttt{(max-list '(34 78 12 56 90))} $\rightarrow$ \texttt{90}
  \item \texttt{(min-list '(34 78 12 56 90))} $\rightarrow$ \texttt{12}
  \item \texttt{(max-list '(-5 0 3 -1 8))} $\rightarrow$ \texttt{8}
  \item \texttt{(min-list '(-5 0 3 -1 8))} $\rightarrow$ \texttt{-5}
\end{itemize}

</div>



### Factorial Computation




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Factorial</strong>


The factorial of a non-negative integer $n$, denoted $n!$, is the product of all positive integers from 1 to $n$. By definition, $0! = 1$.
\[
n! = \prod_{k=1}^{n} k = n \times (n-1) \times (n-2) \times \cdots \times 1
\]
\begin{itemize}
  \item \texttt{(factorial n)} --- computes $n!$ recursively
\end{itemize}

</div>




```lisp
(defun factorial (n)
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Factorial Computation</strong>


\begin{itemize}
  \item \texttt{(factorial 0)} $\rightarrow$ \texttt{1}
  \item \texttt{(factorial 5)} $\rightarrow$ $5 \times 4 \times 3 \times 2 \times 1 = 120$
  \item \texttt{(factorial 7)} $\rightarrow$ $7! = 5040$
  \item \texttt{(factorial 10)} $\rightarrow$ $10! = 3628800$
\end{itemize}

</div>



### Array Declaration and Access




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Array Declaration and Access</strong>


LISP provides the \texttt{make-array} function to create arrays. Elements are accessed and modified using \texttt{aref} and \texttt{setf}.
\begin{itemize}
  \item \texttt{(make-array '(size))} --- creates a one-dimensional array
  \item \texttt{(aref array index)} --- retrieves element at index
  \item \texttt{(setf (aref array index) value)} --- assigns value to element
\end{itemize}

</div>




```lisp
(setq arr (make-array '(5)))
(setf (aref arr 0) 10)
(setf (aref arr 1) 20)
(setf (aref arr 2) 30)
(setf (aref arr 3) 40)
(setf (aref arr 4) 50)

(aref arr 0)
(aref arr 2)
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Array Declaration and Access</strong>


\begin{itemize}
  \item \texttt{(aref arr 0)} $\rightarrow$ \texttt{10}
  \item \texttt{(aref arr 2)} $\rightarrow$ \texttt{30}
  \item \texttt{(aref arr 4)} $\rightarrow$ \texttt{50}
  \item \texttt{(setf (aref arr 0) 100)} then \texttt{(aref arr 0)} $\rightarrow$ \texttt{100}
\end{itemize}

</div>



### PutProp Function (Property Lists)




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 PutProp and Property Lists</strong>


**Property lists** (plists) allow associating key--value pairs with symbols. In Common Lisp, \texttt{get} retrieves a property value and \texttt{setf} with \texttt{get} assigns one. \texttt{PutProp} is the traditional name for assigning properties.
\begin{itemize}
  \item \texttt{(putprop symbol value property)} --- assigns a property (traditional)
  \item \texttt{(setf (get 'symbol 'property) value)} --- Common Lisp equivalent
  \item \texttt{(get 'symbol 'property)} --- retrieves the property value
\end{itemize}

</div>




```lisp
;; Using setf with get (Common Lisp style)
(setf (get 'person 'name) 'Alice)
(setf (get 'person 'age) 25)
(setf (get 'person 'city) 'Dhaka)

(get 'person 'name)
(get 'person 'age)
(get 'person 'city)

;; Using traditional putprop style
(defun putprop (sym val prop)
  (setf (get sym prop) val))

(putprop 'book 'ai-intro 'title)
(putprop 'book 'russell 'author)
(get 'book 'title)
(get 'book 'author)
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 PutProp Function</strong>


\begin{itemize}
  \item After \texttt{(setf (get 'person 'name) 'Alice)}:
  \texttt{(get 'person 'name)} $\rightarrow$ \texttt{ALICE}
  \item After \texttt{(putprop 'book 'ai-intro 'title)}:
  \texttt{(get 'book 'title)} $\rightarrow$ \texttt{AI-INTRO}
  \item Properties can be removed with \texttt{(remprop symbol property)}.
\end{itemize}

</div>


