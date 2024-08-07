# Neovim Config
This is my config for Neovim.

## Installation

Fairly easy.
1. Clone this repository into your `~/.config/nvim/` directory, or wherever you have your Neovim configuration setup
2. Language servers are downloaded and installed automatically if they've been added to the list of ensured servers in `language-server.lua`. More language servers can be installed via mason
3. Install the treesitter compiler, or disable automatically adding languages to the syntax tree. TODO make this install itself automatically

## TODOs

### Enhance the keybindings for the many plugins

- [x] Update filetree bindings to more closely match what you would expect from vim, treating the lines as _text_

  This would look like, e.g. `o` would open a new line below, which would translate to creating a new file!

- [ ] Pick a good leader key, and update _most_ keymappings to use it instead of `<Ctrl>`, or `<Space>`, or `g` as a prefix.
- [ ] Pick a small group of important functions to assign to give `<Ctrl>`, `]`, or `g` as a prefix. _Maybe_ `<Space>`

### Add git support, particularly to filetree

Current options:
[git.nvim](https://github.com/dinhhuy258/git.nvim) Lua clone of vim-fugitive. Not sure if there's a reason to use over vim-fugitive
[vim-fugitive](https://github.com/tpope/vim-fugitive) The classic git plugin
[neogit0](https://github.com/NeogitOrg/neogit) Seems to have like a cool ui?

- [ ] Identify a git support plugin
- [ ] Install git support plugin and configure it
- [ ] Add keybindings for filetree

### Enhance tab support

Tab support is currently wonky. I need to either fully commit to buffers, or take a lot of effort to make tabs ergonomic

### Add debugging features
- [ ] Install [nvim-dap](https://github.com/mfussenegger/nvim-dap)
