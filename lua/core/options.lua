local opt = vim.opt

opt.hidden = true
opt.number = true
opt.autoindent = true
opt.encoding = "UTF-8"

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

opt.scrolloff = 20

-- Scrolling
vim.cmd [[
  nnoremap k kzz
  nnoremap j jzz
]]
