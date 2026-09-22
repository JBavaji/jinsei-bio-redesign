# Rule — Mandatory Screen Implementation Plan & Design Alignment Guardrail

> **THIS RULE IS READ BY ALL AI AGENTS (ANTIGRAVITY, GITHUB COPILOT GH-300, GITHUB AGENTIC DEVELOPER AI GH-600) BEFORE EXECUTING ANY SCREEN IMPLEMENTATION TASK.**

---

## 🏛️ Rule Definition & Scope

Whenever an AI agent plans or executes the implementation of a user interface screen or feature component:

1. **Mandatory Artifact Inspection**:
   - The AI agent **MUST** read and inspect both:
     - The target `.html` design file located in `data/modern/design/screens/<screen_name>.html`.
     - The target `.png` visual screenshot located in `data/modern/design/screenshots/<screen_name>.png`.

2. **UI Completeness Audit**:
   - Before completing implementation, the agent **MUST** cross-verify:
     - All section headers, subheadings, and badge counters.
     - Layout structures (e.g. central timeline axes, alternating left/right cards).
     - Component features (e.g. bottom CTA banners, glassmorphism cards, interactive nodes).
     - Both Dark Mode and Light Mode visual parity.

3. **Zero UI Discrepancy Standard**:
   - No feature screen shall be marked complete or merged without validating 100% parity against both the HTML design source and PNG visual reference.
