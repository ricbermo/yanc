# Neovim Config Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Improve this Neovim config in three ordered stages: stability first, then startup behavior, then daily UX consistency.

**Architecture:** Apply focused, low-risk edits in core bootstrap/options/LSP and plugin specs. Validate each stage with headless Neovim checks, then finalize with startup timing and docs updates.

**Tech Stack:** Neovim Lua config, lazy.nvim, nvim-lspconfig, mason-lspconfig, telescope, treesitter, which-key.

---

### Task 1: Branch and baseline

**Files:**
- Modify: git branch state only

**Step 1: Create working branch**

Run: `git switch -c chore/nvim-stability-maintenance`
Expected: branch created and checked out.

**Step 2: Baseline plugin resolution**

Run: `nvim --headless "+Lazy! sync" +qa`
Expected: no Lua errors during sync.

**Step 3: Baseline health check**

Run: `nvim --headless "+checkhealth" +qa`
Expected: command completes, no critical startup errors.

---

### Task 2: Stability fixes in core runtime

**Files:**
- Modify: `init.lua`
- Modify: `lua/listeners.lua`
- Modify: `lua/config/lsp_utils.lua`
- Modify: `lua/plugins/quickfix.lua`

**Step 1: Fix plugin spec key correctness**

Use `enabled = false` in lazy plugin specs where needed.

**Step 2: Make LSP attach callback nil-safe**

Return early if client lookup fails before any method access.

**Step 3: Replace deprecated buffer option API**

Use `vim.bo[bufnr].omnifunc = ...`.

**Step 4: Harden lazy bootstrap path setup**

Use clone URL fallback strategy and only prepend runtimepath when path exists.

**Step 5: Validate runtime modules**

Run:
- `nvim --headless "+lua require('listeners')" "+lua require('config.lsp_utils')" "+lua require('plugins.quickfix')" +qa`

Expected: no errors.

---

### Task 3: Option hygiene and consistency

**Files:**
- Modify: `lua/options.lua`

**Step 1: Remove contradictory and legacy option usage**

Replace `g.noswapfile`/`g.nobackup` with `opt.swapfile`/`opt.backup`.

**Step 2: Normalize high-impact defaults**

Reduce excessive `scrolloff`; remove duplicated settings.

**Step 3: Keep provider config explicit and safe**

Set `python3_host_prog` only when executable exists.

**Step 4: Validate options module**

Run: `nvim --headless "+lua require('options')" +qa`
Expected: no errors.

---

### Task 4: Lazy-loading and startup behavior

**Files:**
- Modify: `lua/plugins/telescope.lua`
- Modify: `lua/plugins/treesitter.lua`
- Modify: `lua/plugins/markview.lua`

**Step 1: Move extension load logic into plugin config**

Avoid early `require('telescope')` in init path.

**Step 2: Remove forced eager load where unnecessary**

Let event-driven loading handle treesitter.

**Step 3: Restrict markdown tooling to relevant filetypes**

Load markview only for markdown/codecompanion buffers.

**Step 4: Validate plugin load behavior**

Run:
- `nvim --headless "+Lazy! load telescope.nvim" "+Lazy! load nvim-treesitter" +qa`

Expected: no errors.

---

### Task 5: LSP UX consistency

**Files:**
- Modify: `lua/config/lsp_utils.lua`
- Modify: `lua/mappings.lua`
- Modify: `lua/options.lua`

**Step 1: Scope LSP mappings to buffer-local**

Use `buffer = bufnr` for LSP mappings to avoid global duplication.

**Step 2: Remove duplicated timeout ownership**

Keep timeout definition in one place (`options.lua`).

**Step 3: Validate mapping modules**

Run:
- `nvim --headless "+lua require('mappings')" "+lua require('config.lsp_utils')" +qa`

Expected: no errors.

---

### Task 6: Documentation updates

**Files:**
- Modify: `README.md`
- Create: `docs/plans/2026-03-14-neovim-config-design.md`
- Create: `docs/plans/2026-03-14-neovim-config-implementation.md`

**Step 1: Update minimum version and requirements clarity**

Align README requirements with current Neovim API usage.

**Step 2: Add troubleshooting guidance**

Document `Lazy! sync` and `checkhealth` as first-line diagnostics.

**Step 3: Verify docs formatting**

Review markdown rendering and command correctness.

---

### Task 7: Final verification

**Files:**
- Modify: none (verification only)

**Step 1: Run end-to-end checks**

Run:
- `nvim --headless "+Lazy! sync" +qa`
- `nvim --headless "+checkhealth" +qa`
- `nvim --startuptime startup.log +qa`

Expected: commands complete without startup Lua errors.

**Step 2: Inspect git working tree**

Run: `git status --short`
Expected: only intended files changed.

**Step 3: Optional commit batch**

Commit in logical chunks (stability, performance, UX, docs).
