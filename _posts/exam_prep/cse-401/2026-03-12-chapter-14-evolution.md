---
title: "Ch 14: Software Evolution & Legacy Systems"
date: 2026-03-12 00:00:00 +0600
categories: [Academic, CSE-401 Software Engineering]
tags: [chapter-14, software-engineering, evolution, legacy]
description: "Software maintenance categories, legacy systems, and system improvement strategies."
math: true
---

## Chapter 14 — Software Evolution & Legacy Systems
*(Sommerville Ch. 9 Evolution)*

### Categories of Software Maintenance

| Category | Description | Effort |
|---|---|---|
| **Corrective** | Fix defects discovered after delivery | ~20% |
| **Adaptive** | Modify system for new environment (new OS, hardware) | ~20% |
| **Perfective** | Add new features or improve performance | ~50% |
| **Preventive** | Restructure to improve maintainability | ~10% |

**Perfective maintenance consumes maximum effort** because users continuously request new features and enhancements throughout the system's life. Requirements never stop evolving.

### Why Maintain Software?

- Business processes depend on it — stopping maintenance stops the business
- External environment changes (new OS, legislation, hardware)
- Users find defects and request improvements
- Competitors release new features — must keep pace

### What is Legacy Software?

Legacy software is **old software that continues to be used** because it meets business needs, even though it may use outdated technology, be poorly documented, and be expensive to maintain.

**Why legacy systems are hard to replace:**
- Replacing them is risky — the old system works and is understood; new system may fail
- Extremely expensive — requires rewriting millions of lines
- Business processes are embedded in the system — hard to document all behavior
- Staff who built it may have left — institutional knowledge is lost
- Continuous operation required — can't stop while replacing

**How to improve legacy systems:**
1. **Scrap and rebuild** — only when system is too degraded to save
2. **Re-engineer** — restructure code without changing functionality (refactoring at scale)
3. **Migrate** — move to a new platform/architecture preserving logic
4. **Wrap** — add a new interface layer (API) around the old system
