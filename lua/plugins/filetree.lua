local Filetree = { 'nvim-tree/nvim-tree.lua' }

Filetree.dependencies = {
    { 'nvim-tree/nvim-web-devicons' }
}

function Filetree.config()
    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local function on_attach(bufnr)
        local api = require("nvim-tree.api")
        local lib = require("nvim-tree.lib")

        --- Stolen shamelessly from the treesitter code.
        ---Inject the node as the first argument if absent.
        ---@param fn function function to invoke
        local function wrap_node(fn)
            return function(node, ...)
                node = node or lib.get_node_at_cursor()
                if node then
                    fn(node, ...)
                end
            end
        end

        local cd_or_open = wrap_node(function(node)
            if node.nodes then
                return api.tree.change_root_to_node(node)
            else
                api.node.open.edit(node)
            end
        end)

        local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- on_attach keybindings
        vim.keymap.set('n', '<Space>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'i', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'I', api.node.open.tab, opts('Open: New Tab'))
        vim.keymap.set('n', 'a', api.node.open.vertical, opts('Open: Vertical Split'))
        vim.keymap.set('n', 'A', api.node.open.horizontal, opts('Open: Horizontal Split'))

        --vim.keymap.set('n', '<CR>', api.tree.change_root_to_node, opts('CD'))
        vim.keymap.set('n', '<CR>', cd_or_open, opts('CD or Open'))
        vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('CD to Parent'))
        vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))

        vim.keymap.set('n', 'o', api.fs.create, opts('Create File Or Directory'))
        -- Consider special possible behavior for 'O'
        --vim.keymap.set('n', 'O', api.fs.create, opts('Create File Or Directory'))

        vim.keymap.set('n', 'Y', api.fs.copy.node, opts('Copy File'))

        vim.keymap.set('n', 'yy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
        vim.keymap.set('n', 'yp', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
        vim.keymap.set('n', 'yf', api.fs.copy.filename, opts('Copy Name'))
        vim.keymap.set('n', 'yr', api.fs.copy.relative_path, opts('Copy Relative Path'))

        vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
        -- Consider special behavior for 'P'
        --vim.keymap.set('n', 'P', api.fs.paste, opts('Paste'))

        vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
        -- Consider special behavior for 'D'
        --vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
        vim.keymap.set('n', 'x', api.fs.cut, opts('Cut/Move'))

        vim.keymap.set('n', 'r', api.fs.rename_basename, opts('Rename: Basename'))
        vim.keymap.set('n', 'R', api.fs.rename_sub, opts('Rename: Omit Filename'))
        --vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))

        vim.keymap.set('n', 'm', api.marks.toggle, opts('Bookmark'))
        vim.keymap.set('n', 'bm', api.marks.bulk.move, opts('Bookmark: Move'))
        vim.keymap.set('n', 'bd', api.marks.bulk.delete, opts('Bookmark: Delete'))
        --vim.keymap.set('n', 'bt', api.marks.bulk.trash, opts('Trash Bookmarked'))

        -- Keybinds come from the folds keybinds. Treat directories kind of like folds
        vim.keymap.set('n', 'zO', api.tree.expand_all, opts('Tree Expand All'))
        vim.keymap.set('n', 'zM', api.tree.collapse_all, opts('Tree Collapse All'))

        vim.keymap.set('n', '[g', api.node.navigate.git.prev, opts('Git Prev'))
        vim.keymap.set('n', ']g', api.node.navigate.git.next, opts('Git Next'))

        vim.keymap.set('n', 'fF', api.live_filter.clear, opts('Live Filter: Clear'))
        vim.keymap.set('n', 'ff', api.live_filter.start, opts('Live Filter: Start'))

        vim.keymap.set('n', 'fB', api.tree.toggle_no_buffer_filter, opts('Toggle Filter: No Buffer'))
        vim.keymap.set('n', 'fH', api.tree.toggle_hidden_filter, opts('Toggle Filter: Dotfiles'))
        vim.keymap.set('n', 'fU', api.tree.toggle_custom_filter, opts('Toggle Filter: Hidden'))
        vim.keymap.set('n', 'fM', api.tree.toggle_no_bookmark_filter, opts('Toggle Filter: No Bookmark'))
        vim.keymap.set('n', 'fI', api.tree.toggle_gitignore_filter, opts('Toggle Filter: Git Ignore'))
        vim.keymap.set('n', 'fC', api.tree.toggle_git_clean_filter, opts('Toggle Filter: Git Clean'))
        --vim.keymap.set('n', '<C-k>',   api.node.show_info_popup,            opts('Info'))
        --vim.keymap.set('n', ']e', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
        --vim.keymap.set('n', '[e', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))

        vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('z Mouse Open'))
        vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('z Mouse CD'))

        -- Moves cursor to the parent directory. Semi useful
        -- TODO rebind this to a sensible key
        vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
        -- END_DEFAULT_ON_ATTACH

        vim.keymap.set("n", "<F2>", api.tree.toggle, opts("Toggle Nvim-Tree"))
        -- Can't make below use leader as my leader is <space> which conflicts with the filetree space for opening files
        vim.keymap.set("n", "<C-I>", api.node.show_info_popup, opts("Info"))
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    end

    require("nvim-tree").setup {
        on_attach = on_attach,
        tab = {
            sync = {
                open = true,
                close = true
            }
        },
        actions = {
            change_dir = {
                enable = true,
                global = true,
            }
        },
        help = {
            sort_by = "desc"
        }
    }

    -- Add toggle nvim tree outside of the sidebar
    local api = require("nvim-tree.api")
    vim.keymap.set("n", "<F2>", api.tree.toggle, { desc = "Toggle Nvim-Tree" })

    -- Auto close nvim tree and exit nvim if it's the last buffer alive.
    -- Taken from https://github.com/nvim-tree/nvim-tree.lua/issues/1368#issuecomment-1512248492
    vim.api.nvim_create_autocmd("QuitPre", {
        callback = function()
            local invalid_win = {}
            local wins = vim.api.nvim_list_wins()
            for _, w in ipairs(wins) do
                local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
                if bufname:match("NvimTree_") ~= nil then
                    table.insert(invalid_win, w)
                end
            end
            if #invalid_win == #wins - 1 then
                -- Should quit, so we close all invalid windows.
                for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
            end
        end
    })
end

return Filetree
