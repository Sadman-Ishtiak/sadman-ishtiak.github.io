---
title: "Ch 12: Project Management & Planning"
date: 2026-03-10 00:00:00 +0600
categories: [Academic, CSE-401 Software Engineering]
tags: [chapter-12, software-engineering, project-management]
description: "Project manager roles, project planning, team management, and rework cost reduction."
math: true
---

## Chapter 12 — Project Management & Planning
*(Sommerville Ch. 22–23)*

### Why Project Management Matters

Without management, software projects:
- Exceed budget and schedule
- Deliver wrong functionality
- Suffer from poor team coordination
- Accumulate unresolvable technical debt

### Role of a Project Manager

- **Planning** — develop project plan, allocate resources
- **Organizing** — structure teams, define roles and responsibilities
- **Monitoring** — track progress against the plan
- **Leading** — motivate the team; resolve conflicts
- **Communicating** — manage stakeholder expectations
- **Risk management** — identify and mitigate risks continuously

**Motivating people** is critical. Teams with high morale deliver better software faster. Maslow's hierarchy applies: basic needs (salary) → safety (job security) → social (team belonging) → esteem (recognition) → self-actualization (challenging work).

### Why Project Planning is Iterative

Initial plans are based on incomplete information. As the project progresses:
- Requirements become clearer
- Risks materialize or disappear
- Estimates are revised with actual data
- Technology choices are validated or changed

> *"A project plan must be a living document, continuously reviewed and updated as new information becomes available."*

### Main Components of a Project Plan

1. **Introduction** — objectives, constraints, assumptions
2. **Project organization** — team structure, roles, responsibilities
3. **Risk analysis** — identified risks and mitigation strategies
4. **Hardware and software resource requirements**
5. **Work breakdown structure** — activities, dependencies
6. **Project schedule** — milestones, Gantt charts, critical path
7. **Monitoring and reporting mechanisms**

### Milestone vs. Deliverable

| Milestone | Deliverable |
|---|---|
| A point in the schedule where progress is measured | A tangible output produced for the customer |
| Internal to the team | Provided to the customer or stakeholder |
| Example: "Design review complete" | Example: "System design document v1.0" |

### Software Pricing Factors

- **Market opportunity** — price may be set low to gain market entry
- **Cost uncertainty** — ambiguous requirements → higher contingency
- **Contractual terms** — fixed price vs. time-and-materials changes risk distribution
- **Requirements volatility** — more likely to change = higher price
- **Financial health of client** — wealthy client may accept premium pricing

### Professional Personalities in Teams

(DeMarco & Lister / Belbin archetypes applied to software)

Teams need a balance of roles: leaders, analysts, implementers, coordinators, and critics. Forcing all developers into one personality mold reduces team effectiveness. Good project managers recognize and leverage diverse personalities.

### Rework and Reducing Its Cost

**Rework** = effort spent fixing defects or redoing work that was done incorrectly.

Steps to reduce rework costs:
1. Invest in thorough requirements analysis up front
2. Conduct formal reviews and inspections at each phase
3. Use test-driven development
4. Build incrementally — discover errors earlier
5. Use good configuration management to avoid duplication of effort
