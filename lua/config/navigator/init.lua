require('navigator').setup {
  debug = true,
  lsp_installer = true,
  keymaps = { { key = 'gR', func = "require('navigator.reference').async_ref()" } },
}
