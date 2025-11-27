return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      background = {
        light = 'latte',
        dark = 'macchiato',
      },
      auto_integrations = true,
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
-- vim: ts=2 sts=2 sw=2 et
