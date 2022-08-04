function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('i', 'fg', '<Esc>')
map('', '<Space>', '<Nop>')
map("n", "<Leader>sv", ":source $MYVIMRC<CR>")

map('n', '<C-w>', '<cmd>bp<bar>sp<bar>bn<bar>bd<CR>')
map('n', '<C-h>', '<cmd>bprevious<CR>')
map('n', '<C-l>', '<cmd>bnext<CR>')
map('n', '<C-S-h>', '<cmd>BufferLineMovePrev<CR>')
map('n', '<C-S-l>', '<cmd>BufferLineMoveNext<CR>')
-- or use command LspSagaFinder
-- map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
map("n", "ff", "<cmd>Telescope git_files<CR>")

map('v', '<', '<gv')
map('v', '>', '>gv')
map("n", "ws", ":lua require('nvim-window').pick()<CR>")
map("t", "<C-t>", "<C-\\><C-n>")
map("t", "<C-w><C-w>", "<C-\\><C-n><C-w><C-w>")
