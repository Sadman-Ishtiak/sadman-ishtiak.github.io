---
title: "Prolog Programming: Introduction"
date: 2026-10-20 00:00:00 +0600
categories: [Artificial Intelligence, Academic Notes]
tags: [prolog, logic-programming, lab]
description: "Facts, rules, queries, arithmetic, and recursion in Prolog."
excerpt: "Facts, rules, queries, arithmetic, and recursion in Prolog."
math: true
---

{% raw %}
# Introduction to Prolog

## What Is Prolog?

Prolog (short for **PROGRAMMING IN LOGIC**) is a declarative programming language based on first-order logic. Unlike imperative languages (C, Java, Python) where the programmer specifies *how* to compute a result, Prolog focuses on *what* the result should be. The programmer declares facts and rules, and Prolog’s built-in inference engine finds the answer automatically.

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Prolog

**PROLOG** is a logic programming language in which programs are expressed as a set of facts and rules, and computation is initiated by running a query. Prolog uses backward chaining with unification to find all solutions that satisfy the query.

</div>

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Declarative Programming

**DECLARATIVE PROGRAMMING** is a programming paradigm that expresses the logic of a computation without describing its control flow. The programmer states *what* is true; the language’s execution mechanism determines *how* to derive the answer.

</div>

Prolog is restricted to **HORN CLAUSES** – a subset of first-order logic where each clause has at most one positive literal. This restriction guarantees efficient, goal-directed inference.

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Horn Clause

A **HORN CLAUSE** is a logical clause with at most one positive literal (the head) and zero or more negative literals (the body). In Prolog syntax: `Head :- Body.` A clause with no body is a fact; a clause with a body is a rule.

</div>

<figure>
<img src="/assets/images/ai-book/figures/book-014-p2.png" alt="Prolog belongs to the logic programming sub-branch of the declarative paradigm." />
<figcaption>Prolog belongs to the logic programming sub-branch of the declarative paradigm.</figcaption>
</figure>

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Prolog in Practice

Prolog is well-suited for:

- **KNOWLEDGE-BASED SYSTEMS** – expert systems, rule-based reasoning.

- **NATURAL LANGUAGE PROCESSING** – parsing with definite clause grammars.

- **SEARCH AND PLANNING** – state-space search, constraint satisfaction.

- **DATABASE QUERYING** – logical queries over relational data.

Popular Prolog implementations include SWI-Prolog, GNU Prolog, and SICStus Prolog.

</div>

## Facts and Rules

A Prolog program consists of **CLAUSES**. There are two types: **FACTS** (unconditionally true) and **RULES** (conditionally true).

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Facts and Rules

A **FACT** is a clause with an empty body; it states something that is always true. Syntax: `predicate(arguments).`

A **RULE** has a head and a body separated by `:-`. It states: "Head is true if Body is true." Syntax: `Head :- Body.`

The **HEAD** is a single goal. The **BODY** contains one or more goals separated by commas (conjunction, “and”) or semicolons (disjunction, “or”).

</div>

```prolog
% Facts
cat(tom).
dog(pluto).
likes(mary, pizza).
likes(john, mary).

% Rule with conjunction (AND)
friend(X, Y) :- likes(X, Z), likes(Y, Z).

% Rule with disjunction (OR)
warm(X) :- cat(X); dog(X).
```

The comma `,` between goals means **CONJUNCTION** – all goals must succeed. The semicolon `;` means **DISJUNCTION** – at least one goal must succeed. A rule can be read logically:

> `friend(X, Y) :- likes(X, Z), likes(Y, Z).`  
> “X is a friend of Y if X likes Z and Y like the same Z.”

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Facts and Rules in Action

Program:

```prolog
likes(ali, football).
likes(bob, football).
likes(ali, chess).
friends(X, Y) :- likes(X, Z), likes(Y, Z).
```

Query: `friends(ali, bob).` succeeds (both like football).  
Query: `friends(ali, X).` produces `X = bob`.

