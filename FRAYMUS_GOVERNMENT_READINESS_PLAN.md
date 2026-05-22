# FRAYMUS Government Readiness Plan

Status: evidence-generation roadmap, not certification  
Updated: 2026-05-22

## Positioning

FRAYMUS can generate procurement and evaluation artifacts inside the single-file application. These artifacts support a future government evaluation, but they do not by themselves establish FIPS, FedRAMP, NIAP, Common Criteria, or DoD STIG certification.

## Required External Validation

- FIPS 140-2/140-3: requires a defined cryptographic module boundary and CMVP validation through the NIST/CCCS program.
- FedRAMP: requires an authorization package and agency or program authorization workflow for applicable cloud services.
- NIAP/Common Criteria: requires an evaluation path and accredited lab review.
- STIG: requires target-environment assessment against the applicable baseline.

## Phase 1: Cryptographic Readiness

- Keep NIST-approved algorithm markers separate from FIPS module validation claims.
- Use PBKDF2-HMAC-SHA-256 as the browser-native WebCrypto password-verifier baseline.
- Document that production deployments should use a validated crypto module when FIPS is required.
- Keep phi-harmonic crypto as analytics/research, not password storage.

## Phase 2: Auditability

- Maintain a hash chain for audit entries.
- Maintain a Merkle-style root over audit hashes.
- Export SIEM-friendly CEF logs.
- Redact sensitive fields before log storage.

## Phase 3: Supply Chain

- Export SPDX 2.3 SBOM.
- Export CycloneDX 1.5 SBOM.
- Add reproducible build notes and static verification outputs.

## Phase 4: Formal Methods Evidence

- Export TLA+ model skeleton.
- Export SMT-LIB constraints.
- Export Coq proof stubs.
- Treat all generated proofs as stubs until verified by the target toolchain.

## Phase 5: Assessor Package

- Collect SFA parser checks.
- Collect onclick handler checks.
- Collect crypto audit results.
- Collect SBOM exports.
- Collect audit-chain verification output.
- Collect Java Engine V2 compile and persistence probe results.

## Success Criteria

The app is ready for evaluator conversation when it can produce:

- A clean syntax/button wiring report.
- A CMVP readiness JSON package that clearly says external validation is required.
- A verified audit chain with a Merkle root.
- SPDX and CycloneDX SBOMs.
- Formal-method stubs.
- A limitations section that does not overclaim certification.
