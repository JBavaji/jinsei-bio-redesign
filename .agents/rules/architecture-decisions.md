# Custom Rule: Architectural Decision Records (ADR) Governance

> **Target Repository:** `jbavaji/jinsei-bio-redesign`  
> **Reference Document:** `@development/ai-sdlc-knowledge-base/06-architecture-decisions/ADR_INDEX.md`  

---

## 🛠️ ARCHITECTURAL NON-NEGOTIABLES

Every AI agent generating, modifying, or reviewing code in this codebase MUST strictly observe the following ADR rules:

1. **ADR-005 (State Management):**
   - MUST use `flutter_bloc` (`Bloc` or `Cubit`).
   - NEVER use Riverpod, Provider, or `setState` for business logic.

2. **ADR-008 (Web Hosting & Delivery):**
   - Flutter Web is deployed via **Firebase Hosting** (staging & production).

3. **ADR-010 (Multi-Platform Launch Priority):**
   - The **Redesigned Splash Screen (Priority 0)** MUST be implemented, verified, and passing on Web, Android, and iOS before any feature screen development begins.

4. **ADR-011 (Backend Stack):**
   - Core business data MUST be stored in Dart **Serverpod** + **PostgreSQL**.
   - NEVER store business data in Firebase Firestore.

5. **Theme Support:**
   - Dark Mode (`#0A0F1E` default) and Light Mode (`#FFFFFF`) MUST be driven by `ThemeCubit`.