</div>

## Running Queries

Once facts and rules are loaded into Prolog, we ask questions using **QUERIES**. A query is a goal (or conjunction of goals) that Prolog attempts to satisfy.

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Query

A **QUERY** (or goal) is a question the user asks the Prolog system. Prolog uses backward chaining to find all bindings that make the query true. Queries are entered at the `?–` prompt in SWI-Prolog.

</div>

### SWI-Prolog Workflow

1.  Write Prolog code in a file (e.g., `family.pl`).

2.  Load the file: `?- [family].`

3.  Enter queries: `?- parentof(amy, bruce).`

4.  Prolog responds with `true`. or `false`.

5.  For variables, type `;` to see more solutions.

```prolog
% Load a file
?- [family].

% Query with a constant
?- female(amy).
true.

% Query with a variable
?- female(X).
X = amy ;
X = johnette.

% Conjunction query
?- parentof(amy, X), male(X).
X = anthony ;
X = bruce.
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Running Queries

Assume the family relationships from the next section are loaded.  
Query: `?- siblingof(X, Y).`  
Output: `X = johnette, Y = anthony ; X = johnette, Y = bruce ; ...` Press `;` to cycle through all solutions.  
Press `Enter` to stop.  
Press `a` (SWI-Prolog) to see all solutions at once.

</div>

## Simple Programs

### Family Relationships

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Family Relationships

Family relationship programs model kinship using facts (e.g., `parentof/2`, `male/1`, `female/1`) and rules (e.g., `siblingof/2`, `brotherof/2`). The rules derive new relationships from the base facts.

</div>

We model a family using facts for `female/1`, `male/1`, and `parentof/2`. Rules define `siblingof/2` and `brotherof/2`.

```prolog
female(amy).
female(johnette).
male(anthony).
male(bruce).
male(ogden).
parentof(amy, johnette).
parentof(amy, anthony).
parentof(amy, bruce).
parentof(ogden, johnette).
parentof(ogden, anthony).
parentof(ogden, bruce).

siblingof(X, Y) :- parentof(Z, X), parentof(Z, Y).
brotherof(X, Y) :- parentof(Z, X), male(X), parentof(Z, Y).
```

**Explanation:** `siblingof(X, Y)` is true if there exists a parent Z such that Z is a parent of both X and Y. `brotherof(X, Y)` adds the condition that X is male.

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Family Relationships

Query:  
`?- siblingof(johnette, anthony).`

Output:  
`true.`

Query:  
`?- brotherof(bruce, johnette).`

Output:  
`true.`

Query:  
`?- siblingof(X, Y).`

Output:  
`X = johnette, Y = anthony ; X = johnette, Y = bruce ;` `X = anthony, Y = johnette ; X = anthony, Y = bruce ; ...`

</div>

### Printing a List of Items

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Loop-over-Failure Pattern

The **LOOP-OVER-FAILURE** pattern uses the built-in `fail/0` predicate to force backtracking. Combined with side-effect predicates (`write/1`, `nl/0`), it iterates over all solutions to a goal and performs an action for each one before eventually failing.

</div>

The fail predicate forces backtracking, and combined with `write/1` and `nl/0`, it produces a loop-over-failure pattern that prints all matching items.

```prolog
item(tshirt).
item(pant).
item(caps).
item(shirt).
item(shoe).
item(sunglass).

