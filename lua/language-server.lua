-- local lspconfig = require("lspconfig")
-- lspconfig.rust_analyzer.setup {} -- comment out if we want to integrate rustaceanvim
-- lspconfig.pyright.setup {}
-- lspconfig.angularls.setup {}
-- lspconfig.vtsls.setup{}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float) -- Space-e opens diagnostic message
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.lsp.set_log_level("debug")

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)                    -- gD go to declaration
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)                     -- gd go to definition
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                           -- K ??? Seems to go to docs! USEFUL
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)                 -- gi go to implementation? related to interfaces?
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)              -- Ctrl-k ???
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)    -- Space-wa ???
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts) -- Space-wr ???
        vim.keymap.set('n', '<space>wl', function()                                 -- Space-wl ???
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)       -- Space-D go to type definition
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)               -- Space-rn rename variable
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts) -- Space-ca offers code options to fix errors
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)                  -- gr go to references?
        vim.keymap.set('n', '<space>f', function()                               -- Space-f corrects formatting in buffer
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
