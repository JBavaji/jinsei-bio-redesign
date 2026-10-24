---
name: jinsei-feature-slice
description: Step-by-step runbook for implementing new features or refactoring existing modules in the Jinsei-Bio codebase. Enforces the 5-Stage Atomic Slicing Protocol, 3-Tier Offline-First Hive Caching, flutter_bloc lifecycle, and <150 LOC widget modularity with commit checkpoints.
---

# Jinsei Bio: Feature Slice Runbook

Use this skill whenever you are tasked with:
- Implementing a new feature, screen, or domain module in `jinsei_bio_redesign_flutter`.
- Refactoring an existing feature to conform to the monorepo architecture.
- Extending data management or UI components.

---

## 🛑 Golden Rule: Never Execute More Than 1 Stage Per Turn
Do NOT generate all files at once. Always execute one atomic stage, run its targeted test gate, commit to git, and present the checkpoint for human confirmation before advancing.

---

## Pre-Flight Check: Golden Reference Parity
Before starting Stage 1:
1. Read `lib/src/features/home/` as the ground truth.
2. Note the naming conventions:
   - Data Source: `lib/src/features/<feature>/data/datasources/<feature>_hive_data_source.dart`
   - Cache Box: `<feature>_cache_box`
   - Asset Fallback: `assets/data/<feature>_content.json`
   - Bloc: `lib/src/features/<feature>/presentation/bloc/<feature>_bloc.dart`

---

## Stage-by-Stage Execution Protocol

### 🔹 Stage 1: Domain & Data Models
1. Create model files in `lib/src/features/<feature>/data/models/`.
2. Implement `fromJson`, `toJson`, and `copyWith` methods.
3. Write unit tests in `test/features/<feature>/data/models/`.
4. Run test gate:
   ```bash
   flutter test test/features/<feature>/data/models/
   ```
5. Checkpoint commit:
   ```bash
   git commit -m "feat(<feature>): implement data models and serialization [JIN-XXX]"
   ```

---

### 🔹 Stage 2: 3-Tier Data Layer
1. Create 3 data sources:
   - `FeatureRemoteDataSource` (Serverpod Client)
   - `FeatureHiveDataSource` (Hive DB Box: `<feature>_cache_box`)
   - `FeatureLocalDataSource` (Asset JSON: `assets/data/<feature>_content.json`)
2. Implement `FeatureRepositoryImpl` enforcing 3-tier fallback order:
   `Remote API` ➔ on failure ➔ `Hive DB Cache` ➔ on empty ➔ `Bundled Asset JSON`.
3. Write unit tests for each data source.
4. Write offline edge-cases test suite (`<feature>_repository_offline_edge_cases_test.dart`).
5. Run test gate:
   ```bash
   flutter test test/features/<feature>/data/
   ```
6. Checkpoint commit:
   ```bash
   git commit -m "feat(<feature>): implement 3-tier offline-first data layer [JIN-XXX]"
   ```

---

### 🔹 Stage 3: Event-Driven BLoC Lifecycle
1. Define `Bloc<FeatureEvent, FeatureState>` with the 5-stage status enum:
   `idle`, `loading`, `loaded`, `success`, `failed`.
2. Provide boolean helper getters: `isIdle`, `isLoading`, `isLoaded`, `isSuccess`, `isFailed`.
3. Implement strongly-typed failure domain objects (e.g. `FeatureFailure`).
4. Write `bloc_test` suites covering all event transitions and network failure handling.
5. Run test gate:
   ```bash
   flutter test test/features/<feature>/presentation/bloc/
   ```
6. Checkpoint commit:
   ```bash
   git commit -m "feat(<feature>): implement bloc state lifecycle and tests [JIN-XXX]"
   ```

---

### 🔹 Stage 4: Modular Sub-Widgets (<150 LOC)
1. Deconstruct the UI into small, modular sub-component widgets under `presentation/widgets/`.
2. **STRICT LIMIT**: Maximum lines of code per widget file MUST NOT exceed 100–150 LOC.
3. Support Dark Mode (`#121414`) and Light Mode (`#FFFFFF`) via `Theme.of(context)`.
4. Write widget tests validating component layout and interaction.
5. Run test gate:
   ```bash
   flutter test test/features/<feature>/presentation/widgets/
   ```
6. Checkpoint commit:
   ```bash
   git commit -m "feat(<feature>): implement modular sub-widgets [JIN-XXX]"
   ```

---

### 🔹 Stage 5: Screen Assembly & Routing
1. Assemble sub-widgets in `presentation/screens/<feature>_screen.dart` via `BlocBuilder` / `BlocConsumer`.
2. Register the route in `app_router.dart` with URL path routing.
3. Run formatting and global checks:
   ```bash
   dart format --set-exit-if-changed .
   flutter analyze .
   flutter test test/core/architecture/offline_three_tier_contract_test.dart
   ```
4. Final stage commit:
   ```bash
   git commit -m "feat(<feature>): assemble screen and register go_router route [JIN-XXX]"
   ```
