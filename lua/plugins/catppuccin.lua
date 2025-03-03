return {
  'catppuccin/nvim',
  name = 'catppuccin',
  event = 'VimEnter',
  config = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
} -- vim: ts=2 sts=2 sw=2 et
