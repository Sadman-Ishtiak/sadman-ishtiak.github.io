---
title: "Reference: Diagrams to Know"
date: 2026-03-15 00:00:00 +0600
categories: [Academic, CSE-401 Software Engineering]
tags: [diagrams, reference, exam-prep]
description: "All diagrams from the Software Engineering course that you need to know for the exam."
math: true
---

# Diagrams to Know

## Waterfall Model

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

## Boehm's Spiral Model

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

## SDLC Framework Activities

```
┌──────────────────────────┐
│   Communication          │
│   (Requirements gathering)
└────────────┬─────────────┘
             │
┌────────────▼─────────────┐
│   Planning               │
│   (Resources, schedule)
└────────────┬─────────────┘
             │
┌────────────▼─────────────┐
│   Modeling               │
│   (Analysis, design)
└────────────┬─────────────┘
             │
┌────────────▼─────────────┐
│   Construction           │
│   (Coding, testing)
└────────────┬─────────────┘
             │
┌────────────▼─────────────┐
│   Deployment             │
│   (Delivery, feedback)
└──────────────────────────┘
```

## Scrum Sprint Cycle

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

## Requirements Engineering Process

```
┌────────────────┐    ┌────────────────┐    ┌────────────────┐
│  Requirements  │───►│  Requirements  │───►│  Requirements  │
│  Elicitation   │    │  Specification │    │  Validation    │
│  & Analysis    │    │                │    │                │
└────────────────┘    └────────────────┘    └────────────────┘
        ▲                                            │
        └────────────────────────────────────────────┘
                      (iterative)
```

## Testing Hierarchy

```
             ┌─────────────────┐
             │ Acceptance      │  ← User tests the system
             │ Testing         │
             └────────┬────────┘
                      │
             ┌────────▼────────┐
             │ System          │  ← Integration of all components
             │ Testing         │
             └────────┬────────┘
                      │
             ┌────────▼────────┐
             │ Integration/    │  ← Modules combined and tested
             │ Component Test  │
             └────────┬────────┘
                      │
             ┌────────▼────────┐
             │ Unit            │  ← Individual functions/classes
             │ Testing         │
             └─────────────────┘
```

## Traditional Testing Process (Plan-Driven)

```
Test         ┌──────────┐    ┌──────────┐    ┌──────────┐
Plan    ────►│  Unit    │───►│Component │───►│ System   │
             │  Testing │    │ Testing  │    │ Testing  │
             └──────────┘    └──────────┘    └──────────┘
                                                   │
             ┌─────────────────────────────────────▼──┐
             │         Release Testing                │
             │   (Testing by independent team)        │
             └─────────────────────────────────────┬──┘
                                                   │
             ┌─────────────────────────────────────▼──┐
             │         User Testing                   │
             │   (Alpha / Beta / Acceptance)           │
             └─────────────────────────────────────────┘
```

## Acceptance Testing Process

```
┌──────────────────────────────────────────────────────────┐
│                  Acceptance Testing Process              │
├──────────┬──────────┬──────────┬──────────┬─────────────┤
│  Define  │  Plan    │  Derive  │  Run     │  Negotiate  │
│  accept- │  accept- │  accept- │  accept- │  & decide   │
│  ance    │  ance    │  ance    │  ance    │  on accept- │
│  criteria│  tests   │  tests   │  tests   │  ance       │
└──────────┴──────────┴──────────┴──────────┴─────────────┘
```

## Risk Management Process

```
┌──────────────┐   ┌──────────────┐   ┌──────────────┐   ┌──────────────┐
│  Risk        │──►│  Risk        │──►│  Risk        │──►│  Risk        │
│  Identifi-   │   │  Analysis    │   │  Planning    │   │  Monitoring  │
│  cation      │   │              │   │              │   │              │
└──────────────┘   └──────────────┘   └──────────────┘   └──────────────┘
List potential     Assess             Strategies to      Monitor risks;
risks              probability &      avoid, minimize,   update analysis
                   impact             or manage          as project evolves
```

## Essential Attributes of Good Software

```
┌─────────────────────────────────────────────────────────┐
│              GOOD SOFTWARE ATTRIBUTES                   │
├───────────────────┬─────────────────────────────────────┤
│ Acceptability     │ Must be acceptable to users it is   │
│                   │ designed for                        │
├───────────────────┼─────────────────────────────────────┤
│ Dependability     │ Reliable, secure, and safe          │
├───────────────────┼─────────────────────────────────────┤
│ Efficiency        │ No wasteful use of system resources │
├───────────────────┼─────────────────────────────────────┤
│ Maintainability   │ Must evolve to meet changing needs  │
└───────────────────┴─────────────────────────────────────┘
```

## Plan-Driven vs. Agile Processes

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

## Verification vs. Validation

```
Verification                    Validation
────────────────────────        ────────────────────────
"Are we building the            "Are we building the
product right?"                 right product?"

Checks against                  Checks against
specification                   customer needs

Static (reviews,                Dynamic (running
inspections)                    the software)
or dynamic                      
```

## Types of Requirements

```
Requirements
├── Functional requirements
│   └── Describe what the system should do
│       (e.g. "The system shall allow users to search by keyword")
│
├── Non-functional requirements
│   ├── Product requirements (reliability, efficiency, portability)
│   ├── Organizational requirements (standards, implementation environment)
│   └── External requirements (legal, ethical)
│
└── Domain requirements
    └── Derived from the application domain
```
