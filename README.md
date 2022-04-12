## Installation

### Pre-requisites

#### For installation
- [neovim v0.5.1+](https://neovim.io) (required for lua support)
- git

#### Requirements for default config to work
- [Nerd patched font](https://www.nerdfonts.com/) - used by nvim-web-devicons
-- Recomended: `brew install --cask  font-fira-mono-nerd-font`
- [ripgrep](https://github.com/BurntSushi/ripgrep) - default [telescope](#nvim-telescopetelescopenvim) grep searcher

### Installation

Installation is as easy as cloning the YANC repository into your NeoVim configuration folder.

- If you already have a `~/.config/nvim` folder, make a backup with `mv ~/.config/nvim ~/.config/NVIM.BAK`
- Clone the repo with `git clone https://github.com/ricbermo/yanc ~/.config/nvim`
- Run this to get all of the plugins intalled `nvim +'hi NormalFloat guibg=#1e222a' +PackerSync`

