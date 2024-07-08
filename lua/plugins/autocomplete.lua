local Autocomplete = { "hrsh7th/nvim-cmp" }

Autocomplete.dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/vim-vsnip' },
    { 'hrsh7th/cmp-vsnip' },
    { 'kevinhwang91/nvim-ufo' },
}

Autocomplete.event = {
    'InsertEnter',
}

function Autocomplete.config()
    -- completeopt is used to manage code suggestions
    -- menuone: show popup even when there is only one suggestion
    -- noinsert: Only insert text when selection is confirmed
    -- noselect: force us to select one from the suggestions
    vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert', 'preview' }
    -- shortmess is used to avoid excessive messages
    vim.opt.shortmess = vim.opt.shortmess + { c = true }

    local cmp = require 'cmp'
    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            end,
        },

        mapping = {
            -- Shift+TAB to go to the Previous Suggested item
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            -- Tab to go to the next suggestion
            ['<Tab>'] = cmp.mapping.select_next_item(),
            -- CTRL+SHIFT+f to scroll backwards in description
            ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
            -- CTRL+F to scroll forwards in the description
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            -- CTRL+SPACE to bring up completion at current Cursor location
            ['<C-Space>'] = cmp.mapping.complete(),
            -- CTRL+e to exit suggestion and close it
            ['<C-e>'] = cmp.mapping.close(),
            -- CR (enter or return) to CONFIRM the currently selection suggestion
            -- We set the ConfirmBehavior to insert the Selected suggestion
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = false,
            })
        },
        -- Add borders to the windows
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        -- add formatting of the different sources
        formatting = {
            fields = { 'menu', 'abbr', 'kind' },
            format = function(entry, item)
                local menu_icon = {
                    nvim_lsp = 'λ',
                    vsnip = '⋗',
                    buffer = 'b',
                    path = 'p'
                }
                item.menu = menu_icon[entry.source.name]
                return item
            end,
        },
        sources = {
            { name = 'path' },
            { name = 'nvim_lsp',               keyword_length = 3 },
            { name = 'nvim_lsp_signature_help' },
            { name = 'nvim_lua',               keyword_length = 2 },
            { name = 'buffer',                 keyword_length = 2 },
            { name = 'vsnip',                  keyword_length = 2 },
        }
    })
end

return Autocomplete
