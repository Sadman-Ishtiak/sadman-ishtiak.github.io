---
title: "Ch 13: Configuration Management & Change"
date: 2026-03-11 00:00:00 +0600
categories: [Academic, CSE-401 Software Engineering]
tags: [chapter-13, software-engineering, configuration-management]
description: "Software change management, baselines, codeflows, and change approval factors."
math: true
---

## Chapter 13 — Configuration Management & Change
*(Sommerville Ch. 25)*

### Why Software Change is Inevitable

- Business environment changes (new regulations, markets)
- Errors discovered after delivery
- New platforms and technologies require adaptation
- Organizational changes affect requirements
- New stakeholders have new needs

### Key Definitions

| Term | Definition |
|---|---|
| **Baseline** | A reviewed and agreed-upon specification or product that serves as the basis for further development and can only be changed through formal change control |
| **Codeline** | A sequence of versions of source code with later versions derived from earlier versions |
| **Mainline** | A sequence of baselines representing different versions of a system |

### Configuration Management Activities

1. **Version management** — track versions of components; prevent conflicts
2. **System building** — assembling component versions into an executable system
3. **Change management** — process for assessing and implementing changes
4. **Release management** — preparing software for external release

### Approving a Change — Significant Factors

1. **Business impact** — does this change address a real business need?
2. **Cost of change** — development effort, testing, documentation
3. **Risk** — could this break existing functionality?
4. **Dependencies** — does this change affect other components or teams?
5. **Urgency** — is this a critical bug fix or a nice-to-have?
6. **Stakeholder impact** — who is affected if the change is or isn't made?
