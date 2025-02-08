return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    vim.o.background = 'dark' -- or "light" for light mode
    vim.cmd [[colorscheme gruvbox]]
  end,
}
-- vim: ts=2 sts=2 sw=2 et
