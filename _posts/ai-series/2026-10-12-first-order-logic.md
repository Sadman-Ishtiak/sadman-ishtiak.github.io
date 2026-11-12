---
title: "First-Order Logic"
date: 2026-10-12 00:00:00 +0600
categories: [Artificial Intelligence, Academic Notes]
tags: [ai, fol, knowledge-representation]
description: "Comprehensive academic notes on First-Order Logic from the Artificial Intelligence series."
math: true
---

# First-Order Logic


In which we notice that the world is blessed with many objects, some of which are related to other objects, and in which we endeavor to reason about them.

## Representation Revisited




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Compositionality</strong>

A language is **compositional** if the meaning of a sentence is a function of the meaning of its parts. For example, the meaning of $S_{1,4} \land S_{1,2}$ is related to the meanings of $S_{1,4}$ and $S_{1,2}$ individually. Propositional logic is compositional; natural language is not always.

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Ambiguity</strong>

**Ambiguity** occurs when a sentence has more than one possible meaning. Natural language suffers from ambiguity (e.g., ``spring'' can mean a season or a coil). Formal logics are designed to be unambiguous---each sentence has exactly one interpretation.

</div>



Propositional logic has three desirable properties: it is **declarative** (meaning depends on a truth relation between sentences and possible worlds), **compositional**, and it handles partial information using disjunction and negation. However, it lacks the expressive power to concisely describe environments with many objects.



<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Limitation of Propositional Logic</strong>

In the wumpus world, we had to write a separate rule for each square:
\[
B_{1,1} \Leftrightarrow (P_{1,2} \lor P_{2,1})
\]
In English we say once: ``Squares adjacent to pits are breezy.'' FOL captures this concisely:
\[
\forall s \; Breezy(s) \Leftrightarrow \exists r \; Adjacent(r, s) \land Pit(r)
\]

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Object, Relation, Function, Property</strong>

In FOL, the world consists of:
\begin{itemize}
    \item **Objects**: things with identity (people, houses, numbers, colors, etc.)
    \item **Relations**: ways objects relate to each other (brother of, bigger than, inside, etc.)
    \item **Functions**: mappings from objects to objects (father of, one more than, etc.)
    \item **Properties**: unary relations (red, round, prime, etc.)
\end{itemize}

</div>



[htbp]



![](/assets/images/ai-book/figures/book-008-p7.png)



*Caption: The three kinds of symbols in first-order logic map to the three kinds of things in the world: objects, relations, and functions.*


\end{figure}



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Ontological Commitment</strong>

The **ontological commitment** of a logic is what it assumes about the nature of reality---what exists in the world.
\begin{itemize}
    \item Propositional logic: facts (true or false)
    \item First-order logic: facts, objects, relations
    \item Temporal logic: facts, objects, relations, times
    \item Higher-order logic: relations and functions as objects
\end{itemize}

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Epistemological Commitment</strong>

The **epistemological commitment** of a logic is what an agent can believe about facts.
\begin{itemize}
    \item Propositional/FOL: true, false, or unknown
    \item Probability theory: degree of belief in $[0,1]$
    \item Fuzzy logic: degree of truth in $[0,1]$
\end{itemize}

</div>



[htbp]

\begin{tabular}{lcc}
\toprule
Language & Ontological Commitment & Epistemological Commitment \\
\midrule
Propositional logic & facts & true/false/unknown \\
First-order logic & facts, objects, relations & true/false/unknown \\
Temporal logic & facts, objects, relations, times & true/false/unknown \\
Probability theory & facts & degree of belief $\in [0,1]$ \\
Fuzzy logic & facts with degree of truth & known interval value \\
\bottomrule
\end{tabular}


*Caption: Formal languages and their ontological and epistemological commitments*



\end{table}

### Key Properties of FOL vs. PL
\begin{itemize}
    \item FOL is more expressive: it quantifies over objects, not just propositions.
    \item PL is decidable; FOL is only semidecidable (entailment).
    \item FOL requires more complex inference procedures (unification, resolution).
    \item Temporal logic adds time; higher-order logic adds relations as objects.
\end{itemize}

### Temporal Logic vs. First-Order Logic



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Temporal Logic</strong>

