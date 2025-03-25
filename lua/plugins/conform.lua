return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = {}
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua', 'prettierd', 'prettier', stop_after_first = true },
      python = { 'ruff_format', 'ruff_organize_imports' },
      css = { 'prettierd', 'prettier', stop_after_first = true },
      json = { 'prettierd', 'prettier', stop_after_first = true },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      vue = { 'prettierd', 'prettier', stop_after_first = true },
      html = { 'prettierd', 'prettier', stop_after_first = true },
      cpp = { 'clang-format', 'prettierd', 'prettier', stop_after_first = true },
      proto = { 'buf', 'prettierd', 'prettier', stop_after_first = true },
      sh = { 'shfmt', 'prettierd', 'prettier', stop_after_first = true },
      markdown = { 'markdownlint', 'prettierd', 'prettier', stop_after_first = true },
      ['_'] = { 'trim_whitespace' },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
