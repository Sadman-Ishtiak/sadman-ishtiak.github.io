---
title: "Appendix B: Exam Question Archive"
date: 2026-10-27 00:00:00 +0600
categories: [Artificial Intelligence, Academic Notes]
tags: [exam, questions, archive]
description: "Past final and lab exam questions with solutions."
excerpt: "Past final and lab exam questions with solutions."
math: true
---

{% raw %}
# Question Archive

This appendix collects past examination papers for the Artificial Intelligence course (CSE 405) and the Lab Examination (CSE 406). Each question is followed by a model solution.

## Final Exam 2022 (Session 2018–2019)

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 1

a\) Define in your own words: (i) intelligence (ii) artificial intelligence.  
b) Is AI a science, or is it engineering? Or neither or both? Explain.  
c) Write down present and future scope of AI.  
d) What are the various agents for artificial intelligence?

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 1

**a) (i) Intelligence:** The ability to acquire, understand, and apply knowledge, reason logically, adapt to new situations, and learn from experience to achieve goals in an environment.

**(ii) Artificial Intelligence:** The branch of computer science concerned with building systems that exhibit intelligent behaviour – perceiving, reasoning, learning, and acting autonomously.

**b)** AI is **both** science and engineering. As a **science**, AI studies the nature of intelligence and formulates theories of how intelligent behaviour can be produced. As an **engineering** discipline, AI builds practical systems – expert systems, robots, search engines – that solve real-world problems.

**c) Present scope:** Natural language processing, computer vision, speech recognition, autonomous vehicles, game playing, recommendation systems. **Future scope:** Artificial general intelligence (AGI), AI-driven scientific discovery, fully autonomous systems, human–AI collaboration, emotional AI.

**d)** The five main types of intelligent agents are: (1) Simple Reflex Agent, (2) Model-Based Reflex Agent, (3) Goal-Based Agent, (4) Utility-Based Agent, and (5) Learning Agent.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 2

a\) What are the importance of Knowledge? What are the different types of knowledge? Explain them.  
b) What are drawbacks of propositional logic?  
c) What are the application areas of Machine learning? What are the relationship between Machine learning and Artificial Intelligence?  
d) What is Knowledge Manipulation? Why it is important?

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 2

**a) Importance of Knowledge:** Knowledge enables reasoning, decision-making, planning, and problem-solving in intelligent systems. Without knowledge, an agent cannot act intelligently.

**Types of Knowledge:**

- **Declarative knowledge** – facts and statements about the world (e.g., “Dhaka is the capital of Bangladesh”).

- **Procedural knowledge** – how to perform tasks (e.g., steps to solve a puzzle).

- **Heuristic knowledge** – rules of thumb from experience (e.g., “if the engine is hot, check coolant”).

- **Structural knowledge** – relationships between concepts (e.g., hierarchy of categories).

- **Episodic knowledge** – knowledge of specific events or experiences.

**b)** Drawbacks of propositional logic:

- No **quantifiers** (cannot express “all” or “there exists”).

- No **variables** or **relations** – only atomic True/False symbols.

- **Combinatorial explosion**: representing complex domains requires too many propositions.

- Cannot represent **general rules** compactly (e.g., “all humans are mortal” requires one proposition per human).

**c) Application areas of ML:** Classification (spam detection), regression (price prediction), clustering (customer segmentation), recommendation, anomaly detection, natural language processing, computer vision. **Relationship:** Machine Learning is a **subfield** of AI. AI is the broader goal of creating intelligent systems; ML provides one approach – learning from data – to achieve that goal.

**d) Knowledge Manipulation:** The processes of acquiring, organising, storing, updating, retrieving, and reasoning with knowledge in a knowledge-based system. It is important because it allows the system to maintain a consistent, current knowledge base and derive new conclusions from existing knowledge.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 3

a\) What is FOPL?  
b) How the statement “All employees of the AI software company are programmers” might be written in FOPL.  
c) What is proposition? Give some examples of simple and compound proposition.  
d) Show the difference between propositional and FOPL.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 3

**a)** **FOPL** (First-Order Predicate Logic) is a formal logical system that extends propositional logic by adding predicates (relations), variables, and quantifiers ($\forall$, $\exists$). It allows representing objects, their properties, and relationships between them.

**b)** In FOPL:

```text
	forall x (Employee(x) & works_for(x, ai_software_co) -> Programmer(x))
```

Alternatively with predicates: $\forall x \big( \text{Employee}(x) \land \text{WorksFor}(x, \text{AISoftwareCo}) \to \text{Programmer}(x) \big)$.

**c)** A **proposition** is a declarative statement that is either true or false (but not both).

- *Simple proposition:* “It is raining.” “The sky is blue.”

- *Compound proposition:* “It is raining AND it is cold.” “If it rains THEN the ground will be wet.”

**d)**

</div>

<div class="center">

| **Feature**    | **Propositional Logic**       | **First-Order Predicate Logic**                    |
|:---------------|:------------------------------|:---------------------------------------------------|
| Basic unit     | Atomic propositions (P, Q, R) | Predicates with arguments                          |
| Quantifiers    | None                          | $\forall$ (universal), $\exists$ (existential)     |
| Variables      | Not supported                 | Supported                                          |
| Relations      | Implicit only                 | Explicit via predicates                            |
| Expressiveness | Limited                       | Highly expressive                                  |
| Example        | $P \land Q \to R$             | $\forall x (\text{Human}(x) \to \text{Mortal}(x))$ |

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 4

a\) What do you mean by TMS? Explain TMS with a suitable block diagram.  
b) What is Knowledge? What are the functions of the knowledge engineers?  
c) Draw and describe the basic structure of rule based expert system.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 4

**a)** **TMS** (Truth Maintenance System) is a reasoning system that maintains the consistency of a knowledge base by tracking dependencies between beliefs. When a belief becomes invalid (contradiction), TMS identifies the dependent beliefs and updates them.

</div>

Block diagram of TMS:

        +-------------+       +-------------+
        |  Problem    |<----->|    TMS      |
        |  Solver     |       | (Dependency |
        | (Inference  |       |  Network)   |
        |  Engine)    |       |             |
        +------+------+       +------+------+
               |                     |
        +------v------+       +------v------+
        | Knowledge   |       |  Belief    |
        |  Base       |       |  Database  |
        +-------------+       +-------------+

**b)** **Knowledge** is justified true belief – facts, information, and skills acquired through experience or education. In AI, it is the encoded information used by intelligent systems.

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 4 (cont.)

**Functions of Knowledge Engineers:**

- Acquire knowledge from domain experts

- Represent knowledge in a suitable formalism (rules, frames, logic)

- Build and maintain the knowledge base

- Design the inference engine

- Validate and test the system

- Refine knowledge based on system performance

**c)** Structure of a rule-based expert system:

</div>

        +------------------+
        |    User          |
        +--------+---------+
                 |
        +--------v---------+
        |  User Interface  |
        +--------+---------+
                 |
        +--------v---------+
        | Inference Engine |<----+
        | (Forward/Backward|     |
        |  Chaining)       |     |
        +--------+---------+     |
                 |               |
        +--------v---------+     |
        |  Working Memory  |     |
        |  (Fact Database) |     |
        +--------+---------+     |
                 |               |
        +--------v---------+     |
        | Knowledge Base   +-----+
        | (Rule Base:      |
        |  IF-THEN rules)  |
        +------------------+

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 4 (cont.)

The **Inference Engine** applies rules from the Knowledge Base to facts in the Working Memory. The **User Interface** allows users to query the system and receive explanations. The system may use **forward chaining** (data-driven) or **backward chaining** (goal-driven) reasoning.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 5

a\) What is CD? Explain different types of ontological building blocks.  
b) What is frame structure? Where we shall use this structure? Give an example of frame structure.  
c) What do you mean by problem solution? Explain the structure of a state space.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 5

**a)** **CD** (Conceptual Dependency) is a knowledge representation formalism developed by Roger Schank. It represents the meaning of natural language sentences using a small set of primitive actions.

**Ontological Building Blocks (CD Primitives):**

- **ATRANS** – transfer of possession (give, take)

- **PTRANS** – physical transfer of location (go, move)

- **MTRANS** – transfer of mental information (tell, inform)

- **MBUILD** – building new information from old (decide, conclude)

- **INGEST** – taking something into the body (eat, drink)

- **EXPEL** – expelling from the body (spit, cry)

- **PROPEL** – applying force (push, pull)

- **MOVE** – moving a body part (kick, raise arm)

