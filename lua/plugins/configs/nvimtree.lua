local present, tree_config = pcall(require, "nvim-tree.config")
if not present then
   return
end

local tree_cb = tree_config.nvim_tree_callback
local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_side = 'left' -- left by default
g.nvim_tree_width = 33 -- can be width_in_columns or 'width_in_percent%'
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' } -- empty by default
g.nvim_tree_gitignore = 1
g.nvim_tree_auto_open = 1 -- opens the tree when typing `vim $DIR` or `vim`
g.nvim_tree_auto_close = 1 -- closes the tree when it's the last window
g.nvim_tree_auto_ignore_ft = { 'dashboard' } -- don't auto open tree on specific filetypes.
g.nvim_tree_quit_on_open = 0 -- closes the tree when you open a file
g.nvim_tree_follow = 1 -- this option allows the cursor to be updated when entering a buffer
g.nvim_tree_indent_markers = 1 -- this option shows indent markers when folders are open
g.nvim_tree_hide_dotfiles = 1 -- this option hides files and folders starting with a dot `.`
g.nvim_tree_git_hl = 1 -- will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_highlight_opened_files = 0 -- will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" } -- See :help filename-modifiers for more options
g.nvim_tree_tab_open = 0 -- will open the tree when entering a new tab and the tree was previously open
g.nvim_tree_auto_resize = 1 -- will resize the tree to its saved width when opening a file
g.nvim_tree_disable_netrw = 1 -- disables netrw
g.nvim_tree_hijack_netrw = 0 -- prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
g.nvim_tree_group_empty = 0 -- compact folders that only contain a single folder into one node in the file tree
g.nvim_tree_lsp_diagnostics = 0
g.nvim_tree_update_cwd = 1 -- will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.

g.nvim_tree_show_icons = {
   folders = 1,
   -- folder_arrows= 1
   files = 1,
   git = 1,
}

g.nvim_tree_bindings = {
   { key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb "edit" },
   { key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb "cd" },
   { key = "<C-v>", cb = tree_cb "vsplit" },
   { key = "<C-x>", cb = tree_cb "split" },
   { key = "<C-t>", cb = tree_cb "tabnew" },
   { key = "<", cb = tree_cb "prev_sibling" },
   { key = ">", cb = tree_cb "next_sibling" },
   { key = "P", cb = tree_cb "parent_node" },
   { key = "<BS>", cb = tree_cb "close_node" },
   { key = "<S-CR>", cb = tree_cb "close_node" },
   { key = "<Tab>", cb = tree_cb "preview" },
   { key = "K", cb = tree_cb "first_sibling" },
   { key = "J", cb = tree_cb "last_sibling" },
   { key = "I", cb = tree_cb "toggle_ignored" },
   { key = "H", cb = tree_cb "toggle_dotfiles" },
   { key = "R", cb = tree_cb "refresh" },
   { key = "a", cb = tree_cb "create" },
   { key = "d", cb = tree_cb "remove" },
   { key = "r", cb = tree_cb "rename" },
   { key = "<C->", cb = tree_cb "full_rename" },
   { key = "x", cb = tree_cb "cut" },
   { key = "c", cb = tree_cb "copy" },
   { key = "p", cb = tree_cb "paste" },
   { key = "y", cb = tree_cb "copy_name" },
   { key = "Y", cb = tree_cb "copy_path" },
   { key = "gy", cb = tree_cb "copy_absolute_path" },
   { key = "[c", cb = tree_cb "prev_git_item" },
   { key = "}c", cb = tree_cb "next_git_item" },
   { key = "-", cb = tree_cb "dir_up" },
   { key = "q", cb = tree_cb "close" },
   { key = "g?", cb = tree_cb "toggle_help" },
}
