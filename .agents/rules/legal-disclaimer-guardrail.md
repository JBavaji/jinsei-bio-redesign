# Custom Rule: Unofficial Redesign Legal & Brand Guardrails

> **Target Repository:** `jbavaji/jinsei-bio-redesign`  
> **Status:** Unofficial UI/UX Redesign Assignment & Technical Proof-of-Concept  

---

## ⚖️ MANDATORY LEGAL RULES FOR ALL AGENTS

1. **Unofficial Redesign Disclaimer**:
   - Every public web build, demo layout, and app footer MUST render the legal disclaimer text:
     > *"Disclaimer: Independent UI/UX redesign concept created by Jayeshgiri Bavaji. Not officially affiliated with or endorsed by Jinsei Bioscience Pvt. Ltd."*
   - Code logic MUST read `--dart-define=APP_MODE=UNOFFICIAL_DEMO`.

2. **Frozen Brand Assets Protection**:
   - Logo files in `assets/images/logo/` are **FROZEN**. AI agents MUST NEVER synthesize, modify, or rewrite brand logo assets.
   - Primary Brand Colors are canonical: `#66DD8B` (bioluminescent green), `#10B981` (emerald), `#0A0F1E` (dark obsidian).

3. **Data Sandbox Isolation**:
   - Form endpoints (e.g. B2B sample requests) MUST route to development sandbox environments (`jbavaji@gmail.com` / PostgreSQL staging DB).
   - NEVER route test data to `@jinseibio.com` corporate inboxes.
