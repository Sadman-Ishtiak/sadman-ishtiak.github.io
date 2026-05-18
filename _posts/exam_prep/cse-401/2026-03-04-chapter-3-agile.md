---
title: "Ch 3: Agile Software Development"
date: 2026-03-04 00:00:00 +0600
categories: [Academic, CSE-401 Software Engineering]
tags: [chapter-3, software-engineering, agile]
description: "Agile methodologies including Extreme Programming, Scrum, and DevOps."
math: true
---

## Chapter 3 — Agile Software Development
*(Sommerville Ch. 3)*

### What is Agility?

**Agility** is the ability to respond to change rapidly and effectively. In software, this means:
- Delivering working software frequently
- Embracing changing requirements even late in development
- Close, daily collaboration between business and developers

### Principles of Agile Methods (Agile Manifesto)

| Principle | Meaning |
|---|---|
| Customer involvement | Customers provide and prioritize requirements constantly |
| Incremental delivery | Software developed in small increments with customer input |
| People not process | Individual developer skills are recognized and exploited |
| Embrace change | Design the system to accommodate change |
| Maintain simplicity | Actively work to eliminate complexity |

### How Agile Leads to Accelerated Development

1. Minimal up-front documentation reduces overhead
2. Working software delivered in weeks, not months
3. Continuous feedback prevents building the wrong thing
4. Small increments allow rapid course correction
5. Close team collaboration reduces communication latency

### Extreme Programming (XP)

XP pushes agile principles to the extreme. Key practices:

- **User stories** — requirements written on index cards as short narratives from the user's perspective
- **Test-first development** — write test before code
- **Pair programming** — two developers work at one workstation
- **Refactoring** — continuously improve code structure without changing behavior
- **Collective ownership** — any developer can change any part of the code
- **Continuous integration** — code integrated and tested multiple times daily
- **Small releases** — start with minimum useful feature set; release frequently

**User stories on cards — advantages vs. disadvantages:**

| Advantages | Disadvantages |
|---|---|
| Simple and accessible to non-technical stakeholders | Incomplete — can miss system-wide requirements |
| Easy to prioritize and reorder | Difficult to judge story completeness |
| Encourages conversation | Hard to trace to system requirements |
| Low overhead | May miss important non-functional requirements |

### Refactoring

**Refactoring** is the process of improving the internal structure of code without changing its external behavior. It keeps code clean and maintainable as the system evolves.

Role in testing: Refactoring after tests pass ensures code remains understandable and maintainable, making future tests easier to write and bugs easier to find.

### Scrum

**Scrum** is an agile method that focuses on managing iterative development rather than specific software engineering practices.

#### The Scrum Sprint Cycle

```
Product           Sprint             Potentially
Backlog ────────► Planning ────────► Shippable
(prioritized      Meeting            Product
feature list)         │             Increment
                       │
              ┌────────▼──────────┐
              │   SPRINT          │
              │   (2–4 weeks)     │
              │                   │
              │  Daily Scrum      │
              │  (15-min standup) │
              │  ┌──────────────┐ │
              │  │ What did I   │ │
              │  │ do yesterday?│ │
              │  │ What today?  │ │
              │  │ Any blocks?  │ │
              │  └──────────────┘ │
              └───────────────────┘
                       │
              ┌────────▼──────────┐
              │  Sprint Review    │
              │  Sprint           │
              │  Retrospective    │
              └───────────────────┘
```

**Scrum roles:**
- **Product Owner** — defines and prioritizes the product backlog
- **Scrum Master** — ensures the team follows Scrum process, removes impediments
- **Development Team** — self-organizing team that delivers the increment

### DevOps

DevOps combines **Development** and **Operations** to shorten the development lifecycle and deliver features continuously. Key impacts:

- Breaks silos between development and operations teams
- Enables continuous integration and continuous deployment (CI/CD)
- Infrastructure as code — environments are reproducible and version-controlled
- Faster release cycles with automated testing and deployment pipelines
- Monitoring in production feeds back into development priorities

### AI in Software Engineering

AI is transforming software engineering in several areas:

- **Code generation** — tools like GitHub Copilot suggest code completions
- **Automated testing** — AI generates test cases from specifications
- **Bug detection** — static analysis with ML identifies likely defects
- **Requirements extraction** — NLP tools extract requirements from documents
- **Project estimation** — ML models predict effort from historical data