**Temporal logic** extends FOL with time-based operators: $\Box P$ (``always $P$''), $\Diamond P$ (``eventually $P$''), $\bigcirc P$ (``next $P$''), and $P \Until Q$ (``$P$ until $Q$'').

</div>



FOL describes a static world---it asserts what is true at a given moment but cannot directly express change over time. Temporal logic makes time a first-class citizen. While FOL can encode time by adding a time argument to every predicate ($King(x, t)$), temporal logic provides built-in operators that make temporal reasoning more natural.

The choice between FOL and temporal logic depends on the domain: static domains (family trees, mathematical theorems) are well served by FOL; dynamic domains (planning, protocols, reactive systems) benefit from temporal logic's explicit time operators.



<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 FOL vs. Temporal Logic</strong>

\begin{itemize}
    \item FOL: $\forall x \; King(x) \Rightarrow Person(x)$\\
    \hspace*{2em}``All kings are persons'' (timeless)
    \item Temporal: $\Box(\forall x \; King(x) \Rightarrow \Diamond Person(x))$\\
    \hspace*{2em}``Always, every king eventually becomes a person''
\end{itemize}
The temporal version captures change---kings are born as princes and become kings later.

</div>



## Syntax and Semantics of First-Order Logic




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Domain and Domain Elements</strong>

The **domain** of a model is the set of objects (or **domain elements**) it contains. The domain must be nonempty. A **tuple** is a collection of objects arranged in a fixed order, written $\langle o_1, o_2, \ldots, o_n \rangle$.

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Constant, Predicate, and Function Symbols</strong>

The basic syntactic elements of FOL are:
\begin{itemize}
    \item **Constant symbols**: stand for objects (e.g., *Richard*, *John*)
    \item **Predicate symbols**: stand for relations (e.g., *Brother*, *OnHead*)
    \item **Function symbols**: stand for functions (e.g., *LeftLeg*)
\end{itemize}
Each predicate and function symbol has an **arity** that fixes the number of arguments.

</div>



An **interpretation** maps constant symbols to objects, predicate symbols to relations on those objects, and function symbols to functions on those objects.



<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Interpretation Example</strong>

A model with objects: Richard the Lionheart, King John, their left legs, and a crown.
\begin{itemize}
    \item *Richard* $\rightarrow$ Richard the Lionheart
    \item *John* $\rightarrow$ King John
    \item *Brother* $\rightarrow$ $\{\langle \text{Richard}, \text{John} \rangle, \langle \text{John}, \text{Richard} \rangle\}$
    \item *LeftLeg(John)* $\rightarrow$ John's left leg
\end{itemize}

</div>



### Terms and Atomic Sentences



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Term</strong>

A **term** is a logical expression that refers to an object. Constant symbols are terms. Complex terms are formed by a function symbol followed by a parenthesized list of terms:
\[
LeftLeg(John), \quad Father(Richard), \quad plus(1, 2)
\]
A term with no variables is called a **ground term**.

</div>





<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Terms and Their References</strong>

\begin{itemize}
    \item Constant term: $John$ refers to the person King John.
    \item Function term: $LeftLeg(John)$ refers to John's left leg (a different object).
    \item Nested function term: $Father(Father(John))$ refers to John's paternal grandfather.
    \item Ground term: $plus(2, 3)$ in Peano arithmetic refers to the number 5.
\end{itemize}
Every term, no matter how complex, denotes exactly one object in the domain.

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Atomic Sentence</strong>

An **atomic sentence** (or **atom**) is formed from a predicate symbol optionally followed by a parenthesized list of terms:
\[
Brother(Richard, John), \quad Married(Father(Richard), Mother(John))
\]
An atomic sentence is true if the relation referred to by the predicate holds among the objects referred to by the arguments.

</div>





<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Atomic Sentence Truth Conditions</strong>

Given a model where:
\begin{itemize}
    \item $Richard$ $\rightarrow$ Richard the Lionheart
    \item $John$ $\rightarrow$ King John
    \item $Brother$ $\rightarrow$ $\{\langle \text{Richard}, \text{John} \rangle, \langle \text{John}, \text{Richard} \rangle\}$
\end{itemize}
\vspace{0.3em}
Then:
\begin{itemize}
    \item $Brother(Richard, John)$ is **true**---the pair is in the relation.
    \item $Brother(John, Richard)$ is **true**---brotherhood is symmetric here.
    \item $Brother(John, LeftLeg(John))$ is **false**---John's left leg is not his brother.
