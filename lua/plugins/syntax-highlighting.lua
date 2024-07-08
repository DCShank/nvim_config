local Syntax = { 'nvim-treesitter/nvim-treesitter' }

Syntax.main = 'nvim-treesitter.configs'

function Syntax.build()
    local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
    ts_update()
end

Syntax.opts = {
    -- A list of parser names, or "all"
    ensure_installed = {
        "bash", "c", "c_sharp", "comment", "commonlisp", "cpp",
        "css", "diff", "dot", "git_rebase",
        "gitcommit", "gitattributes", "gitignore", "go", "html",
        "http", "java", "javascript", "json", "json5", "latex",
        "lua", "perl", "php", "python", "r", "rust", "sql",
        "regex", "vim", "toml", "typescript"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
}
return Syntax
