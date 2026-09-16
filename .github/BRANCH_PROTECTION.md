# Branch Protection & Governance Specification — Jinsei Bio Redesign

> **Target Repository:** `jbavaji/jinsei-bio-redesign`  
> **Enforced Branch Model:** `main` (Production), `staging` (Testing), `develop` (Development), `develop/feat-XXX` (Feature Branches)  

---

## 🌿 4-Tier Branch Model & Commit Conventions

```
main (Production)             ◄── PR (Release V1.0.0) ─── staging
                                                            ▲
staging (Testing)             ◄── PR (Testing V1.0.0-rc1) ─┤
                                                            develop
develop (Development)         ◄── PR (feat: JIN-xx) ───────┤
                                                            develop/feat-XXX
develop/feat-XXX (Feature)    ── (Feature commits)
```

| Branch Tier | Purpose | Commit Message Format | Deployment Target |
| --- | --- | --- | --- |
| **`main`** | Production Releases | `Release VX.X.X` (e.g. `Release V1.0.0`) | Simultaneous Web + Play Store + App Store |
| **`staging`** | QA Integration & Testing | `Testing VX.X.X` (e.g. `Testing V1.0.0-rc1`) | Firebase Hosting Staging + Cloud Run Staging DB |
| **`develop`** | Active Feature Integration | `feat: JIN-xx [description]` | Continuous Integration Build Validation |
| **`develop/feat-XXX`** | Feature / Story Execution | `feature xxxx` / `feat: [scope] description` | Local / Feature Preview |

---

## 🛡️ Recommended GitHub Branch Protection Settings

Configure these rules in GitHub Repository Settings (`Settings -> Branches -> Add branch protection rule`):

### 1. Protection Rules for `main` Branch (Production)

- [x] **Require a pull request before merging**
  - Required approvals: **1** (Product Owner Jayeshgiri Bavaji sign-off)
  - Require review from Code Owners
  - Dismiss stale pull request approvals when new commits are pushed
- [x] **Require status checks to pass before merging**
  - `Ubuntu: Monorepo Analyze, Test, Web & Android Build`
  - `macOS: iOS Build Verification`
  - `Security Scan & Secret Audit`
- [x] **Require conversation resolution before merging**
- [x] **Require linear history** (Squash & Merge)
- [x] **Enforce commit message pattern:** `Release V*`
- [x] **Do not allow bypassing settings** (Enforced for all administrators)

---

### 2. Protection Rules for `staging` Branch (Testing)

- [x] **Require a pull request before merging**
  - Required approvals: **1** (QA Lead Rachel Adams or DevOps Lead Marcus Brody)
  - Dismiss stale pull request approvals when new commits are pushed
- [x] **Require status checks to pass before merging**
  - `Ubuntu: Monorepo Analyze, Test, Web & Android Build`
  - `macOS: iOS Build Verification`
- [x] **Require conversation resolution before merging**
- [x] **Enforce commit message pattern:** `Testing V*`

---

### 3. Protection Rules for `develop` Branch (Development)

- [x] **Require a pull request before merging**
  - Required approvals: **1** (Department Lead persona: Karan Sharma / Alexey Volkov)
- [x] **Require status checks to pass before merging**
  - `Ubuntu: Monorepo Analyze, Test, Web & Android Build`
- [x] **Require conversation resolution before merging**
- [x] **Require linear history**

---

## 📋 Definition of Done (DoD) & Review SLA Guardrails

- **Review SLA:** All PRs must be reviewed within 24 hours. Stale PRs (>48 hours) are flagged by Virtual Scrum Master AI.
- **AI Pre-Review Check:** Automated Antigravity pre-review checks DESIGN.md token usage, zero `print()` statements, `dart analyze` clean pass, and test coverage delta before human review.
- **Legal Banner Check:** Every UI feature PR MUST verify disclaimer banner rendering under `--dart-define=APP_MODE=UNOFFICIAL_DEMO`.
