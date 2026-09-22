# Rule: GitHub Branching & Pull Request Guardrail

> **APPLIES TO ALL AI AGENTS (ANTIGRAVITY, GITHUB COPILOT GH-300, GITHUB AGENTIC DEVELOPER AI GH-600)**

---

## 🚫 PROHIBITED ACTIONS

- **DO NOT** execute direct local `git merge <feature-branch>` while checked out on `develop`, `staging`, or `main`.
- **DO NOT** execute direct `git push origin develop`, `git push origin staging`, or `git push origin main` after local merges.

---

## 🛠️ MANDATORY AI AGENTIC PR WORKFLOW

Whenever a user requests to merge a feature or bugfix branch:

1. **Pre-flight Local Verification:**
   - Execute static analysis: `flutter analyze`
   - Execute unit & widget tests: `flutter test`
   - Ensure working directory is clean and code is committed to `origin/feat/<name>` or `origin/fix/<name>`.

2. **Pull Request Creation via MCP / CLI:**
   - Use the `github` MCP server tool (`create_pull_request`) or GitHub CLI (`gh pr create`).
   - Target branch: `develop` (for integration), `staging` (for beta test), or `main` (for release).
   - PR Title format: `feat(JIN-XX): <description>` or `fix(JIN-XX): <description>`.

3. **Status Check & Approval Verification:**
   - Verify CI matrix workflow (`.github/workflows/ci-monorepo.yml` / `.github/workflows/ai-pr-review.yml`) completes with green pass (`dart analyze` clean + test coverage).
   - Await required approvals (`develop`: 1-2 approvals, `staging`: 3 approvals, `main`: 3 approvals).

4. **Automated Merge Execution:**
   - Execute merge via GitHub API tool (`merge_pull_request`) or `gh pr merge --squash` ONLY AFTER all status checks pass and approvals are granted.
