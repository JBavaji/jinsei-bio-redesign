# GitHub Copilot & Agentic AI Instructions — Jinsei Bio Redesign

> **Target Repository:** `jbavaji/jinsei-bio-redesign`  
> **Certifications Applied:** GH-300 (GitHub Copilot) · GH-600 (GitHub Agentic Developer AI)  
> **Product Owner & Architect:** Jayeshgiri Bavaji (14+ Yrs Mobile Engineering Expert)  

---

## 🎯 Primary Directives for AI Coding

When completing code, generating suggestions, or executing agentic workflows in this repository, strictly follow these standards:

### 1. State Management & Architecture
- Use **Clean Architecture** organized by feature folder (`lib/src/features/[feature_name]/`).
- State Management **MUST** be `flutter_bloc` (`Bloc` or `Cubit`).
- Do NOT use Riverpod, Provider, or `setState` for non-UI micro state.
- Navigation **MUST** use `go_router` (`GoRouter` with `GoRoute` definitions).

### 2. Backend & Data Layer Rules
- Backend API endpoints are built with **Dart Serverpod** targeting **PostgreSQL**.
- Do NOT use Firebase Firestore for business data storage (ADR-011).
- Firebase is used ONLY for Firebase Hosting (Web), Auth delegate, FCM, Analytics, and Crashlytics.
- Auto-generated Serverpod files in `jinsei_bio_redesign_client/` and `*.g.dart` should NOT be edited manually.

### 3. Visual & Theme System (`DESIGN.md`)
- Primary Bioluminescent Green: `#66DD8B`
- Accent Emerald: `#10B981`
- Dark Background (Default): `#0A0F1E` (`ColorScheme.dark()`)
- Dark Surface Card: `#111827`
- Light Background: `#FFFFFF` (`ColorScheme.light()`)
- Theme switching is managed by `ThemeCubit`. Every widget MUST support both Dark and Light themes.

### 4. Legal Disclaimer & Unofficial Assignment Guardrails
- Respect the build flag `--dart-define=APP_MODE=UNOFFICIAL_DEMO`.
- Ensure footer components render the legal disclaimer text:
  *"Disclaimer: Independent UI/UX redesign concept by Jayeshgiri Bavaji. Not affiliated with Jinsei Bioscience Pvt. Ltd."*
- Never scrape or send live corporate data; form submissions route to sandbox environments (`jbavaji@gmail.com`).

### 5. Multi-Platform Build Targets
- Write code that compiles cleanly and renders responsively on **Web**, **Android**, and **iOS**.
- Use `LayoutBuilder` and `MediaQuery` for responsive breakpoints (Mobile: <600px, Tablet: 600–1024px, Desktop: >1024px).
