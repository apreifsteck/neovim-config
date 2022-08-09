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

-- close buffer
map('n', '<C-w>', '<cmd>bp<bar>sp<bar>bn<bar>bd<CR>')
-- move to prev buffer
map('n', '<C-j>', '<cmd>bprevious<CR>')
-- move to next buffer
map('n', '<C-k>', '<cmd>bnext<CR>')
-- shift a buffer tab to the left
map('n', '<C-S-j>', '<cmd>BufferLineMovePrev<CR>')
-- shift a buffer tab to the right
map('n', '<C-S-k>', '<cmd>BufferLineMoveNext<CR>')

-- search for a file in the git tree
map("n", "ff", "<cmd>Telescope git_files<CR>")

-- toggle line comment
map("n", '<C-/>', '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>')
-- toggle line comment in visual mode
map('x', '<C-/>', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- indent
map('v', '<', '<gv')
map('v', '>', '>gv')
-- pick your window
map("n", "w", ":lua require('nvim-window').pick()<CR>")
-- I gotta say I don't know what these are for
map("t", "<C-t>", "<C-\\><C-n>")
map("t", "<C-w><C-w>", "<C-\\><C-n><C-w><C-w>")
