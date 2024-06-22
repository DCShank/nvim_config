require("nvim-autopairs").setup {
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    disable_in_macro = true,            -- disable when recording or executing a macro
    disable_in_visualblock = false,     -- disable when insert after visual block mode
    disable_in_replace_mode = true,
    ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
    enable_moveright = true,
    enable_afterquote = true,             -- add bracket pairs after quote
    enable_check_bracket_line = true,     --- check bracket in same line
    enable_bracket_in_quote = true,       --
    enable_abbr = false,                  -- trigger abbreviation
    break_undo = true,                    -- switch for basic rule break undo sequence
    check_ts = false,
    map_cr = true,
    map_bs = true,       -- map the <BS> key
    map_c_h = false,     -- Map the <C-h> key to delete a pair
    map_c_w = false,     -- map <c-w> to delete a pair if possible
}

require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  per_filetype = {
    ["html"] = {
      enable_close = false
    }
  }
})