- **GRASP** – grabbing an object (hold, pick up)

- **ATTEND** – focusing a sense organ (look, listen)

- **SPEAK** – producing sound (say, shout)

**b)** A **frame structure** (Minsky, 1975) is a data structure for representing stereotyped situations. It consists of a collection of **slots** with **fillers** (values). Each slot can have default values, constraints, and procedures attached.

**Uses:** Object-oriented knowledge representation, natural language understanding, computer vision (scene interpretation), common-sense reasoning.

</div>

**Example:** A frame for “Student”:

    Frame: STUDENT
      Slots:
        Name:          (default: unknown)
        ID:            (range: integer)
        Department:    (default: CSE)
        Year:          (one-of: 1st, 2nd, 3rd, 4th)
        CGPA:          (range: 0.0 -- 4.0)
        Advisor:       (type: PROFESSOR)
        Enrolled-in:   (set-of COURSE)

**c)** A **problem solution** is a sequence of actions that transforms an initial state into a goal state. In AI, finding a solution is the task of a problem-solving agent.

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 5 (cont.)

**Structure of a State Space:**

- **States** – all possible configurations of the problem

- **Initial state** – the starting configuration

- **Goal state(s)** – the desired configuration(s)

- **Actions** – operators that transform one state to another

- **Transition model** – describes the result of applying an action to a state

- **Path** – a sequence of states connected by actions from initial to goal

- **Path cost** – the cost associated with each path

The state space forms a **graph** where nodes are states and edges are actions. Searching this graph yields a solution path.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 6

a\) Explain Heuristics Information with example.  
b) Describe Hill Climbing searching method with algorithm.  
c) What is Agent? Explain the structure of Agent.  
d) Explain Model based Reflex Agent.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 6

**a)** **Heuristic Information** is domain-specific knowledge used to guide search efficiently. It provides an estimate of the desirability of each state, helping the search algorithm focus on promising paths.

**Example:** In the 8-puzzle, the Manhattan distance heuristic $h(n)$ = sum of the horizontal and vertical distances of each tile from its goal position. This heuristic is **admissible** (never overestimates) and guides A\* search toward the solution faster than blind search.

**b)** **Hill Climbing** is a local search algorithm that continuously moves toward a state of higher value (lower cost) until a peak is reached.

```prolog
		Algorithm: Hill_Climbing(problem)
		current <- Initial_State(problem)
		loop do
		neighbor <- highest-valued successor of current
		if Value(neighbor) <= Value(current) then
		return current
		current <- neighbor
		end loop
	
```

**Problems:** Local maxima, plateaus, ridges.

**c)** An **agent** is anything that can perceive its environment through **sensors** and act upon that environment through **actuators**.

**Structure:** $$\text{Agent} = \text{Architecture} + \text{Agent Program}$$

The **agent function** maps percept sequences to actions: $$f: \mathcal{P}^* \to \mathcal{A}$$

**d)** A **Model-Based Reflex Agent** maintains an **internal state** that tracks the part of the world it cannot observe. It uses a **model** of how the world evolves independently of the agent and how the agent’s actions affect the world. When a percept arrives, the agent updates its internal state using the model, then selects an action based on condition–action rules that consider both the current percept and the internal state.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 7

a\) What is Knowledge Acquisition? Explain different types of learning with examples.  
b) Explain the factors that affect the learning performance.  
c) What are the differences between informed and uninformed search?  
d) What is Depth-First Search? Explain the algorithm with figure.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 7

**a)** **Knowledge Acquisition** is the process of extracting, structuring, and organising knowledge from human experts, documents, or data sources into a knowledge base. It is often called the “bottleneck” of expert system development.

**Types of Learning:**

- **Rote learning** – memorising facts without inference (e.g., learning multiplication tables)

- **Learning by instruction** – acquiring knowledge from a teacher (e.g., reading a textbook)

- **Learning by deduction** – deriving new facts from existing ones using logic (e.g., proving theorems)

- **Learning by analogy** – transferring knowledge from a familiar domain to a new one (e.g., understanding atom structure via solar system analogy)

- **Learning by induction** – generalising rules from examples (e.g., decision tree learning)

**b)** Factors affecting learning performance:

- **Quality and quantity** of training data

- **Representation** of knowledge (how knowledge is encoded)

- **Feedback** (supervised vs. unsupervised vs. reinforcement)

- **Prior knowledge** available to the learner

- **Computational resources** (time, memory)

- **Complexity** of the target concept

- **Noise** in the training data

</div>

<div class="center">

| **Criterion** | **Uninformed Search**          | **Informed Search**                  |
|:--------------|:-------------------------------|:-------------------------------------|
| Heuristic     | No heuristic used              | Uses heuristic function $h(n)$       |
| Efficiency    | Generally less efficient       | More efficient                       |
| Completeness  | Varies (BFS complete, DFS not) | Usually complete with admissible $h$ |
| Optimality    | Only UCS is optimal            | A\* is optimal with admissible $h$   |
| Examples      | BFS, DFS, UCS, IDS             | A\*, Greedy Best-First, IDA$^*$      |

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 7 (cont.)

**d)** **Depth-First Search (DFS)** explores a path from the root to the deepest node before backtracking. It uses a LIFO stack to manage the frontier.

```prolog
		Algorithm: DFS(problem)
		node <- Node(Initial_State(problem))
		frontier <- Stack containing node
		explored <- empty set
		loop do
		if frontier is empty then return failure
		node <- Pop(frontier)
		if Goal_Test(problem, State(node)) then return node
		add State(node) to explored
		for each action in Actions(problem, State(node)) do
		child <- Child_Node(problem, node, action)
		if child not in frontier and not in explored then
		Push(child, frontier)
	
```

DFS has space complexity $O(bm)$ where $b$ is branching factor and $m$ is maximum depth. It is not guaranteed to find the optimal solution and may get stuck in infinite loops (mitigated by graph search with an explored set).

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 8

Write a short note on the following topics:  
i) Natural Language Processing  
ii) Genetic Algorithm  
iii) Inference and Learning in Intelligent system

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 8

**i) Natural Language Processing (NLP):** NLP is the branch of AI concerned with enabling computers to understand, interpret, and generate human language. Key tasks include: **tokenisation**, **part-of-speech tagging**, **named entity recognition**, **sentiment analysis**, **machine translation**, and **question answering**. Modern NLP relies heavily on deep learning models (transformers such as BERT, GPT). Applications include chatbots, virtual assistants, language translation, and text summarisation.

**ii) Genetic Algorithm (GA):** GA is an evolutionary search and optimisation technique inspired by natural selection. It operates on a **population** of candidate solutions encoded as **chromosomes**. The main steps are: (1) **Selection** – choose fitter individuals with higher probability, (2) **Crossover** – combine two parent chromosomes to create offspring, (3) **Mutation** – randomly alter genes to maintain diversity, (4) **Evaluation** – compute **fitness** of each individual. This cycle repeats until a satisfactory solution is found. GAs are used for optimisation problems, scheduling, and feature selection.

**iii) Inference and Learning in Intelligent Systems:** **Inference** refers to deriving new conclusions from known facts using reasoning mechanisms (forward chaining, backward chaining, resolution). **Learning** is the process of acquiring new knowledge or skills from experience. In intelligent systems, inference and learning work together: learning provides new knowledge, and inference applies it to solve problems. A learning element improves system performance over time, while the inference engine uses the accumulated knowledge for reasoning. Key approaches include logical inference, probabilistic inference (Bayesian networks), and statistical learning (neural networks, decision trees).

</div>

## Lab Examination (Prolog + LISP Problems)

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Prolog Problem 1

Write a Prolog program to find the GPA of a student.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – Prolog Problem 1

We define facts for student grades and a rule to compute GPA by averaging grade points.

```prolog
		% Facts: student_grade(Student, Subject, GradePoint, Credit)
		student_grade(rahim, ai, 4.0, 3).
		student_grade(rahim, ds, 3.7, 3).
		student_grade(rahim, network, 3.3, 2).
		student_grade(rahim, oop, 4.0, 3).

		% Rule to compute GPA
		gpa(Student, GPA) :-
		findall(GP * C, student_grade(Student, _, GP, C), Products),
		findall(C, student_grade(Student, _, _, C), Credits),
		sum_list(Products, TotalPoints),
		sum_list(Credits, TotalCredits),
		GPA is TotalPoints / TotalCredits.
	
```

Query: `gpa(rahim, G).` returns `G = 3.72727...`

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Prolog Problem 2

