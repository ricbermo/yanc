# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Overview

YANC (Yet Another NeoVim Config) is a personal Neovim configuration built with Lazy.nvim plugin manager. It focuses on modern development workflows with LSP support, testing integration, and AI-powered code assistance.

## Essential Commands

### Plugin Management
- `nvim --headless "+Lazy! sync" +qa` - Install/sync all plugins (used during setup)
- `:Lazy install` - Install missing plugins
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Sync plugins (install missing, update existing)
- `:Lazy clear` - Remove unused plugins

### Code Formatting & Linting
- `stylua .` - Format Lua files using StyLua (config in `.stylua.toml`)
- `stylua --check .` - Check formatting without making changes

### Health Check
- `:checkhealth` - Check Neovim health and plugin status

### Testing (when neotest is configured)
- `<leader>tf` - Run tests in current file
- `<leader>ts` - Toggle test summary
- `<leader>to` - Open test output

## Architecture

### Core Structure
- `init.lua` - Entry point that bootstraps Lazy.nvim and loads core modules
- `lua/` - Main configuration directory with modular organization
  - `options.lua` - Vim options and global settings
  - `mappings.lua` - Key bindings using which-key
  - `listeners.lua` - Autocommands and event handlers
  - `utils.lua` - Helper functions and shared utilities
  - `diagnostics.lua` - LSP diagnostics configuration
  - `capabilities.lua` - LSP capabilities setup

### Plugin Configuration
- `lua/config/` - Complex plugin configurations
  - `plugin_manager.lua` - Lazy.nvim setup and UI customization
  - `lsp_utils.lua` - LSP utilities and key bindings
  - `null_ls.lua` - Formatting and linting configuration
  - `testing.lua` - Neotest configuration for JavaScript/Jest
  - `debugging.lua` - Debug adapter configuration

- `lua/plugins/` - Individual plugin specifications
  - Each file contains plugin setup for specific functionality
  - Uses lazy loading with events, commands, and filetypes

### Key Design Patterns

#### Error-Safe Module Loading
Uses `prequire()` function (defined in `utils.lua`) for safe module loading with optional error reporting.

#### Lazy Loading Strategy
Most plugins are configured with:
- Event-based loading (`BufReadPost`, `InsertEnter`)
- Command-based loading for UI components
- Filetype-specific loading for language tools

#### Leader Key Mapping
- Space (`<leader>`) as the main leader key
- Organized into logical groups:
  - `<leader>f` - File operations
  - `<leader>s` - Search operations
  - `<leader>c` - Code actions (LSP)
  - `<leader>j` - Jump/navigation
  - `<leader>b` - Buffer management
  - `<leader>w` - Window management
  - `<leader>h` - Help and package management
  - `<leader>t` - Testing
  - `<leader>a` - AI/Copilot actions

#### LSP Integration
- Unified LSP setup through `lsp_utils.lua`
- Automatic capability detection and key binding setup
- Uses Blink.cmp for completion with LSP integration
- Inlay hints support with toggle functionality

### Plugin Ecosystem
- **Plugin Manager**: Lazy.nvim with performance optimizations
- **Completion**: Blink.cmp with LSP, snippets, and buffer sources
- **LSP**: Native Neovim LSP with Mason for server management
- **File Explorer**: nvim-tree
- **Fuzzy Finding**: Telescope with custom extensions
- **Testing**: Neotest with Jest adapter
- **Git**: Gitsigns for git integration
- **AI**: CodeCompanion (disabled) and Copilot (disabled) configurations present

### Configuration Philosophy
- Modular design with clear separation of concerns
- Lazy loading for performance
- Rich key binding system with which-key discovery
- Error handling and graceful degradation
- Consistent icon usage through utils.signs

## Development Workflow

When modifying this configuration:
1. Test changes with `:checkhealth` after modifications
2. Use `:Lazy sync` to ensure plugin compatibility
3. Format Lua files with StyLua before committing
4. Key bindings follow the established leader key patterns
5. New plugins should follow the lazy loading conventions in `lua/plugins/`

The configuration prioritizes development ergonomics with smart defaults, extensive key bindings, and seamless LSP integration across multiple languages.