\end{itemize}

</div>



### Quantifiers



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Universal Quantifier</strong>

$\forall x \; P$ means $P$ is true for **every** object $x$. The natural connective with $\forall$ is $\Rightarrow$:
\[
\forall x \; King(x) \Rightarrow Person(x)
\]
``All kings are persons.'' The implication is true for objects that are not kings, so the rule only constrains kings.

</div>





<div style="border-left: 4px solid #ef6c00; background-color: #fff3e0; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>⚠️ Common Mistake</strong>

Using $\land$ with $\forall$:\\
$\forall x \; King(x) \land Person(x)$ means ``Everything is a king and a person''---far too strong.

</div>





<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Universal Quantifier Examples</strong>

\begin{itemize}
    \item ``All humans are mortal'':
    \[
    \forall x \; Human(x) \Rightarrow Mortal(x)
    \]
    True for all objects: if an object is human, it is mortal; non-humans satisfy the implication vacuously.
    \item ``Every square in the wumpus world is breezy or has a pit'':
    \[
    \forall s \; Breezy(s) \lor HasPit(s)
    \]
    Uses $\lor$ (not $\Rightarrow$) because the property applies universally without condition.
\end{itemize}

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Existential Quantifier</strong>

$\exists x \; P$ means $P$ is true for **at least one** object $x$. The natural connective with $\exists$ is $\land$:
\[
\exists x \; Crown(x) \land OnHead(x, John)
\]
``King John has a crown on his head.''

</div>





<div style="border-left: 4px solid #ef6c00; background-color: #fff3e0; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>⚠️ Common Mistake</strong>

Using $\Rightarrow$ with $\exists$:\\
$\exists x \; Crown(x) \Rightarrow OnHead(x, John)$ is true if any object is not a crown---very weak.

</div>





<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Existential Quantifier Examples</strong>

\begin{itemize}
    \item ``Someone is a king'':
    \[
    \exists x \; King(x)
    \]
    True if at least one object in the domain is a king.
    \item ``Richard has a crown on his head'':
    \[
    \exists x \; Crown(x) \land OnHead(x, Richard)
    \]
    Uses $\land$ because we need both conditions to hold for the same $x$.
\end{itemize}

</div>



#### Quantifier Equivalences (De Morgan for Quantifiers)
\[
\begin{aligned}
\forall x \; \neg P &\equiv \neg \exists x \; P \\
\neg \forall x \; P &\equiv \exists x \; \neg P \\
\forall x \; P &\equiv \neg \exists x \; \neg P \\
\exists x \; P &\equiv \neg \forall x \; \neg P
\end{aligned}
\]

[htbp]



![](/assets/images/ai-book/figures/book-008-p9.png)



*Caption: Classification of first-order logic sentences.*


\end{figure}

### Nested Quantifiers


When quantifiers are mixed, order matters critically:
\[
\forall x \; \exists y \; Loves(x, y) \quad \text{``Everybody loves somebody.''}
\]
\[
\exists y \; \forall x \; Loves(x, y) \quad \text{``There is someone who is loved by everybody.''}
\]

[htbp]

\begin{tabular}{lll}
\toprule
Pattern & Meaning & Example \\
\midrule
$\forall x \; \forall y$ & For all pairs & ``All brothers are siblings'' \\
$\exists x \; \exists y$ & There exist some pair & ``Someone knows someone'' \\
$\forall x \; \exists y$ & Each has some (depends on $x$) & ``Everyone has a mother'' \\
$\exists x \; \forall y$ & Some one for all (independent) & ``There is a universal mother'' \\
\bottomrule
\end{tabular}


*Caption: Nested quantifier patterns*



\end{table}



<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Nested Quantifier Example</strong>

``Everybody loves somebody'' vs. ``Somebody loves everybody'':
\begin{itemize}
    \item $\forall x \; \exists y \; Loves(x, y)$: each person loves some person (possibly different for each).
    \item $\exists x \; \forall y \; Loves(x, y)$: there is one person who is loved by all.
\end{itemize}
These are **not** logically equivalent.

</div>



### Equality Symbol




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Equality</strong>

