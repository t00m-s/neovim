return { -- Linting
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    local show_lint_virtual_text = true
    lint.linters_by_ft = {
      text = { 'vale' },
      markdown = { 'vale' },
      python = { 'ruff' },
      cpp = { 'cpplint' },
    }
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        if vim.opt_local.modifiable:get() then
          lint.try_lint()
        end
      end,
    })
    vim.keymap.set('n', '<leader>tl', function()
      vim.diagnostic.config {
        virtual_text = not show_lint_virtual_text,
        underline = not show_lint_virtual_text,
      }
    end, { desc = '[T]oggle [L]inting' })
  end,
}
