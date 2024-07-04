local alacritty_config = "/home/dshank/.config/alacritty/alacritty.toml"
local fonts_dir = "/home/dshank/.config/alacritty/fonts/"

-- Get a list of fonts from a directory of _font config files for the current terminal_
local function get_random_font(dir)
    local fonts_iter = vim.fs.dir(dir)
    local fonts = {}
    for font, _ in fonts_iter do
        table.insert(fonts, font)
    end
    return fonts[ (vim.fn.rand() % #fonts) + 1 ]
end

local function set_font(font, dir)
    local config = vim.system({ "cat", dir .. font}, { text = true }):wait()
    vim.system({ "alacritty", "msg", "config", config.stdout })
end

-- Pick a random font
local font = get_random_font(fonts_dir)
set_font(font, fonts_dir)

-- Function for enabling the base terminal font
local reset_font = function()
    vim.system({ "alacritty", "msg", "config", "-r" }):wait()
    vim.system({ "touch", alacritty_config }):wait() -- touch the config in case there have been updates since
end

-- Disable the font on exiting nvim
vim.api.nvim_create_autocmd({ "VimLeavePre" }, { pattern = "*", callback = reset_font })

-- Create a user command to display the current font
vim.api.nvim_create_user_command("FontName", (function (_)
   vim.print(font)
end), {})

vim.api.nvim_create_user_command("FontRand", (function (_)
    font = get_random_font(fonts_dir)
    set_font(font, fonts_dir)
end), {})

vim.api.nvim_create_user_command("FontReset", (function (_)
    reset_font()
end), {})

vim.api.nvim_create_user_command("FontChoose", (function (_)
    --vim.api.nvim_buf_attach(0, false, {})
    local buf_id = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf_id, 0, -1, true, {"Hello", "world!"})
    vim.api.nvim_open_win(buf_id, true, {split="left", width=10})
    -- Make readonly again.
    vim.api.nvim_set_option_value("readonly", true, {buf=buf_id})
    -- Mark as not modified, otherwise you'll get an error when
    -- attempting to exit vim.
    vim.api.nvim_set_option_value("modified", false, {buf=buf_id})
    vim.api.nvim_set_option_value("modifiable", false, {buf=buf_id})
end), {})
