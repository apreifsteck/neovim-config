local wk = require('which-key')

local toggle_float = function()
  local float = terminal:new({ direction = "float" })
  return float:toggle()
end

local toggle_lazygit = function()
  local lazygit = terminal:new({ direction = "float", cmd = 'lazygit' })
  return lazygit:toggle()
end

local mappings = {
  q = { ':qa<CR>', 'Quit' },
  Q = { ':wq<CR>', 'Save and Quit' },
  w = { ':w<CR>', 'Save' },
  x = { ':bdelete<CR>', 'Close' },
  e = { ':NvimTreeToggle<CR>', 'File Explorer'},
  E = { ':e ~/.config/nvim/init.lua<CR>', 'Edit Root Config' },
  f = { 
    name = 'Search',
    f = { ':Telescope git_files<CR>', 'Git Find' },
    r = { ':Telescope live_grep<CR>', 'Grep' } 
  },
  t = {":ToggleTerm size=50 direction=vertical<cr>", "Split Right"},
  l = {
    name = "LSP",
    i = { ":LspInfo<cr>", "Connected Language Servers" },
    k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
    K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
    w = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder" },
    W = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Workspace Folder" },
    l = {
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
      "List Workspace Folders"
    },
  },
  p = {
    name = "Packer",
    r = { ":PackerClean<cr>", "Remove Unused Plugins" },
    c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
    i = { ":PackerInstall<cr>", "Install Plugins" },
    p = { ":PackerProfile<cr>", "Packer Profile" },
    s = { ":PackerSync<cr>", "Sync Plugins" },
    S = { ":PackerStatus<cr>", "Packer Status" },
    u = { ":PackerUpdate<cr>", "Update Plugins" }
  },
  d = {
    name = "Diagnostics",
    d = { ":TroubleToggle document_diagnostics<CR>", "Toggle Document Diagnostics"},
    t = { ":TroubleToggle<cr>", "Toggle Diagnostics List" }
  },
  s = { ':SymbolsOutline<cr>', 'Symbols Outline'},
  g = {
    name = "Git",
    a = {':Git add .<cr>', "git add"},
    s = {':Git status<cr>', "git status"},
    c = {':Git commit -m "', "git commit"},
    p = { 
      s = {':Git push <cr>', "git push"},
      b = {':Git push --set-upstream @ <cr>', 'git publish'},
      l = {':Git pull', "git pull"}
    },
  }
}
local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
