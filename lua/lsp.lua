vim.lsp.config('*', {
  root_markers = { '.git' },
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})
vim.lsp.enable { 'luals', 'gopls', 'clangd', 'bashls', 'ruff', 'basedpyright' }
