# Security Policy — Jinsei Bio Redesign

> **Target Repository:** `jbavaji/jinsei-bio-redesign`  
> **Security Contact:** Jayeshgiri Bavaji (`jbavaji@gmail.com`)  
> **Certifications Applied:** GH-300 (GitHub Copilot) · GH-600 (GitHub Agentic Developer AI)  

---

## 🔒 Supported Versions

We actively maintain and provide security patches for the following versions:

| Version | Supported | Notes |
| :--- | :---: | :--- |
| `1.9.x` / `1.8.x` | ✅ Yes | Current active release branch (`main` / `staging`) |
| `< 1.8.0` | ❌ No | Deprecated development iterations |

---

## 🛡️ Reporting a Vulnerability

We take the security and integrity of the **Jinsei Bio Redesign** platform seriously. If you discover a security vulnerability, we appreciate your help in disclosing it to us responsibly.

### 1. How to Report
- **DO NOT** report security vulnerabilities via public GitHub issues, discussions, or pull requests.
- Please email your report directly to **Jayeshgiri Bavaji** at [`jbavaji@gmail.com`](mailto:jbavaji@gmail.com) with the subject line:
  `[SECURITY VULNERABILITY] Jinsei Bio Redesign - <Brief Description>`
- If you prefer encrypted communication, please request our GPG public key via email before sending sensitive details.

### 2. What to Include in Your Report
To help us triage and resolve the issue quickly, please provide:
- Type of issue (e.g., buffer overflow, SQL injection, cross-site scripting, credential leakage, privilege escalation).
- Clear step-by-step instructions or proof-of-concept (PoC) to reproduce the vulnerability.
- Affected components (e.g., Flutter Web frontend, Dart Serverpod API, PostgreSQL database migrations, GitHub Actions workflows).
- Potential impact and severity assessment.

### 3. Response & Triage SLA
- **Initial Acknowledgment:** Within **24 hours** of receiving the report.
- **Triage & Severity Assessment:** Within **48 hours**.
- **Remediation & Patch Target:** Critical vulnerabilities are addressed within **5 business days** and released via expedited staging-to-production hotfixes.

---

## ⚖️ Responsible Disclosure & Bug Bounty Guidelines

When investigating vulnerabilities, please adhere strictly to these principles:
- **Sandbox Data Isolation:** Never attempt to access or modify real corporate data or submit live data to corporate `@jinseibio.com` addresses. All test traffic must remain confined to sandbox environments (`jbavaji@gmail.com` / PostgreSQL local/staging).
- **No Service Disruption:** Avoid destructive testing, Denial of Service (DoS/DDoS), or resource exhaustion attacks against production or staging Cloud Run endpoints.
- **Privacy:** Respect user privacy. If sensitive information is inadvertently accessed, stop and report immediately without copying or retaining data.
- **Coordinated Disclosure:** Allow the maintainers reasonable time to remediate the vulnerability before public disclosure.

---

## 🛡️ Repository Security & Push Protection

This repository strictly enforces:
- **GitHub Secret Scanning & Push Protection:** Blocks commits containing API keys, private certificates, or cloud credentials.
- **Branch Protection Rulesets:** Multi-approver sign-off gates on `main`, `staging`, and `develop`.
- **Immutable Toolchain Pinning:** Build actions pin explicit CLI toolchain versions to prevent supply-chain attacks.
