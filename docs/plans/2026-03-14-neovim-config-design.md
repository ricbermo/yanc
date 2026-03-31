# Neovim Config Improvement Design

## Context

This repository is a personal Neovim configuration using lazy.nvim and modular Lua files.
The current state has a few high-impact stability issues (invalid plugin spec keys, nil-safety risks, old API usage), plus some startup and UX consistency opportunities.

## Goals

1. Improve stability and maintenance first.
2. Improve startup behavior without changing core workflows.
3. Improve daily UX consistency (LSP/keymaps/discoverability).

## Non-Goals

1. No major plugin ecosystem migration.
2. No lockfile-wide plugin upgrades in this effort.
3. No visual redesign of the entire setup.

## Approach (Approved)

### Approach 1: Incremental hardening (recommended and selected)

- Fix fragile behavior and deprecations first.
- Apply targeted performance changes next.
- Refine workflow ergonomics last.

This minimizes risk, keeps behavior predictable, and gives immediate reliability gains.

### Rejected alternatives

- Full structural refactor first: higher risk and larger blast radius.
- Performance-first pass: could leave functional fragility unresolved.

## Design by Phase

### Phase A: Stability and maintenance

- Normalize lazy.nvim plugin spec keys (`enabled` vs `enable`).
- Make `LspAttach` logic nil-safe before method checks.
- Replace deprecated buffer option APIs with current APIs.
- Harden lazy.nvim bootstrap path handling and clone URL behavior.
- Clean contradictory and legacy editor options.

### Phase B: Startup and lazy loading

- Ensure plugin extension loading happens in plugin `config`, not early `init` paths.
- Remove eager loading where not strictly required.
- Keep lockfile constraints stable while improving load timing.

### Phase C: Daily UX consistency

- Scope LSP keymaps to the attached buffer to avoid global duplication.
- Align timeout and keymap behavior across modules.
- Keep mappings coherent and predictable with which-key.

## Validation Strategy

- Headless plugin sync and load checks.
- Headless health checks.
- Runtime module load smoke checks.
- Final startup timing snapshot.

## Risks and Mitigations

- Risk: Startup regressions after lazy-loading changes.
  - Mitigation: compare behavior with headless smoke checks and startup report.

- Risk: Keymap regressions due to LSP scope changes.
  - Mitigation: validate mappings after LSP attach on real buffers.