A Prolog program to find nth number of Fibonacci series.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – Prolog Problem 2

```prolog
		fib(0, 0).
		fib(1, 1).
		fib(N, F) :-
		N > 1,
		N1 is N - 1,
		N2 is N - 2,
		fib(N1, F1),
		fib(N2, F2),
		F is F1 + F2.
	
```

Query: `fib(7, F).` returns `F = 13`.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Prolog Problem 3

A Prolog program to calculate factorial of a number.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – Prolog Problem 3

```prolog
		factorial(0, 1).
		factorial(N, F) :-
		N > 0,
		N1 is N - 1,
		factorial(N1, F1),
		F is N * F1.
	
```

Query: `factorial(5, F).` returns `F = 120`.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Prolog Problem 4

A Prolog program to find GCD and LCM of two numbers.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – Prolog Problem 4

```prolog
		% GCD using Euclidean algorithm
		gcd(X, 0, X) :- X > 0.
		gcd(0, Y, Y) :- Y > 0.
		gcd(X, Y, G) :-
		X > 0, Y > 0,
		Z is X mod Y,
		gcd(Y, Z, G).

		% LCM using formula: LCM(A,B) = |A*B| / GCD(A,B)
		lcm(A, B, L) :-
		gcd(A, B, G),
		L is abs(A * B) // G.
	
```

Query: `gcd(12, 18, G).` returns `G = 6`.  
Query: `lcm(12, 18, L).` returns `L = 36`.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Prolog Problem 5

Write a Prolog program for a cyclic graph that will find path between two vertices in a cyclic graph.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – Prolog Problem 5

We use a visited list to avoid infinite loops in cyclic graphs.

```prolog
		% Directed edges with cycles
		edge(a, b). edge(b, c). edge(c, a).
		edge(b, d). edge(d, e).

		% Path with visited list to prevent cycles
		path(X, Y, Visited, [X, Y]) :-
		edge(X, Y),
		\+ member(Y, Visited).

		path(X, Y, Visited, [X | Path]) :-
		edge(X, Z),
		\+ member(Z, Visited),
		path(Z, Y, [Z | Visited], Path).

		% Wrapper predicate
		find_path(X, Y, Path) :-
		path(X, Y, [X], Path).
	
```

Query: `find_path(a, e, P).` returns `P = [a, b, d, e]`.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Prolog Problem 6

Prolog programs for file handling.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – Prolog Problem 6

```prolog
		% Writing to a file
		write_to_file :-
		tell('output.txt'),
		write('Hello, Prolog file handling!'), nl,
		write('This is line 2.'), nl,
		told.

		% Reading from a file
		read_from_file :-
		see('input.txt'),
		read_data,
		seen.

		read_data :-
		read(Line),
		(Line == end_of_file -> true ;
		write(Line), nl,
		read_data).

		% Append to a file
		append_to_file :-
		open('log.txt', append, Stream),
		write(Stream, 'New log entry'), nl,
		close(Stream).
	
```

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Prolog Problem 7

Implement Breadth First Search Algorithm.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – Prolog Problem 7

```prolog
		% Graph edges
		edge(a, b). edge(a, c). edge(b, d).
		edge(b, e). edge(c, f). edge(c, g).

		% BFS using a queue (list)
		bfs(Start, Goal, Path) :-
		bfs([[Start]], Goal, Path).

		bfs([[Goal | Rest] | _], Goal, [Goal | Rest]).
		bfs([CurrentPath | OtherPaths], Goal, Path) :-
		CurrentPath = [Node | _],
		findall([NextNode | CurrentPath],
		(edge(Node, NextNode),
		\+ member(NextNode, CurrentPath)),
		NewPaths),
		append(OtherPaths, NewPaths, AllPaths),
		bfs(AllPaths, Goal, Path).
	
```

Query: `bfs(a, g, P).` returns `P = [g, c, a]` (shortest path from a to g).

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Prolog Problem 8

Implementation of Depth First Search Algorithm.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – Prolog Problem 8

```prolog
		Algorithm: Hill_Climbing(problem)
		current <- Initial_State(problem)
		loop do
		neighbor <- highest-valued successor of current
		if Value(neighbor) <= Value(current) then
		return current
		current <- neighbor
		end loop
	
```0

The only difference from BFS is the order of append: DFS prepends new paths to the frontier (stack discipline), while BFS appends them (queue discipline).

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Prolog Problem 9

Implementation of A\* Search Algorithm.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – Prolog Problem 9

```prolog
		Algorithm: Hill_Climbing(problem)
		current <- Initial_State(problem)
		loop do
		neighbor <- highest-valued successor of current
		if Value(neighbor) <= Value(current) then
		return current
		current <- neighbor
		end loop
	
```1

A\* selects the node with the smallest $f(n) = g(n) + h(n)$ value, where $g(n)$ is the actual cost from start to $n$, and $h(n)$ is the heuristic estimate from $n$ to the goal.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

LISP Problem 10

Write a LISP program for finding the area of a Circle.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – LISP Problem 10

```prolog
		Algorithm: Hill_Climbing(problem)
		current <- Initial_State(problem)
		loop do
		neighbor <- highest-valued successor of current
		if Value(neighbor) <= Value(current) then
		return current
		current <- neighbor
		end loop
	
```2

Test: `(area-circle 5)` returns `78.53981633974483`.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

LISP Problem 11

Write a LISP program for finding the area of a Triangle.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – LISP Problem 11

```prolog
		Algorithm: Hill_Climbing(problem)
		current <- Initial_State(problem)
		loop do
		neighbor <- highest-valued successor of current
		if Value(neighbor) <= Value(current) then
		return current
		current <- neighbor
		end loop
	
```3

Test: `(area-triangle 10 5)` returns `25.0`.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

LISP Problem 12

Write a LISP program for finding the average and sum of some numbers.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – LISP Problem 12

```prolog
		Algorithm: Hill_Climbing(problem)
		current <- Initial_State(problem)
		loop do
		neighbor <- highest-valued successor of current
		if Value(neighbor) <= Value(current) then
		return current
		current <- neighbor
		end loop
	
```4

Test: `(sum-list ’(10 20 30 40))` returns `100`.  
Test: `(average ’(10 20 30 40))` returns `25`.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

LISP Problem 13

Write a LISP program for declaring an Array and access the elements of the array.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – LISP Problem 13

```prolog
		Algorithm: Hill_Climbing(problem)
		current <- Initial_State(problem)
		loop do
		neighbor <- highest-valued successor of current
		if Value(neighbor) <= Value(current) then
		return current
		current <- neighbor
		end loop
	
```5

Test: `(access-array my-array 1 1)` returns `5`.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

LISP Problem 14

Write a LISP program for finding the outputs of all basic LIST manipulation functions.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – LISP Problem 14

```prolog
		Algorithm: Hill_Climbing(problem)
		current <- Initial_State(problem)
		loop do
		neighbor <- highest-valued successor of current
		if Value(neighbor) <= Value(current) then
		return current
		current <- neighbor
		end loop
	
```6

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

LISP Problem 15

Write a LISP program for finding the outputs of all additional LIST manipulation functions.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – LISP Problem 15

```prolog
		Algorithm: Hill_Climbing(problem)
		current <- Initial_State(problem)
		loop do
		neighbor <- highest-valued successor of current
		if Value(neighbor) <= Value(current) then
		return current
		current <- neighbor
		end loop
	
```7

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

LISP Problem 16

Write a LISP program for finding the maximum and minimum of some numbers.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – LISP Problem 16

```prolog
		Algorithm: Hill_Climbing(problem)
		current <- Initial_State(problem)
		loop do
		neighbor <- highest-valued successor of current
		if Value(neighbor) <= Value(current) then
		return current
		current <- neighbor
		end loop
	
```8

Test: `(my-max ’(34 78 12 56 90 23))` returns `90`.  
Test: `(my-min ’(34 78 12 56 90 23))` returns `12`.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

LISP Problem 17

Write a LISP program for finding the outputs of Putprop function.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution – LISP Problem 17

```prolog
		Algorithm: Hill_Climbing(problem)
		current <- Initial_State(problem)
		loop do
		neighbor <- highest-valued successor of current
		if Value(neighbor) <= Value(current) then
		return current
		current <- neighbor
		end loop
	
```9

</div>

Output:

    John's age: 24
    John's height: ("5 ft" "10 inch")
    John's occupation: ENGINEER
    John's company: "Microsoft Corporation"

## Final Exam 2024 (Session 2019–20)

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 1