The **equality symbol** ($=$) signifies that two terms refer to the same object:
\[
Father(John) = Henry
\]
Equality is used with negation to assert distinctness:
\[
\exists x, y \; Brother(x, Richard) \land Brother(y, Richard) \land \neg(x = y)
\]
``Richard has at least two brothers.''

</div>





<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Using Equality</strong>

\begin{itemize}
    \item ``John is the father of Richard'':
    \[
    Father(Richard) = John
    \]
    \item ``There are exactly two kings'':
    \[
    \exists x, y \; King(x) \land King(y) \land x \neq y \land \forall z \; King(z) \Rightarrow (z = x \lor z = y)
    \]
    \item ``No two people have the same mother'':
    \[
    \forall x, y \; Mother(x) = Mother(y) \Rightarrow x = y
    \]
\end{itemize}
Equality lets us count, distinguish, and identify objects---something impossible in propositional logic.

</div>



### Database Semantics




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Database Semantics</strong>

**Database semantics** is an alternative to standard FOL semantics with three assumptions:
\begin{itemize}
    \item **Unique-names assumption**: every constant symbol refers to a distinct object.
    \item **Closed-world assumption**: atomic sentences not known to be true are false.
    \item **Domain closure**: the domain contains no more objects than those named by constants.
\end{itemize}
This semantics is used in database systems and logic programming (Prolog).

</div>





<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Standard Semantics vs. Database Semantics</strong>

Given the KB: $King(John)$, no mention of $Richard$:
\begin{itemize}
    \item **Standard FOL**: $King(Richard)$ is unknown---it may be true or false depending on the model.
    \item **Database semantics**: $King(Richard)$ is false---the closed-world assumption treats unmentioned facts as false.
\end{itemize}
Database semantics trades expressiveness for efficiency: query answering becomes closed-form computation rather than open-ended logical inference.

</div>



## Using First-Order Logic




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Assertion, Query, Goal</strong>

Sentences are added to a knowledge base using **TELL** (called **assertions**). Questions are asked using **ASK** (called **queries** or **goals**).
\[
\begin{aligned}
&\text{TELL}(KB, King(John)) \\
&\text{TELL}(KB, \forall x \; King(x) \Rightarrow Person(x)) \\
&\text{ASK}(KB, Person(John)) \quad \text{returns true}
\end{aligned}
\]

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Substitution and Binding List</strong>

**ASKVARS** returns a stream of **substitutions** (or **binding lists**) that make the query true:
\[
\text{ASKVARS}(KB, Person(x)) \quad \text{returns } \{x/John\}, \{x/Richard\}
\]
A substitution $\theta = \{v_1/t_1, v_2/t_2, \ldots\}$ maps variables to terms.

</div>



### Translating English to FOL


[htbp]

\begin{tabular}{lll}
\toprule
English Pattern & FOL Translation & Example \\
\midrule
All $P$ are $Q$ & $\forall x \; P(x) \Rightarrow Q(x)$ & All kings are persons \\
Some $P$ are $Q$ & $\exists x \; P(x) \land Q(x)$ & Some employees are sick \\
No $P$ are $Q$ & $\forall x \; P(x) \Rightarrow \neg Q(x)$ & No fish are mammals \\
Only $P$ are $Q$ & $\forall x \; Q(x) \Rightarrow P(x)$ & Only birds fly \\
Every $P$ has a $Q$ & $\forall x \; P(x) \Rightarrow \exists y \; Q(y) \land R(x,y)$ & Everyone has a mother \\
\bottomrule
\end{tabular}


*Caption: English to FOL translation patterns*



\end{table}



<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 English to FOL Examples</strong>

\begin{enumerate}
    \item ``All employees earning $1400 or more per year pay taxes.''
    \[
    \forall x \; Employee(x) \land Earns(x, y) \land y \geq 1400 \Rightarrow PaysTax(x)
    \]
    \item ``Some employees are sick today.''
    \[
    \exists x \; Employee(x) \land Sick(x, Today)
    \]
    \item ``No employee earns more than the president.''
    \[
    \forall x, y \; Employee(x) \land President(y) \Rightarrow \neg EarnsMore(x, y)
    \]
\end{enumerate}

</div>



### Definition, Theorem, and Peano Axioms




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Definition and Theorem</strong>

