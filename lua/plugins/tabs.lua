local Tabs = { 'akinsho/bufferline.nvim' }

Tabs.dependencies = {
    { 'nvim-tree/nvim-web-devicons' }
}

Tabs.version = "*"

opts = {
    options = {
        mode = "tabs",

        offsets = {
            {
                filetype = "NvimTree",
                text = "NvimTree File Explorer",
                text_align = "center",
                separator = true
            }
        },

        color_icons = true,
        get_element_icon = function(element)
            -- element consists of {filetype: string, path: string, extension: string, directory: string}
            -- This can be used to change how bufferline fetches the icon
            -- for an element e.g. a buffer or a tab.
            -- e.g.
            local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
            return icon, hl
        end,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,

        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")"
        end,
    }

}
return Tabs
