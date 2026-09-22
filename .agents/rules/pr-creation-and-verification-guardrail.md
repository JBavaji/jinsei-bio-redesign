# PR Creation & Local Run Verification Guardrail

> **MANDATORY RULE FOR ALL AI AGENTS WORKING ON THIS REPOSITORY**

---

## 1. Feature Branch Commit vs PR Creation
- **Commits and Pushes (`git push origin feat/*`)**: Pushing commits to a feature branch is standard procedure for incrementally backing up and tracking work in progress on that feature branch.
- **Pull Request Creation (`create_pull_request` / `gh pr create`)**: A Pull Request MUST NOT be created for every individual commit or minor code edit.
- **PR Timing**: A Pull Request MUST ONLY be opened when:
  1. The entire feature or bugfix scope defined by the epic/ticket is 100% complete.
  2. All automated tests (`flutter test`) pass with zero errors.
  3. The application has been run locally and visually verified on the target screen/route.
  4. Explicit request to request merging the feature branch into `develop` is made.

---

## 2. Local Run Verification Requirement
Before opening a PR or marking a feature as ready for merge review, AI agents MUST:
1. Ensure the application is running locally (e.g., `flutter run -d web-server --web-port 8080`).
2. Verify that all code changes actually reflect on the running application UI without errors or missing styles.
3. If hot reload/restart is unavailable, restart the local dev server so the freshly compiled code bundle is served.
