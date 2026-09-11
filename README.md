# AI-SDLC Project Template

Starter repository for student and teaching projects that use the AI-assisted
Software Development Lifecycle (AI-SDLC).

The method is documented canonically in [AISL Docs](https://docs.aisl.science/learning-and-resources/ai-sdlc). This repository contains only the executable, repository-local
workflow artefacts. It does not contain a complete copy of the method or
application-specific code.

## Create a project

1. Select **Use this template** on GitHub and create a new repository.
2. Open the new repository in GitHub Codespaces.
3. Complete `docs/PROJECT.md` with the project context, architecture and commands.
4. Start the lifecycle with `AGENTS.md` and record progress in `docs/TASKS.md`.
5. Use `docs/specs/UC-TEMPLATE.md` for the first use-case specification.

GitHub Copilot instructions are provided in `.github/copilot-instructions.md`.
The included GitHub Actions workflows check the required AI-SDLC structure and
provide a technology-neutral source release baseline. Add project-specific
build, test and artifact-publishing steps during VALIDATE. Add a
`.github/workflows/cd.yml` is included as an inactive template and must be
configured during DEPLOY, after the deployment platform, required secrets and
post-deploy checks have been decided.

## Repository artefacts

- `AGENTS.md` — lifecycle router and guardrails
- `docs/PROJECT.md` — project context and commands
- `docs/TASKS.md` — current lifecycle state
- `docs/specs/` — executable use-case specifications
- `skills/ai-sdlc-*` — phase-specific execution guidance
- `.devcontainer/` — Codespaces and VS Code baseline
- `.vscode/` — project-specific debug configuration placeholder
- `.github/` — Copilot instructions, CI, release and CD workflow templates
