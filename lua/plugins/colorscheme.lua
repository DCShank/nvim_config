local Colorscheme = {'dcshank/shpellcraft.nvim'}

Colorscheme.name = 'shpellcraft'

Colorscheme.lazy = false -- make sure we load this during startup if it is your main colorscheme
Colorscheme.priority = 1000 -- make sure to load this before all the other start plugins
function Colorscheme.config()
      vim.cmd([[colorscheme shpellcraft]])
end

return Colorscheme
