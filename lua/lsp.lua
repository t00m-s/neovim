-- ~/.config/nvim/lua/lsp.lua
vim.lsp.enable {
  'bashls',
  'gopls',
  'lua_ls',
  'ts_ls',
  'rust-analyzer',
}

vim.diagnostic.config {
  virtual_text = true,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
}
