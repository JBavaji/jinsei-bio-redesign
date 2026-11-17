# Custom Rule: Clean Architecture & Repository Standard

> **Target Repository:** `jbavaji/jinsei-bio-redesign`  
> **Rule Scope:** All Feature Screens & Data Management Implementations

---

## 🏛️ CLEAN ARCHITECTURE & REPOSITORY PATTERN NON-NEGOTIABLE RULE

Whenever an AI Agent plans, designs, implements, or refactors data fetching logic for any new or existing feature screen in this codebase, the following **Repository Architecture Standard** MUST be strictly enforced:

### 1. Abstract Interface Contract (`IScienceRepository` / `IFeatureRepository`)
- Every feature data layer MUST define an abstract interface class (e.g. `abstract interface class IFeatureRepository`) under `domain/repositories/`.
- Concrete implementations under `data/repositories/` MUST implement this contract.
- BLoCs and Presentation components MUST depend ONLY on the abstract interface (`IFeatureRepository`), enabling Dependency Inversion (SOLID) and unit test mocking.

### 2. Mandatory 3-Tier Data Source Separation (`data/datasources/`)
Data fetching mechanisms MUST NOT be embedded directly within Models or Repositories. Every feature repository MUST strictly implement the **3-Tier Offline-First Strategy**:
- **Tier 1 (Remote):** `FeatureRemoteDataSource` — Executes remote backend network requests via Dart Serverpod Client (`client.<endpoint>`).
- **Tier 2 (Local DB Cache):** `FeatureHiveDataSource` — Persists and retrieves fresh payloads to/from a dedicated local Hive box (`feature_cache_box`). `SharedPreferences` or in-memory stubs are STRICTLY PROHIBITED for business data caching.
- **Tier 3 (Bundled Asset Fallback):** `FeatureLocalDataSource` — Loads and parses the factory bundled `.json` asset (`rootBundle.loadString`) for cold-launch offline fallback.
- **Golden Reference Parity:** Prior to writing any data layer code, the AI Agent MUST inspect `lib/src/features/home/` as the canonical golden reference and adhere to its exact structure.
- **Fallback Execution Order:** Tier 1 Remote ➔ on network/server error ➔ Tier 2 Hive DB Cache ➔ on cache miss/empty ➔ Tier 3 Bundled Asset JSON.

### 3. Structured Failure Handling (`FeatureFailure`)
- Silent `try ... catch (_)` returning empty fallbacks is STRICTLY PROHIBITED.
- Define strongly-typed `Failure` domain objects (e.g., `FeatureAssetLoadFailure`, `FeatureNetworkFailure`, `FeatureParseException`).
- Expose clear error messages so BLoC and UI can render error states and retry actions cleanly.

### 4. 5-Stage Data Status Lifecycle & Getters
- Feature state classes MUST represent the production data lifecycle using a 5-stage status enum:
  - `idle`: Uninitialized initial state before data fetch begins.
  - `loading`: Active data retrieval in progress.
  - `loaded`: Data successfully retrieved.
  - `success`: User action or state modification completed successfully.
  - `failed`: Data retrieval or action failed with `errorMessage`.
- State classes MUST include boolean helper getters: `isIdle`, `isLoading`, `isLoaded`, `isSuccess`, `isFailed`.
