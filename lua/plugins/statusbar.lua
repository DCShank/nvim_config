local Statusbar = { "nvim-lualine/lualine.nvim", }

Statusbar.dependencies = {
    { "Kyazdani42/nvim-web-devicons" },
    { "dcshank/shpellcraft.nvim" },
}


Statusbar.opts = {
    options = {
        theme = 'shpellcraft',
    },
}

return Statusbar
