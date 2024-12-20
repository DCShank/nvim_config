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

-- Statusline will show mode
vim.opt.showmode = false

-- Set LSP log level to reduce disk usage and prevent performance degradation
vim.lsp.set_log_level("WARN")

-- Quicker split switching using <Ctrl>
vim.keymap.set({"n", "v"}, "<C-k>", "<C-w>k", { noremap = true, silent = true, nowait = true })
vim.keymap.set({"n", "v"}, "<C-j>", "<C-w>j", { noremap = true, silent = true, nowait = true })
vim.keymap.set({"n", "v"}, "<C-h>", "<C-w>h", { noremap = true, silent = true, nowait = true })
vim.keymap.set({"n", "v"}, "<C-l>", "<C-w>l", { noremap = true, silent = true, nowait = true })
-- And in terminal mode
vim.keymap.set({"t"}, "<Ctrl-k>", "<C-\\><C-n><C-w>k", { noremap = true, silent = true, nowait = true })
vim.keymap.set({"t"}, "<Ctrl-j>", "<C-\\><C-n><C-w>j", { noremap = true, silent = true, nowait = true })
vim.keymap.set({"t"}, "<Ctrl-h>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true, nowait = true })
vim.keymap.set({"t"}, "<Ctrl-l>", "<C-\\><C-n><C-w>l", { noremap = true, silent = true, nowait = true })

-- Moving up and down doesn't line wrap for lines longer than the screen
vim.keymap.set({"n", "v"}, "j", "gj", { noremap = true, silent = true, nowait = true })
vim.keymap.set({"n", "v"}, "k", "gk", { noremap = true, silent = true, nowait = true })

-- Likewise for going to the start of the line
vim.keymap.set({"n", "v"}, "0", "g0", { noremap = true, silent = true, nowait = true })
vim.keymap.set({"n", "v"}, "^", "g^", { noremap = true, silent = true, nowait = true })
vim.keymap.set({"n", "v"}, "<space>", "<nop>", { noremap = true, silent = true, nowait = true })

-- Escape terminal via <ESC>
vim.keymap.set({"t"}, "<Esc>", "<C-\\><C-N>", { noremap = true, silent = true, nowait = true })