a\) Suppose you are Robiul Islam working in the Microsoft Corporation as an OS engineer. Your age is 24, height 5 feet 10 inch. You have completed your education from CSE department of Jatiya Kabi Kazi Nazrul Islam University, Bangladesh which is governed by UGC and under education ministry. Your section is under Research and Development of Microsoft Corporation. Bob is another expert who works under your guidance. CSE department is under Faculty of Science and Engineering. You run Mercedes Benz car and like to go for sight seeing on weekend. Create an Associative Network on the given data above.  
b) Suppose you are planning to develop an AI driven Robot which will collect the waste from rivers or canals and automatically puts the garbage in its container. Write a script structure about of how you will do that.  
c) Current world is now experiencing with the new inventions of AI. Most of the AI research is being done in the developed countries and developing countries are the users of AI. What do you think about the negative impacts of AI based systems on the developing countries?

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 1

**a) Associative Network:** An associative network represents entities as nodes and their relationships as labelled edges.

        [UGC] ------governs----> [Education Ministry]
                                    ^
                                    |
                              [JKKNIU]
                            /         \
                     [CSE Dept] ---> [Faculty of Science & Engineering]
                        |
                  [Robiul Islam]-----works_for---->[Microsoft Corporation]
                  /    |    \                            |
           [age:24] [height:   [education]         [R & D Section]
                     5'10"]       |                     |
                              [CSE, JKKNIU]         [Bob]--works_under-->[Robiul]
                  |
           [owns: Mercedes Benz]--[likes: sight seeing on weekend]

**b) Script Structure for River Waste-Collecting Robot:**

    Script: WASTE-COLLECTION
    Track: River/Canal Cleaning
    Props: Robot, Container, Sensors (camera, sonar),
           Robotic arm, GPS, Waste bin
    Roles: Robot (collector), Waste (object)

    Scene 1: NAVIGATION
      Robot navigates along river bank using GPS + sonar
      IF obstacle detected THEN avoid
      IF waste detected THEN goto Scene 2

    Scene 2: DETECTION
      Camera identifies waste object
      Classify waste type (plastic, metal, organic)
      Calculate grab position

    Scene 3: COLLECTION
      Extend robotic arm toward waste
      GRASP(arm, waste)
      PTRANS(waste, arm -> container)
      INGEST(container, waste)
      IF container full THEN goto Scene 4
      ELSE goto Scene 1

    Scene 4: DISPOSAL
      Navigate to disposal station
      Empty container
      Resume Scene 1

**c) Negative impacts of AI on developing countries:**

- **Job displacement** – automation replaces low-skilled labour, increasing unemployment.

- **Economic dependency** – developing countries become consumers of AI technology from developed nations, widening the digital divide.

- **Brain drain** – AI talent migrates to developed countries.

- **Cultural homogenisation** – AI systems trained on Western data may not respect local languages, customs, or values.

- **Data colonialism** – user data from developing countries is extracted and processed abroad.

- **Lack of regulation** – developing countries may lack legal frameworks to govern AI ethics, privacy, and accountability.

- **Infrastructure gap** – AI deployment requires reliable electricity, internet, and hardware that may be scarce.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 2

a\) What is FOPL? Explain with some examples.  
b) Show that the sentence S is a logical consequence of S1, S2, S3,…,Sn if and only if S1&S2&S3&…&Sn $\to$ S is valid.  
c) How the following statement might be written in FOPL: (i) “All employees earning \$1400 or more per year pay taxes.” and (ii) “Some employees are sick today.”

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 2

**a)** **FOPL** (First-Order Predicate Logic) extends propositional logic with predicates, variables, and quantifiers. It allows representing objects, properties, and relations.

**Examples:**

- “All humans are mortal”: $\forall x (\text{Human}(x) \to \text{Mortal}(x))$

- “Someone likes ice cream”: $\exists x (\text{Person}(x) \land \text{Likes}(x, \text{IceCream}))$

- “Every student has a supervisor”: $\forall x (\text{Student}(x) \to \exists y (\text{Supervisor}(y) \land \text{Supervises}(y, x)))$

**b)** A sentence $S$ is a **logical consequence** of $S_1, S_2, \dots, S_n$ (denoted $S_1, S_2, \dots, S_n \vDash S$) if every model that satisfies all premises $S_1 \land S_2 \land \dots \land S_n$ also satisfies $S$.

This is equivalent to saying that the implication $(S_1 \land S_2 \land \dots \land S_n) \to S$ is **valid** (true in all models). Proof: If $S$ is a logical consequence, then whenever the antecedent is true, $S$ is true, making the implication true in all models. Conversely, if the implication is valid, then any model satisfying all premises must satisfy $S$, making $S$ a logical consequence.

**c)** In FOPL:

```prolog
		Algorithm: DFS(problem)
		node <- Node(Initial_State(problem))
		frontier <- Stack containing node
		explored <- empty set
		loop do
		if frontier is empty then return failure
		node <- Pop(frontier)
		if Goal_Test(problem, State(node)) then return node
		add State(node) to explored
		for each action in Actions(problem, State(node)) do
		child <- Child_Node(problem, node, action)
		if child not in frontier and not in explored then
		Push(child, frontier)
	
```0

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 3

a\) Represent the following statements through FOPL syntax:  
E1: All employee earning below 1000 dollars do not pay taxes.  
E2: Some employees are sick today.  
E3: No employee earns more than the president.  
b) What are the steps needed to transform a sentence into causal form?  
c) Explain support list and conceptual dependencies.  
d) Since R is a relation. How you can be characterised R with relational properties.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 3

**a)** In FOPL:

```prolog
		Algorithm: DFS(problem)
		node <- Node(Initial_State(problem))
		frontier <- Stack containing node
		explored <- empty set
		loop do
		if frontier is empty then return failure
		node <- Pop(frontier)
		if Goal_Test(problem, State(node)) then return node
		add State(node) to explored
		for each action in Actions(problem, State(node)) do
		child <- Child_Node(problem, node, action)
		if child not in frontier and not in explored then
		Push(child, frontier)
	
```1

**b)** Steps to convert a FOL sentence to **clausal (CNF) form**:

1.  **Eliminate implications** ($\to$, $\leftrightarrow$)

2.  **Move negations inward** (De Morgan’s laws)

3.  **Standardise variables** (rename to avoid clashes)

4.  **Skolemise** (replace existential quantifiers with Skolem functions)

5.  **Remove universal quantifiers** (drop $\forall$)

6.  **Distribute $\lor$ over $\land$** to get CNF

7.  **Flatten nested conjunctions/disjunctions**

8.  **Write each clause separately**

**c)** A **support list** in TMS records the justification for a belief – the premises and inference rules that led to it. Each belief is labelled IN (supported) or OUT (unsupported).

**Conceptual Dependencies (CD)** are primitive action categories used in conceptual dependency theory to represent the meaning of actions. The 11 primitives include ATRANS (transfer possession), PTRANS (transfer location), MTRANS (transfer mental info), MBUILD (construct new info), INGEST (take in), EXPEL (expel), PROPEL (apply force), MOVE (move body part), GRASP (grab), ATTEND (focus sense), SPEAK (produce sound).

**d)** A relation $R$ can be characterised by its **relational properties**:

- **Reflexive**: $\forall x\, R(x,x)$

- **Symmetric**: $\forall x\forall y\, (R(x,y) \to R(y,x))$

- **Antisymmetric**: $\forall x\forall y\, (R(x,y) \land R(y,x) \to x = y)$

- **Transitive**: $\forall x\forall y\forall z\, (R(x,y) \land R(y,z) \to R(x,z))$

- **Irreflexive**: $\forall x\, \lnot R(x,x)$

- **Asymmetric**: $\forall x\forall y\, (R(x,y) \to \lnot R(y,x))$

- **Total**: $\forall x\forall y\, (R(x,y) \lor R(y,x))$

An **equivalence relation** is reflexive, symmetric, and transitive. A **partial order** is reflexive, antisymmetric, and transitive.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 4

a\) Write the features of LISP. Give an example and also write the format of additional list manipulation functions of LISP.  
b) Write the general format of Conditional Cond and describe of how it works. Write also an example of Conditional Cond.  
c) How recursion is used in LISP? Write an example of LISP where recursion is used.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 4

**a)** **Features of LISP:**

- Symbolic expression (S-expression) based syntax

- Code as data (homoiconicity)

- Automatic memory management (garbage collection)

- First-class functions (functional programming)

- Dynamic typing

- Powerful list processing primitives (CAR, CDR, CONS)

