# speedie-nvim

![img](/screenshots/scr0.png)
![img](/screenshots/scr1.png)

My personal neovim configuration. Designed to be an IDE replacement for me.
If you prefer something lighter, check out my [speedie-vim](https://git.speedie.site/speedie/speedie-vim) configuration instead.

If you plan on using this, I recommend that you fork it and make it your own rather than relying on upstream which
can change whenever I feel like it. **This is not a NeoVim distro.**

## Features

- Fully configured in Lua
- Easy, clean and concise configuration file
- Neovim-native LSP for different languages (default: HTML, CSS, C, C++, PHP, Lua and Markdown)
- Language syntax highlighting (using Treesitter)
- Tabs (using barbar)
- Doom-One colorscheme (using doom-one.vim)
- Automatic code formatting (using autoclose, conform, indent-blankline)
- Git integration (using vim-fugitive)
- Built-in file manager (using nvim-tree)
- Nice keybinds for working with splits
- Easy translating (using nvim-translate)
- Built in keyboard layout and spell check switching (default: English (US) and Swedish)

## Requirements

- Neovim 0.9 or later.
- curl.
- Good internet connection so you can download things.
- Preferably also nerd fonts, or stuff might look a bit weird.
  - To install them, you can use the included `install_fonts.sh` script.

## Installation (Linux/macOS/BSD)

Run ./install.sh. Note that this will remove your
existing Neovim configuration so if you care about it, back it up before running the script.

To uninstall, simply remove ~/.config/nvim/ (and optionally ~/.local/share/nvim)

## Installation (Windows)

Run .\install.ps1. Yes, this will also remove your existing Neovim configuration.

## Fork

If you want to fork it like I told you to, make a fork, change the remote,
and run `./commit.sh` whenever you want to upload your fork to the remote. This
automatically copies in the dotfiles.
