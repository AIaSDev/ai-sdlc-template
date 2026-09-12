# AI-SDLC Project Template

Starter repository for student and teaching projects that use the AI-Assisted
Software Development Life Cycle (AI-SDLC).

The method is documented canonically in [AISL Docs](https://docs.aisl.science/learning-and-resources/ai-sdlc). This repository contains only the executable, repository-local
workflow artefacts. It does not contain a complete copy of the method or
application-specific code.

## Create a project

1. Select **Use this template** on GitHub and create a new repository.
2. Open the new repository in GitHub Codespaces and run the agent setup below.
3. Complete `docs/PROJECT.md` with the project context, architecture and commands.
4. Start the lifecycle with `AGENTS.md` and record progress in `docs/TASKS.md`.
5. Use `docs/specs/UC-TEMPLATE.md` for the first use-case specification.

GitHub Copilot instructions are provided in `.github/copilot-instructions.md`.
The included GitHub Actions workflows check the required AI-SDLC structure and
provide a technology-neutral source release baseline. Add project-specific
build, test and artifact-publishing steps during VALIDATE.
`.github/workflows/cd.yml` is included as an inactive template and must be
configured during DEPLOY, after the deployment platform, required secrets and
post-deploy checks have been decided.

## Agent setup

Codespaces creates a Python development container with Python, Pylance,
debugging and GitHub Copilot extensions. It also prepares `.agents/skills` and
the Python environment automatically. The default terminal locale is English;
the VS Code UI uses its own user display-language setting.

Run `bash scripts/setup-skills.sh` from the repository root when another agent
is used. Run `bash scripts/setup-python.sh` again when the Python environment
needs to be recreated or refreshed.
Choose `copilot`, `codex`, `claude`, `cline`, `opencode`, `cursor`, `kiro`,
`junie`, `devin` or `all`. The script links to the canonical `skills/` directory and
falls back to copying if links are unavailable. Existing destinations are kept;
copies must be refreshed manually after skill changes. Verify discovery in your
agent; setup does not install or configure the agent itself.

For non-interactive setup, pass the same selection, for example `bash scripts/setup-skills.sh copilot`. The `claude` and `all` selections also create a missing `CLAUDE.md` containing `@AGENTS.md`; an existing file is preserved. Shared instructions and skills are not modified.

## Repository artefacts

- `AGENTS.md` — lifecycle router and guardrails
- `docs/PROJECT.md` — project context and commands
- `docs/TASKS.md` — current lifecycle state
- `docs/specs/` — executable use-case specifications
- `skills/ai-sdlc-*` — phase-specific execution guidance
- `.devcontainer/` — Codespaces and VS Code baseline
- `environments/python/` — Python environment profile, including the source
  VS Code debug configuration
- `scripts/setup-python.sh` — Python environment and dependency setup
- `.github/` — Copilot instructions, CI, release and CD workflow templates