- Macros (code that writes code)

**Example:**

```prolog
		Algorithm: DFS(problem)
		node <- Node(Initial_State(problem))
		frontier <- Stack containing node
		explored <- empty set
		loop do
		if frontier is empty then return failure
		node <- Pop(frontier)
		if Goal_Test(problem, State(node)) then return node
		add State(node) to explored
		for each action in Actions(problem, State(node)) do
		child <- Child_Node(problem, node, action)
		if child not in frontier and not in explored then
		Push(child, frontier)
	
```2

**Additional List Manipulation Functions:**

```prolog
		Algorithm: DFS(problem)
		node <- Node(Initial_State(problem))
		frontier <- Stack containing node
		explored <- empty set
		loop do
		if frontier is empty then return failure
		node <- Pop(frontier)
		if Goal_Test(problem, State(node)) then return node
		add State(node) to explored
		for each action in Actions(problem, State(node)) do
		child <- Child_Node(problem, node, action)
		if child not in frontier and not in explored then
		Push(child, frontier)
	
```3

**b)** **Cond format:**

```prolog
		Algorithm: DFS(problem)
		node <- Node(Initial_State(problem))
		frontier <- Stack containing node
		explored <- empty set
		loop do
		if frontier is empty then return failure
		node <- Pop(frontier)
		if Goal_Test(problem, State(node)) then return node
		add State(node) to explored
		for each action in Actions(problem, State(node)) do
		child <- Child_Node(problem, node, action)
		if child not in frontier and not in explored then
		Push(child, frontier)
	
```4

**How it works:** COND evaluates each test in order. When a test evaluates to non-nil (true), the corresponding result is evaluated and returned. The final `t` clause is an optional catch-all.

**Example:**

```prolog
		Algorithm: DFS(problem)
		node <- Node(Initial_State(problem))
		frontier <- Stack containing node
		explored <- empty set
		loop do
		if frontier is empty then return failure
		node <- Pop(frontier)
		if Goal_Test(problem, State(node)) then return node
		add State(node) to explored
		for each action in Actions(problem, State(node)) do
		child <- Child_Node(problem, node, action)
		if child not in frontier and not in explored then
		Push(child, frontier)
	
```5

**c)** **Recursion in LISP:** LISP uses recursion naturally because lists are recursively defined structures. A function calls itself on a smaller version of the problem until reaching a base case.

**Example – recursive list length:**

```prolog
		Algorithm: DFS(problem)
		node <- Node(Initial_State(problem))
		frontier <- Stack containing node
		explored <- empty set
		loop do
		if frontier is empty then return failure
		node <- Pop(frontier)
		if Goal_Test(problem, State(node)) then return node
		add State(node) to explored
		for each action in Actions(problem, State(node)) do
		child <- Child_Node(problem, node, action)
		if child not in frontier and not in explored then
		Push(child, frontier)
	
```6

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 5

a\) Define Branch and Bound Search. Explain its algorithm with suitable example.  
b) Explain some desirable properties of heuristic search algorithms.  
c) Describe the implementation of Frame Structures with property lists.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 5

**a)** **Branch and Bound** is a search algorithm that systematically explores branches of a state space while maintaining the best solution found so far as a bound to prune suboptimal branches.

**Algorithm:**

1.  Initialise best solution as $\infty$ (for minimisation).

2.  Place initial state in a priority queue (ordered by cost).

3.  While queue is not empty:

    1.  Pop the node with the lowest cost.

    2.  If cost exceeds current best, prune (discard branch).

    3.  If node is goal, update best solution.

    4.  Generate successors and add to queue.

4.  Return best solution.

**Example:** Travelling Salesman Problem (TSP). Start from city A, explore partial tours. If the partial tour A–B–C already costs more than the best complete tour found so far, prune the branch.

**b)** Desirable properties of heuristic search algorithms:

- **Admissibility**: $h(n) \leq h^*(n)$ (never overestimates true cost to goal)

- **Consistency (Monotonicity)**: $h(n) \leq c(n,a,n') + h(n')$ for all $n, n'$

- **Dominance**: $h_1$ dominates $h_2$ if $h_1(n) \geq h_2(n)$ for all $n$

- **Informedness**: more informed heuristics prune more nodes

- **Computational efficiency**: heuristic must be cheap to compute

- **Safety**: guarantees termination and solution quality

**c)** **Frame Structures with Property Lists:** In LISP, frames can be implemented using **property lists** (plists). Each frame is a symbol with properties stored as attribute-value pairs.

```prolog
		Algorithm: DFS(problem)
		node <- Node(Initial_State(problem))
		frontier <- Stack containing node
		explored <- empty set
		loop do
		if frontier is empty then return failure
		node <- Pop(frontier)
		if Goal_Test(problem, State(node)) then return node
		add State(node) to explored
		for each action in Actions(problem, State(node)) do
		child <- Child_Node(problem, node, action)
		if child not in frontier and not in explored then
		Push(child, frontier)
	
```7

Property lists provide a flexible, dynamic way to implement frame-based knowledge representation in LISP, allowing inheritance through the `ISA` slot.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 6

a\) Explain Knowledge Engineering Environment.  
b) What do you mean by Breadth-First Search? Explain the working procedure of Breadth-First Search. Write the algorithm with its complexity.  
c) Write the algorithm of Best First Search and explain its working principles.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 6

**a)** **Knowledge Engineering Environment (KEE)** is a software environment for building knowledge-based systems. It provides tools for knowledge acquisition, representation (frames, rules, logic), inference engine, explanation facilities, and user interface development. KEE integrates multiple representation paradigms including object-oriented programming, rule-based reasoning, and truth maintenance. Modern equivalents include CLIPS, JESS, and Protégé.

**b)** **Breadth-First Search (BFS)** explores all nodes at the current depth level before moving to deeper levels. It uses a FIFO queue.

**Working procedure:**

1.  Enqueue the initial state.

2.  Dequeue a node and test for goal.

3.  If goal, return solution.

4.  Otherwise, enqueue all unvisited successors.

5.  Repeat from step 2.

**Algorithm:**

```prolog
		Algorithm: DFS(problem)
		node <- Node(Initial_State(problem))
		frontier <- Stack containing node
		explored <- empty set
		loop do
		if frontier is empty then return failure
		node <- Pop(frontier)
		if Goal_Test(problem, State(node)) then return node
		add State(node) to explored
		for each action in Actions(problem, State(node)) do
		child <- Child_Node(problem, node, action)
		if child not in frontier and not in explored then
		Push(child, frontier)
	
```8

**Complexity:** Time $O(b^d)$, Space $O(b^d)$, where $b$ = branching factor, $d$ = depth of solution. BFS is **complete** and **optimal** for unweighted graphs.

**c)** **Best-First Search** selects the most promising node from the frontier based on an evaluation function $f(n)$.

**Algorithm:**

```prolog
		Algorithm: DFS(problem)
		node <- Node(Initial_State(problem))
		frontier <- Stack containing node
		explored <- empty set
		loop do
		if frontier is empty then return failure
		node <- Pop(frontier)
		if Goal_Test(problem, State(node)) then return node
		add State(node) to explored
		for each action in Actions(problem, State(node)) do
		child <- Child_Node(problem, node, action)
		if child not in frontier and not in explored then
		Push(child, frontier)
	
```9

**Working principle:** Best-First Search uses $f(n) = g(n) + h(n)$ (for A\*) or $f(n) = h(n)$ (Greedy). It always expands the node with the lowest $f$ value, combining the benefits of systematic exploration (through $g(n)$) and heuristic guidance (through $h(n)$).

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 7

a\) Why Knowledge acquisition is difficult? Explain general learning model with block diagram.  
b) What are the differences between memorization and direct instruction?

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 7

**a)** **Knowledge acquisition is difficult** because:

- Experts often cannot articulate their knowledge (tacit knowledge).

- Knowledge is voluminous and complex.

- Experts may give inconsistent or incomplete information.

- The knowledge engineer must bridge the gap between domain terminology and representation formalism.

- Knowledge changes over time, requiring constant updates.

- Extracting heuristics and exception-handling rules is challenging.

**General Learning Model block diagram:**

        +---------------+    Feedback    +----------------+
        | Environment   |<--------------+|   Learner      |
        | (Teacher /    |               |  (Performance  |
        |  Data Source) |-------------->|   Element)     |
        +---------------+    Examples   +-------+--------+
                                               |
                                       +-------v--------+
                                       |  Knowledge     |
                                       |  Base          |
                                       +----------------+
                                               |
                                       +-------v--------+
                                       |  Performance   |
                                       |  (Inference    |
                                       |   Engine)      |
                                       +----------------+

