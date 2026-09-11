# AGENTS.md — AI-SDLC Router

Repository state lives in:

docs/TASKS.md

Agents must **not modify this file**.

---

## Phases

0 BOOTSTRAP  
1 SPECIFY  
2 DESIGN  
3 DEVELOP  
4 VALIDATE  
5 DEPLOY  

Phases may be **skipped or repeated**.

Typical iteration:

SPECIFY → DESIGN → DEVELOP → VALIDATE  
VALIDATE → SPECIFY (iteration)  
DEPLOY → SPECIFY (feedback)

---

## Context Load Order

1. docs/TASKS.md  
2. docs/PROJECT.md  
3. docs/specs/UC-[NNN]-[NAME].md  

---

## Phase → Skill

0 → skills/ai-sdlc-0-bootstrap  
1 → skills/ai-sdlc-1-specify  
2 → skills/ai-sdlc-2-design  
3 → skills/ai-sdlc-3-develop  
4 → skills/ai-sdlc-4-validate  
5 → skills/ai-sdlc-5-deploy  

---

## Commands

Use the project-specific install, test, run and release commands documented in
`docs/PROJECT.md`. Do not assume a language, framework or deployment platform
before the project context has been completed.

---

## Rules

- Use **English** for all generated content.
- Prefer **updating existing artifacts** instead of creating new ones.
- Only create artifacts **if they do not exist**.
- Keep artifacts **minimal**.
- Avoid unnecessary comments in code.
- Follow **TDD** (tests before code).
- Respect **Clean Architecture**  
  domain ← application ← interfaces ← infrastructure
- Prefer **small vertical slices** (one UC end-to-end).
- Read the [canonical AI-SDLC documentation](https://docs.aisl.science/ai-sdlc)
  when terminology or lifecycle responsibilities are unclear.

If requirements or architecture are unclear → ask the user.
