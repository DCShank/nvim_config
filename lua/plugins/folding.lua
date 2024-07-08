local Folding = { 'kevinhwang91/nvim-ufo' }
-- configures folding, primarily through the nvim-ufo plugin
Folding.dependencies = {
    { 'kevinhwang91/promise-async' },
    { 'neovim/nvim-lspconfig' }
}

Folding.event = { 'BufReadPre', 'BufNewFile' }

function Folding.config()
    vim.o.foldcolumn = '0' -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Using ufo provider need remap `zR` and `zM`
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

    vim.keymap.set({ 'n', 'v' }, "<space>", "<Nop>")
    vim.keymap.set({ 'n', 'v' }, "<space><space>", "za")
    -- I set this up in the language-server config file, as it conflicts with the capabilities I setup there otherwise
    -- Option 2: nvim lsp as LSP client
    -- Tell the server the capability of foldingRange,
    -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
    --local capabilities = vim.lsp.protocol.make_client_capabilities()
    --local capabilities = require('cmp_nvim_lsp').default_capabilities()
    --capabilities.textDocument.foldingRange = {
    --    dynamicRegistration = false,
    --    lineFoldingOnly = true
    --}
    --local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
    --for _, ls in ipairs(language_servers) do
    --    require('lspconfig')[ls].setup({
    --        capabilities = capabilities
    --        -- you can add other fields for setting up lsp server in this table
    --    })
    --end
    require('ufo').setup({
        open_fold_hl_timeout = 150,
        close_fold_kinds_for_ft = {
            default = { 'imports', 'comment' },
        },
    })
end

return Folding