A **definition** is an axiom of the form $\forall x, y \; P(x,y) \Leftrightarrow \ldots$ that defines a predicate in terms of others. A **theorem** is a sentence that follows logically from the axioms; it need not be stored in the KB but can be derived when needed.

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Peano Axioms (Natural Numbers)</strong>

The natural numbers are defined using one constant $0$ and one function $S$ (successor):

```text
NatNum(0).
forall n NatNum(n) => NatNum(S(n)).
forall n 0 != S(n).
forall m,n m != n => S(m) != S(n).
forall m NatNum(m) => +(0, m) = m.
forall m,n NatNum(m) & NatNum(n) => +(S(m), n) = S(+(m, n)).
```

Addition is defined as repeated application of the successor function.

</div>



## Knowledge Engineering in First-Order Logic




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Knowledge Engineering</strong>

**Knowledge engineering** is the process of building a knowledge base. A **knowledge engineer** investigates a domain, learns what concepts are important, and creates a formal representation. **Knowledge acquisition** is the process of extracting knowledge from human experts.

</div>



### The Knowledge-Engineering Process

\begin{enumerate}
    \item **Identify the task**: delineate the range of questions the KB will support.
    \item **Assemble relevant knowledge**: understand how the domain works.
    \item **Decide on a vocabulary**: choose predicates, functions, and constants---this defines the **ontology**.
    \item **Encode general knowledge**: write axioms for all vocabulary terms.
    \item **Encode problem instance**: write atomic sentences about the specific instance.
    \item **Pose queries**: ask the inference procedure for answers.
    \item **Debug the KB**: fix missing or incorrect axioms.
\end{enumerate}



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Ontology</strong>

An **ontology** is a particular theory of the nature of being or existence. The ontology determines what kinds of things exist in a domain, but not their specific properties and interrelationships.

</div>



### Diagnostic vs. Causal Rules



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Diagnostic Rule vs. Causal Rule</strong>

A **diagnostic rule** goes from observed effects to hidden causes:
\[
\forall s \; Smelly(s) \Rightarrow Adjacent(Home(Wumpus), s)
\]
A **causal rule** goes from cause to effect:
\[
\forall r \; Pit(r) \Rightarrow (\forall s \; Adjacent(r, s) \Rightarrow Breezy(s))
\]
Diagnostic rules are easier to derive from data; causal rules are more robust for prediction.

</div>



[htbp]



![](/assets/images/ai-book/figures/book-009-p6.png)



*Caption: Diagnostic rules infer causes from effects; causal rules predict effects from causes.*


\end{figure}

### Circuit Verification Example


The digital circuit domain illustrates the knowledge engineering process. Consider a one-bit full adder (Figure~8.6 in AIMA). The KB encodes:
\begin{itemize}
    \item Types of gates: $Type(X_1) = XOR$, $Type(A_1) = AND$, $Type(O_1) = OR$
    \item Connectivity: $Connected(Out(1, X_1), In(1, X_2))$
    \item Behavior: $\forall g \; Gate(g) \land Type(g) = AND \Rightarrow (Signal(Out(1,g)) = 0 \Leftrightarrow \exists n \; Signal(In(n,g)) = 0)$
\end{itemize}



<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Circuit Verification Query</strong>

Query: What input combinations produce sum 0 and carry 1?

```text
exists i1,i2,i3 Signal(In(1,C1)) = i1 & Signal(In(2,C1)) = i2
         & Signal(In(3,C1)) = i3 & Signal(Out(1,C1)) = 0
         & Signal(Out(2,C1)) = 1
```

Answers: $\{i_1/1, i_2/1, i_3/0\}$, $\{i_1/1, i_2/0, i_3/1\}$, $\{i_1/0, i_2/1, i_3/1\}$.

</div>





<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Higher-Order Logic</strong>

**Higher-order logic** views relations and functions as objects themselves. This allows quantification over relations:
\[
\forall R \; Transitive(R) \Leftrightarrow (\forall x,y,z \; R(x,y) \land R(y,z) \Rightarrow R(x,z))
\]
Higher-order logic is strictly more expressive than FOL, but inference is more complex.

</div>



[htbp]

