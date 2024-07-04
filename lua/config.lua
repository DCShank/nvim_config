-- vim settings
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

vim.opt.number = true
vim.opt.ttyfast = true

-- Quicker split switching
vim.keymap.set("n", "<C-K>", "<C-W>k", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<C-J>", "<C-W>j", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<C-H>", "<C-W>h", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<C-L>", "<C-W>l", { noremap = true, silent = true, nowait = true })

-- Set LSP log level to reduce disk usage and prevent performance degradation
vim.lsp.set_log_level("WARN")
