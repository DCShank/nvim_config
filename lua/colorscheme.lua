-- This config file is for setting the
vim.opt.background = "dark"

--vim.cmd([[colorscheme gruvbox]])
--require("ayu").colorscheme()
--vim.cmd([[colorscheme srcery]]) -- For some reason srcery isn't setup correctly and needs another colorscheme to run first to get setup correctly.
--vim.cmd("colorscheme kanagawa")

-- optional setup to enable srcery-like colorscheme using kanagawas superior stuff
local use_srcery_colors = true
if use_srcery_colors then
    require("kanagawa").setup({
        colors = {
            palette = {
                oldWhite = "#BAA67F",
                sumiInk0 = "#110f0e",
                sumiInk1 = "#141210",
                sumiInk2 = "#181513",
                sumiInk3 = "#1b1816",
                sumiInk4 = "#2d2824",
                sumiInk5 = "#36302b",
                sumiInk6 = "#3f3833",
                waveBlue1 = "#4c2012",
                waveBlue2 = "#983f24",
                springGreen = "#98BC37",
                sakuraPink = "#FF5C8F",
                oniViolet = "#E02C6D",
                oniViolet2 = "#FF8700",
                waveAqua1 = "#0AAEB3",
                waveAqua2 = "#0AAEB3",
                springViolet1 = "#FF5C8F",
                springViolet2 = "#FF8700",
                waveRed = "#F75341",
                peachRed = "#EF2F27",
                roninYellow = "#FF8700",
                dragonBlue = "#68A8E4",
                autumnYellow = "#FF8700",
                autumnRed = "#EF2F27",
                autumnGreen = "#519F50",
                boatYellow2 = "#FBB829",
                crystalBlue = "#2C78BF",
                fujiGray = "#918175",
                samuraiRed = "#F75341",
                carpYellow = "#FED06E",
                springBlue = "#68A8E4",
                fujiWhite = "#FCE8C3",
                surimiOrange = "#FF5F00",
            }
        }
    })
end
vim.cmd("colorscheme kanagawa-wave")
--vim.cmd("colorscheme kanagawa-dragon")
--vim.cmd("colorscheme kanagawa-lotus")
