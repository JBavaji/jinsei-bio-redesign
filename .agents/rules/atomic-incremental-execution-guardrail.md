# Custom Rule: Atomic Incremental Execution Guardrail

> **Target Repository:** `jbavaji/jinsei-bio-redesign`  
> **Rule Scope:** All Feature Implementations, Refactoring, and Cross-Cutting Architectural Changes  
> **Authority:** Product Owner & Lead Architect (Jayeshgiri Bavaji)

---

## 🚫 BAN ON MONOLITHIC "ALL-IN-ONE-GO" EXECUTION

AI Agents are **STRICTLY PROHIBITED** from generating or modifying an entire feature or screen across all layers (models, datasources, repositories, blocs, widgets, and router) in a single conversational turn or single git commit. 

Batching multi-layer or multi-page changes creates unreviewable PRs, destroys git revertability, multiplies test debugging loops, and causes context compaction.

---

## 🛡️ THE 5-STAGE ATOMIC SLICING PROTOCOL

Every new feature screen or architectural modification MUST proceed sequentially through the following **5 Atomic Stages**. Each stage MUST be implemented, verified green via tests, and checkpointed with an atomic git commit before proceeding to the next stage:

```text
[Stage 1: Models]  ──(pass & commit)──> [Stage 2: 3-Tier Data] ──(pass & commit)──> 
[Stage 3: BLoC]    ──(pass & commit)──> [Stage 4: Sub-Widgets]  ──(pass & commit)──> 
[Stage 5: Screen Assembly & Routing]
```

### Stage 1: Domain & Data Models
- Define strongly-typed model classes, JSON serialization (`fromJson`/`toJson`), and factory constructors.
- Write unit tests verifying round-trip JSON serialization and schema edge cases.
- **Verification Gate:** `flutter test test/features/<feature>/data/models/` must pass.
- **Git Checkpoint:** `git commit -m "feat(<feature>): implement data models and serialization [JIN-XXX]"`

### Stage 2: 3-Tier Offline-First Data Layer
- Implement `FeatureRemoteDataSource` (Serverpod), `FeatureHiveDataSource` (Hive DB), and `FeatureLocalDataSource` (Asset JSON).
- Implement `FeatureRepositoryImpl` enforcing the 3-Tier Fallback:
  $$\text{Remote} \longrightarrow \text{Local Hive DB} \longrightarrow \text{Asset JSON}$$
- Write unit tests for all 3 data sources and an offline edge-cases test suite for the repository.
- **Verification Gate:** `flutter test test/features/<feature>/data/` must pass.
- **Git Checkpoint:** `git commit -m "feat(<feature>): implement 3-tier offline-first data layer [JIN-XXX]"`

### Stage 3: Event-Driven BLoC Lifecycle
- Define `Bloc<Event, State>` with the 5-stage status lifecycle (`idle`, `loading`, `loaded`, `success`, `failed`) and boolean getters.
- Implement event handlers with strongly-typed `Failure` mappings.
- Write `bloc_test` suites covering all event-to-state transitions and network error fallbacks.
- **Verification Gate:** `flutter test test/features/<feature>/presentation/bloc/` must pass.
- **Git Checkpoint:** `git commit -m "feat(<feature>): implement bloc state lifecycle and tests [JIN-XXX]"`

### Stage 4: Modular Sub-Widgets (<150 LOC)
- Break the UI into dedicated, self-contained sub-component widgets under `presentation/widgets/`.
- STRICT RULE: No widget file may exceed 100–150 lines of code.
- Write widget tests for interactive sub-components verifying light/dark theme tokens and tap interactions.
- **Verification Gate:** `flutter test test/features/<feature>/presentation/widgets/` must pass.
- **Git Checkpoint:** `git commit -m "feat(<feature>): implement modular sub-widgets [JIN-XXX]"`

### Stage 5: Screen Assembly & Routing
- Assemble the sub-widgets into the main `FeatureScreen` connected via `BlocBuilder` / `BlocConsumer`.
- Register the route in `app_router.dart` (`go_router`) with Web URL path support.
- Write end-to-end screen integration test and verify responsive layouts (mobile + desktop).
- **Verification Gate:** Full feature test pass + `dart format --set-exit-if-changed .` + `flutter analyze .` (0 issues).
- **Git Checkpoint:** `git commit -m "feat(<feature>): assemble screen and register go_router route [JIN-XXX]"`

---

## 🔍 MANDATORY PRE-FLIGHT GOLDEN BASELINE AUDIT

Before initiating Stage 1 for any feature, the AI Agent MUST:
1. View the Golden Reference implementation: [`lib/src/features/home/`](file:///Users/jbavaji/Documents/work/2026/Jinsei-Bio/development/jinsei-bio-redesign/jinsei_bio_redesign_flutter/lib/src/features/home/).
2. Confirm 1:1 structural parity with `home/`:
   - Remote DS (Serverpod endpoint)
   - Hive DS (`home_content_box` equivalent)
   - Asset DS (`home_content.json` equivalent)
   - Repository implementation & Failure domain classes
   - BLoC event/state classes & sub-widgets directory
3. State the audit findings in the conversation before writing any code.

---

## 🎯 THE 5 EXECUTION INVARIANTS
Every step executed by an AI Agent MUST satisfy:
1. **Traceable:** 1 module/layer per step, tied to Jira issue key.
2. **Revertable:** `git revert <sha>` will cleanly undo only that slice without cascading breakages.
3. **Understandable:** Diffs <150 LOC per increment for effortless code review.
4. **Error-less:** Test suite for the current slice must be green before touching the next slice.
5. **Outcome-Rich:** Continuous checkpoint commits protect completed work against compaction or disruption.