The learner acquires knowledge from the environment (teacher or data), stores it in the knowledge base, and the performance element uses it for reasoning. Feedback from performance evaluation guides further learning.

**b)** **Memorisation vs. Direct Instruction:**

| **Aspect**    | **Memorisation**                            | **Direct Instruction**                              |
|:--------------|:--------------------------------------------|:----------------------------------------------------|
| Definition    | Rote storage of facts without understanding | Knowledge transferred from teacher with explanation |
| Understanding | Low – facts may not be connected            | High – concepts are explained                       |
| Retention     | Fragile, easily forgotten                   | Stronger, contextualised                            |
| Transfer      | Poor – cannot apply to new situations       | Good – principles transfer                          |
| Effort        | Passive repetition                          | Active engagement                                   |
| Example       | Learning multiplication table by heart      | Learning multiplication through grouping objects    |

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 8

a\) What do you mean by TMS? Explain TMS with a suitable block diagram.  
b) Define Expert System. Write down the characteristics of an expert system. Draw and describe the basic structure of the rule based expert system.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 8

**a)** **TMS (Truth Maintenance System)** is a reasoning subsystem that maintains consistency of beliefs by tracking justifications. When a contradiction is detected, TMS identifies the responsible beliefs and revises them.

**Block Diagram:**

            +------------------+
            |   Domain        |
            |   Problem       |
            |   Solver        |
            | (Inference      |
            |  Engine)        |
            +--------+--------+
                     |
            +--------v--------+
            |    TMS          |
            | (Justification  |
            |  Network)       |
            |  - SL nodes     |
            |  - IN/OUT labels|
            +--------+--------+
                     |
            +--------v--------+
            |  Belief Set     |
            | (Current KB)    |
            +-----------------+

**b)** **Expert System** is a computer system that emulates the decision-making ability of a human expert in a specific domain.

**Characteristics:**

- Domain-specific knowledge

- Ability to explain reasoning

- Handles uncertainty and incomplete information

- Modular (easy to update knowledge)

- Performance at or near human expert level

- Uses symbolic reasoning, not just numerical computation

**Structure of Rule-Based Expert System:**

        +------------------+
        |    User          |
        +--------+---------+
                 |
        +--------v---------+
        |  User Interface  |
        | (Query, Response,|
        |  Explanation)    |
        +--------+---------+
                 |
        +--------v---------+
        | Inference Engine |<-------+
        | (Forward/Backward|        |
        |  Chaining)       |        |
        +--------+---------+        |
                 |                  |
        +--------v---------+        |
        |  Working Memory  |        |
        |  (Current Facts) |        |
        +--------+---------+        |
                 |                  |
        +--------v---------+        |
        | Knowledge Base   +--------+
        | (IF-THEN Rules)  |
        +------------------+

The **user interface** handles interaction. The **inference engine** applies rules to facts. The **working memory** stores current problem data. The **knowledge base** contains domain rules. An **explanation facility** (not shown) justifies conclusions to the user.

</div>

## Final Exam 2024 (Session 2020–2021)

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 1

a\) What are the importances of knowledge in Artificial Intelligence?  
b) What are the components of a knowledge base system? Explain with suitable diagram.  
c) Explain different types of knowledge with suitable examples.  
d) Briefly explain knowledge organization and knowledge manipulation.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 1

**a)** **Importance of Knowledge in AI:**

- Enables intelligent reasoning and decision-making.

- Provides the basis for problem-solving in expert systems.

- Allows agents to understand and interact with the world.

- Reduces search space by using domain-specific heuristics.

- Facilitates learning and adaptation.

- Enables communication through shared concepts and language.

**b)** **Components of a Knowledge Base System:**

        +------------------+
        |    User          |
        +--------+---------+
                 |
        +--------v---------+
        |  User Interface  |
        +--------+---------+
                 |
        +--------v---------+
        | Inference Engine |
        +--------+---------+
                 |
        +--------v---------+
        | Knowledge Base   |
        | (Rules + Facts)  |
        +------------------+
                 |
        +--------v---------+
        | Knowledge        |
        | Acquisition      |
        | Module           |
        +------------------+
                 |
        +--------v---------+
        | Explanation      |
        | Facility         |
        +------------------+

**c)** **Types of Knowledge:**

- **Declarative** – facts about objects and events (e.g., “Dhaka is the capital of Bangladesh”).

- **Procedural** – how to perform tasks (e.g., steps to solve a Rubik’s cube).

- **Heuristic** – rules of thumb (e.g., “if a patient has fever and cough, suspect flu”).

- **Structural** – relationships and hierarchies (e.g., a taxonomy of animals).

- **Episodic** – specific experiences (e.g., “I visited Cox’s Bazar last summer”).

**d)** **Knowledge Organization** refers to the systematic structuring of knowledge for efficient storage and retrieval. This includes classification, categorisation, indexing, and ontology building.

**Knowledge Manipulation** involves operations on knowledge: addition (inserting new facts), deletion (removing obsolete facts), modification (updating existing knowledge), and inference (deriving new knowledge from existing knowledge through reasoning). Both are critical for maintaining a dynamic, consistent, and useful knowledge base.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 2

a\) Draw the architecture of the problem solver with TMS and explain the working process.  
b) Explain conceptual dependency primitive actions.  
c) What do you mean by script? Write a script on organizing ICPC in your campus.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 2

**a)** **Architecture of Problem Solver with TMS:**

        +------------------+
        |   Problem        |
        |   Solver         |
        |  (Inference)     |<----> TMS (Justification
        +--------+---------+       Network + Belief DB)
                 |
        +--------v---------+
        | Knowledge Base   |
        +------------------+
                 |
        +--------v---------+
        |  Domain Rules    |
        |  + Working       |
        |  Memory          |
        +------------------+

**Working process:** The problem solver generates inferences and creates new beliefs. Each belief is justified by a **support list** pointing back to the premises and rules that produced it. The TMS tracks these dependencies in its **justification network**. When a contradiction is detected, the TMS finds the minimal set of beliefs responsible (dependency-directed backtracking) and updates the belief set by labelling some beliefs OUT, triggering the problem solver to revise its conclusions.

**b)** **Conceptual Dependency (CD) Primitive Actions:**

- **ATRANS** – transfer of an abstract relationship (e.g., give, take ownership)

- **PTRANS** – physical transfer of location (e.g., go, move)

- **MTRANS** – transfer of mental information (e.g., tell, read)

- **MBUILD** – construct new mental information (e.g., decide, plan)

- **INGEST** – take in by an animal (e.g., eat, drink)

- **EXPEL** – expel from an animal (e.g., spit, cry)

- **PROPEL** – apply physical force (e.g., push, throw)

- **MOVE** – move body part (e.g., kick, nod)

- **GRASP** – grasp an object (e.g., hold, pick up)

- **ATTEND** – direct a sense organ (e.g., look, listen)

- **SPEAK** – produce sound (e.g., say, shout)

**c)** A **script** is a structured representation of a stereotyped sequence of events. It defines the expected order of actions in a familiar situation.

**Script: Organizing ICPC in Campus**

    Script: ICPC_ORGANIZATION
    Track: Collegiate Programming Contest
    Props: Contest hall, Computers, Problem sets, Judges,
           Scoreboard, Prizes, Registration desk
    Roles: Organizer, Participants, Judges, Volunteers,
           Technical team, Sponsor

    Scene 1: PREPARATION (Weeks before)
      Organizer: Secure venue and budget
      Technical team: Set up computers with IDEs
      Problem setters: Prepare and test problem set
      Volunteers: Promote contest across campus
      Registration: Collect participants' data

    Scene 2: REGISTRATION (Day of contest)
      Participants arrive at registration desk
      Volunteers verify credentials
      Assign team IDs and seating

    Scene 3: BRIEFING
      Organizer announces rules and schedule
      Judges explain scoring system
      Distribute problem statements

    Scene 4: CONTEST (5 hours)
      PTRANS(participants, seats -> computers)
      MBUILD(participants, solution strategies)
      Participants solve problems and submit code
      Judges evaluate solutions
      Scoreboard updates in real time

    Scene 5: CLOSING
      MTRANS(judges, results -> participants)
      Awards ceremony
      Photo session and feedback collection

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 3

a\) Explain the syntax of FOPL.  
b) What do you mean by Analogy and Induction? Explain with example.  
c) Explain model based reflex agent with suitable diagram?

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 3