products :- item(X), write(X), nl, fail.
```

**Explanation:** `products` first binds X to `tshirt`, writes it, then `fail` forces backtracking. Prolog backtracks to `item(X)` and binds X to the next item. This repeats until all items are exhausted, then the rule fails silently.

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Printing Items

Query: `?- products.`  
Output:

```prolog
tshirt
pant
caps
shirt
shoe
sunglass
false.
```

The `false.` at the end is normal – it signals that Prolog exhausted all alternatives.

</div>

### Maximum of Two Numbers

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Comparison Operators in Prolog

Prolog provides arithmetic comparison operators (`>`, `<`, `>=`, `=<`, `=:=`, `=̄`) that evaluate both sides and compare the numeric results. They succeed or fail based on the comparison, and both arguments must be fully instantiated (ground) at evaluation time.

</div>

Comparison operators (`>=`, `>`) determine which argument is larger.

```prolog
max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- Y > X.
```

**Explanation:** Two rules define `max/3`. The first rule succeeds if X is greater than or equal to Y, unifying the third argument with X. The second rule handles the case where Y is greater than X.

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Maximum of Two Numbers

Query:  
`?- max(10, 7, M).`

Output:  
`M = 10.`

Query:  
`?- max(3, 8, M).`

Output:  
`M = 8.`

Query:  
`?- max(5, 5, M).`

Output:  
`M = 5.`

</div>

### GPA Lookup

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Interactive I/O Predicates

Prolog’s `read/1` reads a term from the current input stream (terminated by a period), `write/1` outputs a term, and `nl/0` writes a newline. These predicates enable simple interactive programs that prompt the user and display results.

</div>

This program demonstrates interactive input/output using `read/1`, `write/1`, and `nl/0`.

```prolog
gpa(ashik, 3.45).
gpa(rukon, 3.50).
gpa(moni, 3.25).
gpa(zaman, 3.35).
gpa(abid, 3.55).

result :- write('Enter student name:'),
          read(X), gpa(X, Y), nl,
          write('GPA is '),
          write(Y).
```

**Explanation:** The `result` predicate prompts the user, reads a name, looks up the GPA from the facts, and prints it. If the name is not found, Prolog reports `false`.

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

GPA Lookup

Query: `?- result.`  
Output:

```prolog
Enter student name: ashik.
GPA is 3.45
true.
```

The period `.` after the entered name is required (Prolog expects a term terminated by a period).

</div>

### Student-Professor Relationships

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Joining Facts via Shared Variables

In Prolog, two goals share a variable to express a relationship across predicates. For example, `teaches(X, Z), studies(Y, Z)` links professors and students who share the same course `Z`. This is equivalent to a SQL join on a common column.

</div>

This program models which students study which courses and which professors teach those courses.

```prolog
studies(tamanna, cse421).
studies(tirana, cse421).
studies(sayem, cse422).
studies(tamanna, cse452).
studies(tamanna, cse423).
teaches(selim_sir, cse452).
teaches(mijan_sir, cse421).
teaches(ujjal_sir, cse423).

