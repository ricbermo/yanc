## Installation

### Pre-requisites

#### For installation

- [neovim v0.11.0+](https://neovim.io)
- git

#### Requirements for default config to work

- [Nerd patched font](https://www.nerdfonts.com/) - used by nvim-web-devicons
  - Recommended: `brew install --cask font-fira-mono-nerd-font`
  - Recommended: https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized
- [ripgrep](https://github.com/BurntSushi/ripgrep) - default telescope grep backend

### Installation

Installation is as easy as cloning the YANC repository into your NeoVim configuration folder.

- If you already have a `~/.config/nvim` folder, make a backup with `mv ~/.config/nvim ~/.config/NVIM.BAK`
- Clone the repo with `git clone https://github.com/ricbermo/yanc ~/.config/nvim`
- Run this to install/update plugins: `nvim --headless "+Lazy! sync" +qa`

### Troubleshooting

- Run health checks: `nvim --headless "+checkhealth" +qa`
- Re-sync plugins after lockfile/spec updates: `nvim --headless "+Lazy! sync" +qa`
- Open lazy UI for diagnostics: `:Lazy`
