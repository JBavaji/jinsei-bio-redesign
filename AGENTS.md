# AGENTS.md — Root Universal AI Agent Instruction & Context

> **THIS FILE IS READ BY ALL AI AGENTS (ANTIGRAVITY, GITHUB COPILOT GH-300, GITHUB AGENTIC DEVELOPER AI GH-600) BEFORE EXECUTING ANY TASK.**

---

## 🏛️ Project Identity & Leadership

- **Repository Target:** `jbavaji/jinsei-bio-redesign`
- **Product Owner & Product Architect:** **Jayeshgiri Bavaji** (`jbavaji@gmail.com` \| `+91 96018 33544`)
- **Domain Background:** 14+ Years Mobile Engineering Expert (Flutter, React Native, Native Android)
- **AI Certifications:** GH-300 (GitHub Copilot) · GH-600 (GitHub Agentic Developer AI)
- **Executive & Departmental Leads:**
  - **Elena Rostova** (CEO) — Company Strategy & Agile Operations
  - **Dr. Marcus Vance** (Co-CTO) — Infrastructure, Cloud Run & PostgreSQL
  - **Sophia Lin** (Co-CTO) — AI Systems & Agentic Orchestration
  - **David K. Miller** (Architect) — Systems Architecture & ADR Governance
  - **Karan Sharma** (Frontend Lead) — Flutter Web/Android/iOS (`flutter_bloc`)
  - **Alexey Volkov** (Backend Lead) — Dart Serverpod & PostgreSQL
  - **Chloe Dupont** (Design Lead) — Stitch UI/UX & `DESIGN.md`
  - **Marcus Brody** (DevOps Lead) — GitHub Actions Matrix & Fastlane
  - **Rachel Adams** (QA Lead) — Definition of Done & Automated Test Gates

---

## 📁 Core Context References

Before executing code, AI agents MUST reference:
- **Company Context & Roles:** [`@development/company-context/ORGANIZATION_OVERVIEW.md`](file:///Users/jbavaji/Documents/work/2026/Jinsei-Bio/development/company-context/ORGANIZATION_OVERVIEW.md)
- **Real Human Owner Profile:** [`@development/company-context/REAL_HUMAN_OWNER.md`](file:///Users/jbavaji/Documents/work/2026/Jinsei-Bio/development/company-context/REAL_HUMAN_OWNER.md)
- **Agile Lifecycle & Epics:** [`@development/agile-project-management/AGILE_MASTER_INDEX.md`](file:///Users/jbavaji/Documents/work/2026/Jinsei-Bio/development/agile-project-management/AGILE_MASTER_INDEX.md)
- **AI SDLC Knowledge Base:** [`@development/ai-sdlc-knowledge-base/README.md`](file:///Users/jbavaji/Documents/work/2026/Jinsei-Bio/development/ai-sdlc-knowledge-base/README.md)
- **Tech Stack Architecture:** [`@development/ai-sdlc-knowledge-base/02-tech-stack/TECH_ARCHITECTURE.md`](file:///Users/jbavaji/Documents/work/2026/Jinsei-Bio/development/ai-sdlc-knowledge-base/02-tech-stack/TECH_ARCHITECTURE.md)
- **Design Tokens & Screens:** `@data/modern/design/DESIGN.md` & `@data/modern/design/screens/`

---

## ⚖️ LEGAL & BRAND RULES (UNOFFICIAL ASSIGNMENT GUARDRAILS)

1. **Unofficial Redesign Disclaimer**:
   - Every public/demo web build and app layout MUST include a disclaimer banner/footer:
     > *"Disclaimer: This project is an independent UI/UX redesign assignment & technical proof-of-concept created by Jayeshgiri Bavaji. It is not officially affiliated with or endorsed by Jinsei Bioscience Pvt. Ltd."*
   - Code logic MUST support the build flag `--dart-define=APP_MODE=UNOFFICIAL_DEMO`.

2. **Frozen Brand Assets**:
   - The official Jinsei Bioscience logo files (`assets/images/logo/`) are **FROZEN**. Never modify, alter, or synthesize derivative logos.
   - Primary Brand Colors: `#66DD8B` (bioluminescent green), `#10B981` (emerald), `#0A0F1E` (dark obsidian).

3. **Data Sandbox Guardrail**:
   - Form endpoints (e.g. B2B requests) MUST route to development sandbox environments (`jbavaji@gmail.com` / PostgreSQL staging DB). NEVER route test data to `@jinseibio.com` corporate inboxes.

---

## 🛠️ ARCHITECTURAL NON-NEGOTIABLES

1. **State Management:** MUST use `flutter_bloc` (`flutter_bloc` package with `Bloc` or `Cubit`). NEVER use Riverpod, Provider, or raw `setState` for business logic.
2. **Navigation:** MUST use `go_router` for all routing (Web URL support + deep linking).
3. **Backend Stack:** MUST use Dart **Serverpod** + **PostgreSQL** for core business data. NEVER store business data in Firebase Firestore (ADR-011).
4. **Theme Support:** MUST support both **Dark Mode** (`#0A0F1E` default) and **Light Mode** (`#FFFFFF`) driven by `ThemeCubit`.
5. **Launch Priority:** **Splash / Launch Screen** (Priority 0) with centered logo redesign animation MUST be implemented and verified across Web, Android, and iOS before any feature screens are built (ADR-010).
