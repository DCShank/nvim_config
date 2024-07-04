-- Bootstrap packer on new systems
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Packages
return require("packer").startup(function(use)
    -- Packer package manager
    use "wbthomason/packer.nvim"

    -- lualine Powerline
    use { "nvim-lualine/lualine.nvim", requires = { "Kyazdani42/nvim-web-devicons", opt = true } }

    use "nvim-tree/nvim-web-devicons"
    -- nvimtree File explorer
    use { "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } }

    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

    -- Colorschemes
    use { "dcshank/shpellcraft.nvim", as = "shpellcraft" }

    -- Treesitter Syntax highlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    }

    -- Adds git integration to the sidebar
    use "lewis6991/gitsigns.nvim"

    -- Language server settings
    use "neovim/nvim-lspconfig"

    use {
        "pmizio/typescript-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("typescript-tools").setup {}
        end,
    }

    -- Paired character creation/deletion ("", {}, etc)
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"

    -- Autocompletion
    use "hrsh7th/nvim-cmp"
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-vsnip'

    use 'norcalli/nvim-colorizer.lua'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end

    -- Auto update when plugins.lua is updated
    vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
    ]])
end)