**a)** **Syntax of FOPL:**

- **Constants**: Symbols representing specific objects (e.g., `John`, `Dhaka`, 42).

- **Variables**: Placeholders for objects (e.g., $x$, $y$, $z$).

- **Functions**: Map objects to objects (e.g., $\text{fatherOf}(x)$, $\text{plus}(x,y)$).

- **Predicates**: Represent properties or relations (e.g., $\text{Human}(x)$, $\text{Loves}(x,y)$).

- **Connectives**: $\lnot$ (not), $\land$ (and), $\lor$ (or), $\to$ (implies), $\leftrightarrow$ (iff).

- **Quantifiers**: $\forall$ (for all), $\exists$ (there exists).

- **Terms**: Constants, variables, or function applications.

- **Atomic sentence**: $P(t_1, t_2, \dots, t_n)$ where $P$ is a predicate and $t_i$ are terms.

- **Complex sentence**: Atomic sentences combined with connectives and quantifiers.

**b)** **Analogy:** Reasoning that transfers knowledge from a familiar source domain to a novel target domain based on structural similarity.

*Example:* Understanding the flow of electricity in a circuit by analogy with water flowing through pipes (voltage $\sim$ water pressure, current $\sim$ flow rate, resistor $\sim$ narrow pipe).

**Induction:** Reasoning from specific observations to general principles or rules.

*Example:* Observing that “swan 1 is white”, “swan 2 is white”, $\dots$, “swan 100 is white” leads to the inductive conclusion “all swans are white” (not guaranteed, but useful).

**c)** **Model-Based Reflex Agent:**

        +----------------+         +----------------+
        |    Sensors     |-------->| World Model    |
        +----------------+         | (How world     |
                |                  |  evolves,      |
                |                  |  effect of     |
                |                  |  actions)      |
                v                  +----------------+
        +----------------+                 |
        | State Update   |<----------------+
        | (Internal      |
        |  State)        |
        +----------------+
                |
                v
        +----------------+         +----------------+
        | Condition-Action|-------->|   Actuators   |
        | Rules          |         +----------------+
        +----------------+

The agent maintains an **internal state** that models the unobservable parts of the environment. When a percept arrives, the agent uses its **world model** to update its internal state (how does the world evolve? how do my actions change it?). Then **condition–action rules** select an action based on the current state and percept.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 4

a\) What do you mean by FOPL? What are the advantages of using it?  
b) What are the properties of a statement? Explain them.  
c) Proof distributive and commutative law.  
d) Explain Modus Ponens and Substitution rules with example.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 4

**a)** **FOPL** (First-Order Predicate Logic) is a formal logical system with predicates, variables, and quantifiers ($\forall$, $\exists$).

**Advantages of FOPL:**

- **Expressiveness**: Can represent complex relationships, rules, and quantified statements.

- **Compositionality**: Meaning of complex expressions derived from parts.

- **Precision**: Formal semantics eliminate ambiguity.

- **Automated reasoning**: Supports automated theorem proving.

- **Knowledge engineering**: Basis for expert systems and semantic web.

**b)** **Properties of Statements:**

- **Validity**: A statement is valid (tautology) if true in all interpretations (e.g., $P \lor \lnot P$).

- **Satisfiability**: A statement is satisfiable if true in at least one interpretation.

- **Unsatisfiability**: A statement is unsatisfiable (contradiction) if false in all interpretations.

- **Logical consequence**: $S$ follows from premises if all models of premises satisfy $S$.

- **Equivalence**: $P$ and $Q$ are equivalent if they have the same truth value in all models.

**c)** **Distributive Laws:** $$P \land (Q \lor R) \equiv (P \land Q) \lor (P \land R)$$ $$P \lor (Q \land R) \equiv (P \lor Q) \land (P \lor R)$$

**Proof by truth table** for $P \land (Q \lor R) \equiv (P \land Q) \lor (P \land R)$:

| $P$ | $Q$ | $R$ | $Q \lor R$ | $P \land (Q \lor R)$ | $P \land Q$ | $P \land R$ | $(P \land Q) \lor (P \land R)$ |
|:---:|:---:|:---:|:----------:|:--------------------:|:-----------:|:-----------:|:------------------------------:|
|  T  |  T  |  T  |     T      |          T           |      T      |      T      |               T                |
|  T  |  T  |  F  |     T      |          T           |      T      |      F      |               T                |
|  T  |  F  |  T  |     T      |          T           |      F      |      T      |               T                |
|  T  |  F  |  F  |     F      |          F           |      F      |      F      |               F                |
|  F  |  T  |  T  |     T      |          F           |      F      |      F      |               F                |
|  F  |  T  |  F  |     T      |          F           |      F      |      F      |               F                |
|  F  |  F  |  T  |     T      |          F           |      F      |      F      |               F                |
|  F  |  F  |  F  |     F      |          F           |      F      |      F      |               F                |

Both sides have identical truth values, proving equivalence.

**Commutative Laws:** $$P \land Q \equiv Q \land P \qquad P \lor Q \equiv Q \lor P$$

**d)** **Modus Ponens:** If $P$ is true and $P \to Q$ is true, then $Q$ is true. $$\frac{P,\quad P \to Q}{Q}$$

*Example:* “It is raining” (P). “If it rains, the ground gets wet” ($P \to Q$). Therefore, “the ground is wet” (Q).

**Substitution Rule:** In FOL, if a sentence $S$ contains a variable $x$, and we have $S$ with $\forall x$, we can substitute any ground term $t$ for $x$. $$\frac{\forall x\, P(x)}{P(t)} \quad \text{(Universal Instantiation)}$$

*Example:* From $\forall x\, (\text{Human}(x) \to \text{Mortal}(x))$ and $\text{Human}(\text{Socrates})$, substitute $x = \text{Socrates}$ to derive $\text{Mortal}(\text{Socrates})$.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 5

a\) What is search? Explain the distinction between uninformed search and informed search.  
b) Briefly describe the depth-first search algorithm.  
c) Discuss the potential problems of hill climbing method.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 5

**a)** **Search** in AI is the process of exploring a state space to find a sequence of actions that transforms an initial state into a goal state.

**Uninformed vs. Informed Search:**

| **Aspect**   | **Uninformed Search**       | **Informed Search**                |
|:-------------|:----------------------------|:-----------------------------------|
| Heuristic    | None                        | Uses heuristic $h(n)$              |
| Strategy     | Blind (systematic)          | Guided by domain knowledge         |
| Efficiency   | Low (explores many nodes)   | Higher (prunes useless branches)   |
| Completeness | Varies                      | Often complete with admissible $h$ |
| Optimality   | Only BFS/UCS                | A\* optimal with admissible $h$    |
| Space usage  | BFS: $O(b^d)$, DFS: $O(bm)$ | Can be high but focused            |
| Examples     | BFS, DFS, UCS, IDS          | A\*, Greedy BFS, IDA$^*$           |

**b)** **Depth-First Search (DFS)** explores a path to the maximum depth before backtracking. It uses a LIFO stack. Starting from the root, DFS recursively visits children, going deep until either a goal is found or a dead end is reached, then backtracks to explore alternative branches. DFS has space complexity $O(bm)$ (where $m$ = maximum depth) but is not complete (may get stuck in infinite loops) and not optimal. It is preferred when solutions are dense and deep.

**c)** **Potential Problems of Hill Climbing:**

- **Local maxima**: The algorithm reaches a peak that is higher than all neighbours but lower than the global maximum. It stops prematurely.

- **Plateaus**: A flat region where all neighbours have the same value. The algorithm cannot decide which direction to move.

- **Ridges**: A narrow peak where movement in orthogonal directions goes downward but a diagonal move would improve (hill climbing typically only checks cardinal directions).

- **Shoulders**: A plateau that is not flat but has a gentle slope, which may be mistaken for a local maximum.

- **No guarantee of optimality**: Hill climbing always returns a local optimum, which may be far from the global optimum.

**Remedies:** Random-restart hill climbing, simulated annealing, stochastic hill climbing (choose randomly among better neighbours), sideways moves.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 6

a\) What is expert system? Write some applications of expert system.  
b) Briefly describe a typical rule-based expert system with proper diagram.  
c) What are the differences and similarities between computer vision and human vision systems?

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 6

**a)** An **expert system** is a computer program that emulates the decision-making ability of a human expert in a specialised domain. It uses a knowledge base of domain facts and rules, plus an inference engine to draw conclusions.

