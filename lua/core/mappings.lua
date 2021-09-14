local map = vim.api.nvim_set_keymap

-- nvimtree
map("n", "<C-n>", ":NvimTreeToggle <CR>", { noremap = true, silent = true })

-- bufferline
map("n", "<TAB>", ":BufferLineCycleNext <CR>", { noremap = true, silent = true })
map("n", "<S-TAB>", ":BufferLineCyclePrev <CR>", { noremap = true, silent = true })