\begin{tikzpicture}[node distance=2cm, auto]
\node[draw, rectangle, rounded corners, minimum width=2.5cm, minimum height=0.8cm] (task) {1. Identify Task};
\node[draw, rectangle, rounded corners, minimum width=2.5cm, minimum height=0.8cm, below=0.8cm of task] (know) {2. Assemble Knowledge};
\node[draw, rectangle, rounded corners, minimum width=2.5cm, minimum height=0.8cm, below=0.8cm of know] (vocab) {3. Decide Vocabulary};
\node[draw, rectangle, rounded corners, minimum width=2.5cm, minimum height=0.8cm, below=0.8cm of vocab] (axioms) {4. Encode Axioms};
\node[draw, rectangle, rounded corners, minimum width=2.5cm, minimum height=0.8cm, below=0.8cm of axioms] (instance) {5. Encode Instance};
\node[draw, rectangle, rounded corners, minimum width=2.5cm, minimum height=0.8cm, below=0.8cm of instance] (query) {6. Pose Queries};
\node[draw, rectangle, rounded corners, minimum width=2.5cm, minimum height=0.8cm, below=0.8cm of query] (debug) {7. Debug KB};
\draw[->] (task) -- (know);
\draw[->] (know) -- (vocab);
\draw[->] (vocab) -- (axioms);
\draw[->] (axioms) -- (instance);
\draw[->] (instance) -- (query);
\draw[->] (query) -- (debug);
\draw[->, dashed] (debug.east) -- ++(1.5,0) |- (vocab.east);
\draw[->, dashed] (debug.east) -- ++(1.5,0) |- (axioms.east);
\node[right=2.5cm of debug] {Iterate};
\end{tikzpicture}

*Caption: The knowledge engineering process. Dashed arrows show debugging feedback loops.*


\end{figure}

## Properties of Statements


### Distributive and Commutative Laws

FOL inherits the same logical equivalences as propositional logic plus additional laws for quantifiers.

[htbp]

\begin{tabular}{ll}
\toprule
Law & Expression \\
\midrule
Commutative $\land$ & $P \land Q \equiv Q \land P$ \\
Commutative $\lor$ & $P \lor Q \equiv Q \lor P$ \\
Associative $\land$ & $(P \land Q) \land R \equiv P \land (Q \land R)$ \\
Distributive $\land$ over $\lor$ & $P \land (Q \lor R) \equiv (P \land Q) \lor (P \land R)$ \\
Distributive $\lor$ over $\land$ & $P \lor (Q \land R) \equiv (P \lor Q) \land (P \lor R)$ \\
De Morgan (quantified) & $\neg \forall x \; P \equiv \exists x \; \neg P$ \\
De Morgan (quantified) & $\neg \exists x \; P \equiv \forall x \; \neg P$ \\
\bottomrule
\end{tabular}


*Caption: Logical equivalences in FOL*



\end{table}

### Relational Properties



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Relational Properties</strong>

A binary relation $R$ can be characterized by the following properties:
\begin{itemize}
    \item **Reflexive**: $\forall x \; R(x, x)$
    \item **Symmetric**: $\forall x, y \; R(x, y) \Rightarrow R(y, x)$
    \item **Transitive**: $\forall x, y, z \; R(x, y) \land R(y, z) \Rightarrow R(x, z)$
    \item **Antisymmetric**: $\forall x, y \; R(x, y) \land R(y, x) \Rightarrow x = y$
    \item **Equivalence relation**: reflexive, symmetric, and transitive
    \item **Partial order**: reflexive, antisymmetric, and transitive
\end{itemize}

</div>



[htbp]



![](/assets/images/ai-book/figures/book-002-p1.png)



*Caption: Classification of relational properties. Equivalence relations are symmetric, reflexive, and transitive. Partial orders are reflexive, antisymmetric, and transitive.*


\end{figure}

[htbp]

\begin{tabular}{lcccc}
\toprule
Relation & Reflexive & Symmetric & Transitive & Antisymmetric \\
\midrule
Equality ($=$) & Yes & Yes & Yes & Yes \\
$\leq$ (less or equal) & Yes & No & Yes & Yes \\
Sibling & No & Yes & No & No \\
Ancestor & No & No & Yes & No \\
\bottomrule
\end{tabular}


*Caption: Properties of common relations*



\end{table}



<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Characterizing a Relation</strong>

To check whether a relation $R$ is an equivalence relation, verify:

