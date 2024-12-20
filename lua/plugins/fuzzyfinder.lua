local FuzzyFinder = { 'nvim-telescope/telescope.nvim' }

FuzzyFinder.branch = '0.1.x'

FuzzyFinder.dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
}

FuzzyFinder.command = {
    'Telescope'
}

FuzzyFinder.keys = {
    { '<leader>ff', function()
        require('telescope.builtin').find_files {
            find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
            previewer = false
        }
    end,  desc = "Find files", mode = 'n' },
    { '<leader>fg', function(...) require('telescope.builtin').live_grep(...) end, desc = "Live Grep",        mode = 'n' },
    { '<leader>fb', function(...) require('telescope.builtin').buffers(...) end,   desc = "Search buffers",   mode = 'n' },
    { '<leader>fh', function(...) require('telescope.builtin').help_tags(...) end, desc = "Help tags",        mode = 'n' },
    { '<leader>ft', function(...) require('telescope.builtin').git_files(...) end, desc = "Search Git Files", mode = 'n' },

}

function FuzzyFinder.config()
    require('telescope').setup {
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
            pickers = {
                find_files = {
                    hidden = 'true'
                }
            }
        }
    }
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf')
end

return FuzzyFinder