**Applications:**

- MYCIN – medical diagnosis of bacterial infections

- DENDRAL – chemical structure analysis from mass spectrometry

- XCON/R1 – computer system configuration (DEC)

- PROSPECTOR – mineral exploration and geological analysis

- PUFF – respiratory condition diagnosis

- Expert systems in agriculture (crop disease diagnosis)

- Financial advisory and credit assessment

**b)** **Rule-Based Expert System:**

        +------------------+
        |      User        |
        +--------+---------+
                 |
        +--------v---------+
        |  User Interface  |
        +--------+---------+
                 |
        +--------v---------+
        | Inference Engine |
        | (Forward/Backward|
        |  Chaining)       |
        +--------+---------+
            |           |
            v           v
    +-------+--+   +---+--------+
    | Working |   | Knowledge   |
    | Memory  |   | Base        |
    | (Facts) |   | (Rules)     |
    +---------+   +-------------+

The **Inference Engine** cycles through: (1) Match rule conditions against facts in working memory, (2) Select a rule to fire (conflict resolution), (3) Execute the rule (add/remove facts). This is known as the **recognise–act cycle**.

**c)** **Differences and Similarities:**

| **Aspect**        | **Human Vision**                                              | **Computer Vision**                           |
|:------------------|:--------------------------------------------------------------|:----------------------------------------------|
| Processing        | Parallel, holistic                                            | Sequential (pixel $\to$ feature $\to$ object) |
| Adaptability      | Highly adaptive, handles novel scenes                         | Requires retraining for novel conditions      |
| Speed             | Fast for recognition (100–200ms)                              | Variable, depends on computation              |
| Precision         | Poor at exact measurements                                    | Precise geometric measurements                |
| Lighting          | Adaptive (auto white balance)                                 | Sensitive to lighting changes                 |
| Colour perception | Subjective (colour constancy)                                 | Objective (numerical RGB/HLS)                 |
| **Similarities**  |                                                               |                                               |
| Goal              | Both aim to interpret visual scenes                           |                                               |
| Stages            | Both use low-level (edges, colour) $\to$ high-level (objects) |                                               |
| Learning          | Both improve with experience/exposure                         |                                               |
| Ambiguity         | Both can be fooled by optical illusions/adversarial examples  |                                               |

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 7

a\) Explain pattern recognition process with suitable diagram.  
b) Explain decision theoretic classification with its mathematical equations.  
c) Before implementation of clustering problems, what are the questions must be addressed? Explain them.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 7

**a)** **Pattern Recognition Process:**

        +----------+    +----------+    +----------+    +----------+
        | Sensor   |--->| Feature  |--->| Classifier|--->| Decision |
        | (Input)  |    |Extraction|    | (Model)   |    | (Output) |
        +----------+    +----------+    +----------+    +----------+
                              |               ^
                              v               |
                        +----------+    +----------+
                        | Feature  |    | Training |
                        | Database |    | Data     |
                        +----------+    +----------+

**Steps:**

1.  **Sensing**: Acquire raw data (image, audio, text)

2.  **Preprocessing**: Clean, normalise, enhance data

3.  **Feature Extraction**: Transform raw data into meaningful features (e.g., edges in images, MFCC in audio)

4.  **Classification**: Apply model to assign class label

5.  **Post-processing**: Refine decision, confidence scoring

Training data is used to build the classifier model before deployment.

**b)** **Decision Theoretic Classification** uses probability theory to classify patterns based on minimizing expected risk (Bayesian decision theory).

For a pattern $x$ belonging to class $\omega_i$, the **posterior probability** is: $$P(\omega_i \mid x) = \frac{p(x \mid \omega_i) P(\omega_i)}{p(x)}$$

The **Bayes decision rule** assigns $x$ to class $\omega_i$ that maximizes posterior: $$\text{Decide } \omega_i \text{ if } P(\omega_i \mid x) > P(\omega_j \mid x) \text{ for all } j \neq i$$

Equivalently, using the **discriminant function**: $$g_i(x) = \ln p(x \mid \omega_i) + \ln P(\omega_i)$$

For minimum error rate, choose class with maximum $g_i(x)$.

For minimum risk, incorporate a **loss function** $\lambda(\omega_i \mid \omega_j)$: $$R(\omega_i \mid x) = \sum_j \lambda(\omega_i \mid \omega_j) P(\omega_j \mid x)$$

**c)** **Questions Before Implementing Clustering:**

- **What is the goal?** Exploratory data analysis, pattern discovery, or compression? The goal determines the clustering approach.

- **How many clusters?** Must we specify $k$ in advance (k-means), or can it be inferred (DBSCAN, hierarchical)?

- **What distance/similarity measure?** Euclidean, Manhattan, cosine, correlation? Choice depends on data type and domain.

- **What is the data scale?** Are features normalised? Clustering algorithms are sensitive to scale.

- **Are there outliers?** Some algorithms (k-means) are sensitive to outliers; others (DBSCAN) handle them well.

- **What shape are the clusters?** Spherical (k-means) vs. arbitrary shapes (DBSCAN, spectral clustering).

- **How to validate?** Internal (silhouette score, Davies–Bouldin) vs. external (adjusted Rand index) validation.

- **Is the clustering stable?** Run multiple times with different initialisations to check consistency.

</div>

<div style="border-left:4px solid #f57f17;background:#fffde7;padding:14px 18px;margin:18px 0;border-radius:6px;">

Question 8

a\) Define Robotic Engineering. Explain the laws of Robotics.  
b) Explain some examples of current applications of machine learning in robotics.  
c) What are the key components of Robot? Explain with suitable diagram.

</div>

<div style="border-left:4px solid #2e7d32;background:#f1f8e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Solution 8

**a)** **Robotic Engineering** is the interdisciplinary field concerned with designing, building, operating, and using robots. It combines mechanical engineering, electrical engineering, computer science, and AI to create machines that can sense, think, and act.

**Asimov’s Three Laws of Robotics:**

1.  **First Law**: A robot may not injure a human being or, through inaction, allow a human being to come to harm.

2.  **Second Law**: A robot must obey orders given by human beings except where such orders would conflict with the First Law.

3.  **Third Law**: A robot must protect its own existence as long as such protection does not conflict with the First or Second Law.

A **Zeroth Law** was later added: A robot may not harm humanity, or through inaction, allow humanity to come to harm.

**b)** **Machine Learning Applications in Robotics:**

- **Autonomous navigation**: Self-driving cars use deep reinforcement learning (DRL) and computer vision for perception, path planning, and control.

- **Manipulation**: Robotic arms learn grasping strategies through trial and error (deep Q-networks).

- **SLAM (Simultaneous Localization and Mapping)**: ML-based visual SLAM enables drones and vacuum cleaners to map environments.

- **Human–robot interaction**: Gesture recognition and natural language understanding via CNNs and transformers.

- **Imitation learning**: Robots learn tasks by observing human demonstrations (behavioural cloning).

- **Predictive maintenance**: ML models predict component failures from sensor data.

**c)** **Key Components of a Robot:**

        +----------------------+
        |   Power Supply       |
        |   (Battery/Power)    |
        +----------+-----------+
                   |
        +----------v-----------+
        |   Controller         |<----+----- Program/Software
        |   (CPU/Micro)        |     |     (AI/ML algorithms)
        +----------+-----------+     |
                   |                 |
        +----------v-----------+     |
        |   Sensors            |     |
        |   (Camera, Sonar,    |     |
        |    LIDAR, Touch)     |     |
        +----------+-----------+     |
                   |                 |
        +----------v-----------+     |
        |   Actuators           |    |
        |   (Motors, Servos,   |    |
        |    Hydraulics)       |    |
        +----------+-----------+     |
                   |                 |
        +----------v-----------+     |
        |   Manipulators/      |     |
        |   End Effectors      +-----+
        |   (Grippers, Tools)  |
        +----------------------+

**Explanation:**

- **Controller** – the brain (CPU, microcontroller) that processes sensor data and executes control algorithms.

- **Sensors** – collect data from the environment (cameras, LIDAR, sonar, touch, temperature, IMU).

- **Actuators** – convert electrical signals into physical movement (DC motors, servo motors, stepper motors, hydraulic/pneumatic cylinders).

- **Manipulators/End Effectors** – tools for interacting with the environment (grippers, welding torches, suction cups).

- **Power Supply** – provides energy (batteries, fuel cells, tethered power).

- **Software** – the AI/ML algorithms that enable perception, planning, control, and learning.

</div>

{% endraw %}
