## Installation

### Pre-requisites

#### For installation

- [neovim v0.8.0+](https://neovim.io) (required for lua support)
- git

#### Requirements for default config to work

- [Nerd patched font](https://www.nerdfonts.com/) - used by nvim-web-devicons
  -- Recomended: `brew install --cask  font-fira-mono-nerd-font`
  -- Recomended: https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized
- [ripgrep](https://github.com/BurntSushi/ripgrep) - default [telescope](#nvim-telescopetelescopenvim) grep searcher
- gnu-sed (nvim-spectre requirement): `brew install gnu-sed`

### Installation

Installation is as easy as cloning the YANC repository into your NeoVim configuration folder.

- If you already have a `~/.config/nvim` folder, make a backup with `mv ~/.config/nvim ~/.config/NVIM.BAK`
- Clone the repo with `git clone https://github.com/ricbermo/yanc ~/.config/nvim`
- Run this to get all of the plugins installed `nvim --headless "+Lazy! sync" +qa`