```text
forall x R(x, x).                             % reflexive
forall x,y R(x, y) => R(y, x).                % symmetric
forall x,y,z R(x, y) & R(y, z) => R(x, z).   % transitive
```

If all three hold, $R$ is an equivalence relation that partitions the domain into equivalence classes.

</div>



## Knowledge Representation in FOL




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Knowledge Representation in FOL</strong>

FOL can represent complex knowledge about objects, their properties, and relationships. The classic example is the ``American criminal'' problem: determining whether Colonel West is a criminal based on known facts and rules.

</div>



### The Nono Missile Example

The knowledge base contains the following facts and rules:


```text
% Rules
forall x,y,z american(x) & weapon(y) & sells(x,y,z) & hostile(z)
    -> criminal(x).
forall x missile(x) & owns(nono, x) -> sells(west, x, nono).
forall x missile(x) -> weapon(x).
forall x enemy(x, america) -> hostile(x).

% Facts
american(west).
enemy(nono, america).
owns(nono, m1).
missile(m1).
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Proof that Colonel West is a Criminal</strong>

Query: $criminal(West)$?

Forward chaining proof:
\begin{enumerate}
    \item $missile(m1) \Rightarrow weapon(m1)$ (rule 3)
    \item $enemy(Nono, America) \Rightarrow hostile(Nono)$ (rule 4)
    \item $missile(m1) \land owns(Nono, m1) \Rightarrow sells(West, m1, Nono)$ (rule 2)
    \item $american(West) \land weapon(m1) \land sells(West, m1, Nono)$\\
          $\land hostile(Nono) \Rightarrow criminal(West)$ (rule 1)
\end{enumerate}
Therefore $criminal(West)$ is true.

</div>



[htbp]



![](/assets/images/ai-book/figures/book-009-p17.png)



*Caption: Forward chaining proof that Colonel West is a criminal. Arrows show inference steps from rules and facts to the conclusion.*


\end{figure}

### Key Properties of Knowledge Representation in FOL
\begin{itemize}
    \item FOL allows **concise representation**: one quantified rule replaces many propositional ones.
    \item FOL supports **compositional semantics**: meaning of a sentence is a function of its parts.
    \item FOL is **context-independent**: meaning does not depend on the context of utterance.
    \item FOL is **unambiguous**: each sentence has exactly one interpretation.
    \item FOL reasoning is **semidecidable**: if a sentence is entailed, a proof will eventually be found; but if not, the algorithm may never terminate.
\end{itemize}



<div style="border-left: 4px solid #f57f17; background-color: #fffde7; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>❓ Exam Question</strong>

Translate the following sentences into First-Order Logic:
\begin{enumerate}
    \item All employees earning below 1000 dollars do not pay taxes.
    \item Some employees are sick today.
    \item No employee earns more than the president.
    \item Every employee has a boss who is a manager.
\end{enumerate}

</div>





<div style="border-left: 4px solid #2e7d32; background-color: #f1f8e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>✅ Solution</strong>

\begin{enumerate}
    \item $\forall x \; Employee(x) \land Earns(x, y) \land y < 1000 \Rightarrow \neg PaysTax(x)$
    \item $\exists x \; Employee(x) \land Sick(x, Today)$
    \item $\forall x, y \; Employee(x) \land President(y) \Rightarrow \neg EarnsMore(x, y)$
    \item $\forall x \; Employee(x) \Rightarrow \exists y \; Boss(y, x) \land Manager(y)$
\end{enumerate}

</div>



\section*{Summary}


\begin{itemize}
    \item Knowledge representation languages should be declarative, compositional, expressive, context-independent, and unambiguous.
    \item Logics differ in their ontological and epistemological commitments. FOL commits to objects and relations, gaining expressive power over propositional logic.
    \item The syntax of FOL adds terms (for objects), universal quantifier ($\forall$), and existential quantifier ($\exists$).
    \item A model for FOL includes a set of objects and an interpretation mapping symbols to objects, relations, and functions.
    \item Atomic sentences are true when the named relation holds among named objects. Quantified sentences are true under extended interpretations.
    \item Knowledge engineering is a seven-step process: identify task, assemble knowledge, choose vocabulary, encode axioms, encode instance, pose queries, debug.
    \item FOL can represent relational properties (reflexive, symmetric, transitive) and complex knowledge (the West criminal example).
\end{itemize}
