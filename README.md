# Neovim Config
This is my config for Neovim.

## Installation

Fairly easy.
1. Clone this repository into your `~/.config/nvim/` directory, or wherever you have your Neovim configuration setup
2. Install language servers for any languages you want to have enabled.
   1. I recommend installing all language servers that are enabled in the `language-server.lua` file.
   2. Language servers should be installed through the recommended means in their documentation.

      Generally this will be either installing through your package manager or installing through the package manager for that language.
      Or sometimes Npm.

   3. If you want to install more language servers, you will need to add them to `language-server.lua`.
3. Install the treesitter compiler, or disable automatically adding languages to the syntax tree.

## TODOs

### Enhance the keybindings for the many plugins

- [ ] Update filetree bindings to more closely match what you would expect from vim, treating the lines as _text_

  This would look like, e.g. `o` would open a new line below, which would translate to creating a new file!

- [ ] Pick a good leader key, and update _most_ keymappings to use it instead of `<Ctrl>`, or `<Space>`, or `g` as a prefix.
- [ ] Pick a small group of important functions to assign to give `<Ctrl>`, `]`, or `g` as a prefix. _Maybe_ `<Space>`

### Add git support, particularly to filetree

- [ ] Identify a git support plugin
- [ ] Install git support plugin and configure it
- [ ] Add keybindings for filetree

### Enhance tab support

Tab support is currently wonky. I need to either fully commit to buffers, or take a lot of effort to make tabs ergonomic
