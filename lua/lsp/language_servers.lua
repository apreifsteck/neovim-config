local lspconfig = require('lspconfig')
require('mason-lspconfig').setup {
  ensure_installed = {
    "lua_ls", "rust_analyzer", "elixirls", "html", "cssls", "sqlls", "jsonls", "yamlls", "bashls", "solargraph",
    "typescript_language_server"
  }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  -- enable async formatting
  require("lsp-format").on_attach(client)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

-- Language server set ups
-- Elixir
lspconfig.elixirls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.solargraph.setup {
  -- cmd = { "bundle", "exec", "ruby-lsp" },
  capabilities = capabilities,
  on_attach = on_attach
}

-- rust
lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- typescript
lspconfig.type_script_language_server.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
-- JSON
lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- YAML
lspconfig.yamlls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
-- Bash
lspconfig.bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.codespell.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings =
  {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'use' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  }
}
lspconfig.html.setup {
  capabilities = capabilities,
  -- on_attach = on_attach,
}
lspconfig.cssls.setup {
  capabilities = capabilities,
  -- on_attach = on_attach,
}
