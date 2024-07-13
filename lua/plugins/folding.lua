local Folding = { 'kevinhwang91/nvim-ufo' }
-- configures folding, primarily through the nvim-ufo plugin
Folding.dependencies = {
    { 'kevinhwang91/promise-async' },
    --{ 'nvim-treesitter/nvim-treesitter' }
}

--Folding.event = { 'BufReadPre', 'BufNewFile' }
--Temporary fix to make it stop failing due to a race condition with the LSP
Folding.event = { 'LspAttach' }

Folding.keys = {
    { 'zR',             require('ufo').openAllFolds,  mode = 'n' },
    { 'zM',             require('ufo').closeAllFolds, mode = 'n' },
    { '<leader><space>', 'za',                         mode = 'n' },
}

local fold_text_handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (' 󰁂 %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

function Folding.init()
    vim.o.foldcolumn = '0' -- '0' is not bad
    vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
end

Folding.opts = {
    open_fold_hl_timeout = 150,
    close_fold_kinds_for_ft = {
        default = { 'imports', 'comment' },
    },
    fold_virt_text_handler = fold_text_handler,
}

return Folding
