## 📌 Pull Request Overview & Architectural Context
- **Jira Issue:** [JIN-XX](https://jinsei-bio.atlassian.net/browse/JIN-XX)
- **Target Branch:** `develop` / `staging` / `main`
- **Component Scope:** `[Frontend / Backend / Shared / CI-CD / Governance]`

---

## 🛠️ Summary of Changes
- 

---

## 🏛️ Executive Sign-Off & DoD Checklist

### 1. Legal, Brand & Data Safety (CEO — Elena Rostova)
- [ ] **Unofficial Redesign Disclaimer:** Rendered on all views & footers (`--dart-define=APP_MODE=UNOFFICIAL_DEMO`).
- [ ] **Frozen Brand Assets:** Official logo files unaltered (`assets/images/logo/`).
- [ ] **Data Sandbox Isolation:** Form submissions route to sandbox (`jbavaji@gmail.com`), zero corporate `@jinseibio.com` leakage.

### 2. Infrastructure, Cloud Run & DB (Co-CTO — Dr. Marcus Vance)
- [ ] **PostgreSQL Schema:** All domain entity tables defined and migrations generated/applied cleanly.
- [ ] **Zero Credential Leakage:** No keys, tokens, or plain-text credentials committed.
- [ ] **Rollback Safety:** Rollback procedure verified for target environment.

### 3. AI Architecture & Toolchain Determinism (Co-CTO — Sophia Lin)
- [ ] **Pinned Toolchains:** CI workflows specify pinned versions (e.g. `firebaseToolsVersion: '15.34.0'`), zero floating `@latest`.
- [ ] **3-Tier Fallback:** Client data layers implement Remote ➔ Bundled JSON ➔ In-Memory cache.
- [ ] **GH-300 & GH-600 Compliance:** Conforms to `.github/copilot-instructions.md`.

### 4. Systems Architecture & Code Quality (Enterprise Architect — David K. Miller)
- [ ] **Clean Architecture:** Domain, Data, Presentation layers properly decoupled.
- [ ] **BLoC Pattern:** Pure event-driven `Bloc<Event, State>` with 5-stage status lifecycle (`idle`, `loading`, `loaded`, `success`, `failed`).
- [ ] **Modularity:** Widgets kept under 150 lines per component file.

### 5. Automated Quality Gates (QA Lead — Rachel Adams)
- [ ] `flutter analyze --no-fatal-infos` passed with **0 issues**.
- [ ] `flutter test` passed with **100% green suite**.
- [ ] `dart test` (Serverpod) passed.
- [ ] `dart format .` verified (0 unformatted files).
- [ ] Semantic version bumped in `pubspec.yaml`.

---

## 🧪 Verification Receipts
```bash
# Paste verification commands and terminal outputs here:
```