professor(X, Y) :- teaches(X, Z), studies(Y, Z).
```

**Explanation:** `professor(X, Y)` is true if X teaches a course Z and Y studies that same course Z. The variable Z unifies both clauses, linking professors to students via shared courses.

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Student-Professor Relationships

Query:  
`?- professor(selim_sir, tamanna).`

Output:  
`true.`

Query:  
`?- professor(X, tamanna).`

Output:  
`X = selim_sir ; X = mijan_sir ; X = ujjal_sir.`

Query:  
`?- professor(selim_sir, Y).`

Output:  
`Y = tamanna.`

</div>

## Arithmetic in Prolog

Prolog uses the `is/2` operator to evaluate arithmetic expressions. Unlike functional languages, `=` does not evaluate expressions; it performs unification only. The `is` predicate forces evaluation of the right-hand side.

### Fibonacci Series

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Recursion in Prolog

A predicate is **RECURSIVE** if it calls itself. A recursive predicate must have one or more **BASE CASES** (non-recursive rules that terminate the recursion) and one or more **RECURSIVE CASES** that reduce the problem toward a base case. Prolog’s stack handles the recursion; deeply recursive calls may overflow.

</div>

The Fibonacci sequence is defined recursively: $F_1 = 1$, $F_2 = 1$, $F_n = F_{n-1} + F_{n-2}$ for $n > 2$.

```prolog
likes(ali, football).
likes(bob, football).
likes(ali, chess).
friends(X, Y) :- likes(X, Z), likes(Y, Z).
```0

**Explanation:** Base cases: `fib(1,1)` and `fib(2,1)`. The recursive rule computes $n-1$ and $n-2$, recurses on both, then sums the results using `is/2`. Without the `N > 2` guard, the recursion would loop indefinitely.

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Fibonacci Series

Query:  
`?- fib(6, F).`

Output:  
`F = 8.`

Explanation:  
The 6th Fibonacci number: 1, 1, 2, 3, 5, **8**.

Query:  
`?- fib(10, F).`

Output:  
`F = 55.`

</div>

### Factorial

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Accumulator Pattern

The **ACCUMULATOR PATTERN** uses an extra argument to carry intermediate results through recursive calls, enabling tail-recursive definitions. While the natural recursion shown below is simpler, an accumulator version would use a helper predicate: `fact(N, F) :- fact(N, 1, F).` with `fact(0, Acc, Acc).` as the base case.

</div>

Factorial is defined as $0! = 1$, $n! = n \times (n-1)!$ for $n > 0$.

```prolog
likes(ali, football).
likes(bob, football).
likes(ali, chess).
friends(X, Y) :- likes(X, Z), likes(Y, Z).
```1

**Explanation:** The base case `fact(0,1)` stops the recursion. The recursive rule decrements N, recurses, then multiplies the result by N. This is a natural recursion (not tail-recursive); each call pushes a stack frame.

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Factorial

Query:  
`?- fact(5, F).`

Output:  
`F = 120.`

Explanation:  
$5! = 5 \times 4 \times 3 \times 2 \times 1 = 120$.

Query:  
`?- fact(0, F).`

Output:  
`F = 1.`

</div>

### GCD and LCM

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Euclidean Algorithm

The **EUCLIDEAN ALGORITHM** computes the greatest common divisor of two numbers: $\gcd(X, 0) = X$, $\gcd(X, Y) = \gcd(Y, X \bmod Y)$. Prolog implements it naturally via recursion with `is/2` for the modulo operation.

</div>

The GCD uses the Euclidean algorithm: $\gcd(X, 0) = X$, $\gcd(X, Y) = \gcd(Y, X \bmod Y)$. LCM is derived from GCD: $\operatorname{lcm}(X, Y) = (X \times Y) / \gcd(X, Y)$.

```prolog
likes(ali, football).
likes(bob, football).
likes(ali, chess).
friends(X, Y) :- likes(X, Z), likes(Y, Z).
```2

**Explanation:** The base case states that $\gcd(X, 0) = X$. The recursive rule computes $X \bmod Y$ and recurses with $(Y, R)$. The `lcm` rule first computes the GCD, then uses the formula to find the LCM.

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

GCD and LCM

Query:  
`?- gcd(12, 8, D).`

Output:  
`D = 4.`

Query:  
`?- lcm(12, 8, M).`

Output:  
`M = 24.`

Query:  
`?- gcd(100, 35, D).`

Output:  
`D = 5.`

</div>

### Cube of a Number

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Read-Process Loop

A **READ-PROCESS LOOP** repeatedly reads input, processes it, and loops back for more input. A sentinel value (e.g., `stop`) terminates the loop. The cut (`!`) in the sentinel clause prevents backtracking into the processing clause.

</div>

This program demonstrates a read-process loop: it repeatedly reads numbers, computes their cubes, and continues until the user types `stop`.

```prolog
likes(ali, football).
likes(bob, football).
likes(ali, chess).
friends(X, Y) :- likes(X, Z), likes(Y, Z).
```3

**Explanation:** `cube` prompts the user and reads a value. `process(stop)` uses the cut (`!`) to terminate when the user types `stop`. Otherwise, `process(N)` computes $N^3$, prints it, and calls `cube` again to continue the loop.

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Cube of a Number

Query: `?- cube.`  
Output:

```prolog
likes(ali, football).
likes(bob, football).
likes(ali, chess).
friends(X, Y) :- likes(X, Z), likes(Y, Z).
```4

The program loops until `stop` is entered.

</div>

## Satisfying a List of Goals

A predicate can be defined by multiple rules, each representing an alternative way to satisfy it. Prolog tries each rule in order; if one fails, it backtracks to the next.

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Multiple Rules (Disjunction by Backtracking)

When a predicate has multiple clauses, Prolog tries the first clause. If it fails (or the user requests another solution), Prolog backtracks and tries the next clause. This provides implicit disjunction without using the `;` operator.

</div>

```prolog
likes(ali, football).
likes(bob, football).
likes(ali, chess).
friends(X, Y) :- likes(X, Z), likes(Y, Z).
```5

**Explanation:** `dark/1` succeeds if the argument is black, brown, or gray. Each rule represents an alternative condition. The query `?- dark(X).` enumerates all animals that satisfy at least one of the three colour conditions.

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Satisfying a List of Goals

Query:  
`?- dark(X).`

Output:  
`X = cat ; X = dog ; X = bear ; X = elephant.`

Explanation:  
cat and dog are black; bear is brown; elephant is gray.

Query:  
`?- dark(bear).`

Output:  
`true.`

Query:  
`?- dark(X), big(X).`

Output:  
`X = bear ; X = elephant.`

</div>

## Cuts and Control

The **CUT** (`!`) is a built-in predicate that prunes backtracking. It commits Prolog to the choices made so far. Once a cut is encountered, Prolog cannot backtrack past it.

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Cut (!/0)

The **CUT** (`!`) is a goal that always succeeds but prevents backtracking across it. Specifically, it freezes all choices made before the cut in the current clause and in the goal that called this predicate.

</div>

### Uses of the Cut

1.  **Confirming a match:** Once a condition is satisfied, stop searching for alternatives.

2.  **Cut-fail combination:** Used to define negation or to terminate loops.

3.  **Preventing unwanted backtracking:** Improve efficiency by pruning impossible branches.

```prolog
likes(ali, football).
likes(bob, football).
likes(ali, chess).
friends(X, Y) :- likes(X, Z), likes(Y, Z).
```6

**Explanation:** In the `max/3` with cut, if $X \ge Y$ succeeds, the cut prevents trying the second rule. If $X \ge Y$ fails, Prolog backtracks to the second rule. The anonymous variable in the second rule’s first argument (`_`) matches any value.

The cut-fail combination defines negation by elimination: if the goal P succeeds, cut then fail causes the entire call to fail. If P fails, the second clause succeeds.

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Cuts and Control

Query:  
`?- max(7, 5, M).`

Output:  
`M = 7.`

How it works:  
$7 \ge 5$ succeeds, the cut prunes the second rule, $M = 7$.

Query:  
`?- not(member(3, [1,2,4])).`

Output:  
`true.`

Query:  
`?- not(member(2, [1,2,4])).`

Output:  
`false.`

</div>

<div markdown="1" style="border-left:4px solid #ef6c00;background:#fff3e0;padding:14px 18px;margin:18px 0;border-radius:6px;">

Warning: Green vs. Red Cuts

A **GREEN CUT** only improves efficiency; removing it does not change the program’s answers. A **RED CUT** changes the program’s logical meaning; removing it produces incorrect answers. Always prefer green cuts and use red cuts only when fully understanding the control flow.

</div>

<div markdown="1" style="border-left:4px solid #0277bd;background:#e1f5fe;padding:14px 18px;margin:18px 0;border-radius:6px;">

Cut-Fail Combination

The pattern `!, fail` is a common Prolog idiom. The cut commits to the current branch, and `fail` forces failure. Because backtracking is blocked by the cut, the predicate cannot try alternative clauses. This effectively defines "not provable".

</div>

{% endraw %}
