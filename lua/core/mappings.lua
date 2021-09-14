local map = vim.api.nvim_set_keymap

-- nvimtree
map("n", "<C-n>", ":NvimTreeToggle <CR>", { noremap = true, silent = true })

-- Bufferline
map("n", "<TAB>", ":BufferLineCycleNext <CR>", { noremap = true, silent = true })
map("n", "<S-TAB>", ":BufferLineCyclePrev <CR>", { noremap = true, silent = true })

-- Telescope
map("n", "<C-h>", ":Telescope find_files hidden=true <CR>", { noremap = true, silent = true })
map("n", "<C-f>", ":Telescope find_files <CR>", { noremap = true, silent = true })
map("n", "<C-b>", ":Telescope buffers <CR>", { noremap = true, silent = true })
map("n", "<C-g><Space>", ":Telescope git_commits <CR>", { noremap = true, silent = true })
map("n", "<C-g><C-s>", ":Telescope git_status <CR>", { noremap = true, silent = true })

-- coc.nvim
if vim.fn.has('nvim') == 1 then
  map("i", "<C-Space>", "coc#refresh()", { expr = true, silent = true })
else
  map("i", "<C-@>", "coc#refresh()", { expr = true, silent = true })
end