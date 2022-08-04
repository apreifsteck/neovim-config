vim.g.mapleader = " "
require('impatient').enable_profile()
require('plugins')
require('keybinds')
require('options')
-- require('catppuccin').setup()
-- vim.g.catppuccin_flavour = "macchiato"
require('ayu').setup({ mirage = true })

vim.cmd [[colorscheme ayu]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


vim.cmd([[
  augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup END
]])
