return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    jsx_close_tag = {
      enabled = true,
      filetypes = {
        'javascriptreact',
        'typescriptreact',
      },
    },
  },
}
