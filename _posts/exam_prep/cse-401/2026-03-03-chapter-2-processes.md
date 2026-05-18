---
title: "Ch 2: Software Processes & Process Models"
date: 2026-03-03 00:00:00 +0600
categories: [Academic, CSE-401 Software Engineering]
tags: [chapter-2, software-engineering, processes]
description: "Software process models including Waterfall, Spiral, and evolutionary development."
math: true
---

## Chapter 2 — Software Processes & Process Models
*(Sommerville Ch. 2)*

### What is a Software Process?

A software process is a **structured set of activities** required to develop a software system.

**Major process activities:**
1. **Specification** — defining what the system should do
2. **Design and implementation** — defining and building the system structure
3. **Validation** — checking that it does what the customer wants
4. **Evolution** — changing the system in response to customer needs

### Plan-Driven vs. Agile Processes

```
Plan-Driven                          Agile
──────────────────────────           ──────────────────────────
All activities planned in            Incremental planning
advance                              
Requirements documented up           Requirements emerge through
front                                iteration
Change is costly                     Change is expected & welcomed
Suitable for large, stable           Suitable for changing,
requirements                         unclear requirements
Examples: Waterfall, RUP             Examples: Scrum, XP
```

### The Waterfall Model

```
     ┌──────────────────────┐
     │  Requirements        │
     │  definition          │
     └──────────┬───────────┘
                │
     ┌──────────▼───────────┐
     │  System & software   │
     │  design              │
     └──────────┬───────────┘
                │
     ┌──────────▼───────────┐
     │  Implementation &    │
     │  unit testing        │
     └──────────┬───────────┘
                │
     ┌──────────▼───────────┐
     │  Integration &       │
     │  system testing      │
     └──────────┬───────────┘
                │
     ┌──────────▼───────────┐
     │  Operation &         │
     │  maintenance         │
     └──────────────────────┘
```

**Pros:**
- Easy to manage — each phase has specific deliverables
- Works well when requirements are very well understood
- Good for large, safety-critical systems (aerospace, defense)

**Cons:**
- Inflexible — difficult to respond to changing requirements
- Working software not produced until late in the lifecycle
- Requirements rarely fully known at project start

**Phase entry/exit criteria (Classical Waterfall):**
- **Entry:** Previous phase fully documented and signed off
- **Exit:** Current phase deliverables reviewed and accepted by stakeholders

### Boehm's Spiral Model

```
              Determine objectives,
              alternatives, constraints
   4th ◄──────────────────────────────── 1st
   quadrant                          quadrant
   Plan next                         Identify and
   iteration                         resolve risks
   ▲                                       ▼
   3rd                               2nd
   quadrant                          quadrant
   Develop and                       Evaluate
   validate next                     alternatives
   level ─────────────────────────►
```

The spiral is divided into **4 quadrants**, repeated across growing spirals:

| Quadrant | Activities |
|---|---|
| 1. Objective setting | Identify objectives, constraints, alternatives |
| 2. Risk assessment | Identify and resolve risks; may involve prototyping |
| 3. Development & validation | Choose a development model; build and test |
| 4. Planning | Review with the client; plan the next iteration |

**Key concept:** Each loop of the spiral represents a phase of the software process. Risk is explicitly addressed at every iteration.

*Can also be used for:* planning iterative development of large systems where risk is high, or for systems where requirements are unclear.

### SDLC Framework Activities

1. **Communication** — customer communication and requirements gathering
2. **Planning** — project plan, resource estimation, scheduling
3. **Modeling** — analysis and design
4. **Construction** — coding and testing
5. **Deployment** — delivery and feedback

### Evolutionary Development

In evolutionary development, initial implementation is built quickly, then refined through feedback. **Problem:** The process is not visible; it's hard to track progress. Systems are often **poorly structured** because continuous change degrades the architecture — making them difficult to maintain.

> *"Programs developed using evolutionary development are likely to be difficult to maintain because there is no overall structure — they become a patchwork of changes."*
