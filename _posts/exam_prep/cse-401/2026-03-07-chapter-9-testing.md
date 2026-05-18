---
title: "Ch 9: Software Testing"
date: 2026-03-07 00:00:00 +0600
categories: [Academic, CSE-401 Software Engineering]
tags: [chapter-9, software-engineering, testing]
description: "Testing hierarchy, verification vs validation, test types, and acceptance testing."
math: true
---

## Chapter 9 — Software Testing
*(Sommerville Ch. 9)*

### Verification vs. Validation

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

### Testing Hierarchy

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

### Unit, Component, and System Testing Defined

| Level | Focus | Who |
|---|---|---|
| Unit testing | Individual functions, methods, or classes | Developer |
| Component testing | Composite of multiple units; interface testing | Developer |
| System testing | End-to-end behavior of the complete system | Independent test team |

### Why Integration Testing is Harder Than Unit Testing

- Units work in isolation but may fail when combined
- Interface mismatches between components only appear at integration
- Timing and synchronization issues emerge
- Dependencies on databases, networks, or external services introduce non-determinism
- Harder to isolate which component caused a failure

### White Box vs. Black Box Testing

| White Box | Black Box |
|---|---|
| Tester knows internal structure | Tester only knows inputs/outputs |
| Tests specific code paths | Tests against specification |
| Can miss system-level issues | Can miss code-level issues |
| Also called structural testing | Also called functional testing |

### The Traditional Testing Process (Plan-Driven)

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

### When to Stop Testing

There is no perfect answer, but practical criteria include:
- All planned test cases have been executed
- Defect discovery rate drops below a pre-defined threshold
- Code coverage targets are met (e.g. 85% branch coverage)
- Remaining known defects are accepted risks by the customer
- Time and budget are exhausted (business decision)

### Acceptance Testing Process

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

### Benefits of Early User Involvement in Testing

- Users validate that the system meets their actual needs, not just spec
- Real usage patterns reveal bugs that synthetic tests miss
- Acceptance criteria can be refined before final delivery
- Reduces risk of rejection at formal acceptance

**Disadvantages:** Users may not be available; they may introduce bias toward workflows they already know; managing feedback from many users adds overhead.

### Should Developers Test Their Own Code?

**For developer testing:**
- Deep knowledge of code helps design effective tests
- Faster feedback loop during development
- Developers most motivated to find defects early

**Against developer testing:**
- Psychological bias — developers unconsciously avoid testing edge cases
- Same misunderstanding of requirements may affect both code and test
- Best practice: developers write unit tests; independent teams do system and acceptance testing
