return {
  'ibhagwan/fzf-lua',
  dependencies = { 'echasnovski/mini.icons' },
  opts = {},
  lazy = true,
  keys = {
    {
      '<leader>gd',
      function()
        require('fzf-lua').lsp_definitions()
      end,
      desc = '[G]oto [D]efinition',
    },
    {
      '<leader>gr',
      function()
        require('fzf-lua').lsp_references()
      end,
      desc = '[G]oto [R]eferences',
    },
    {
      '<leader>gI',
      function()
        require('fzf-lua').lsp_implementations()
      end,
      desc = '[G]oto [I]mplementation',
    },
    {
      '<leader>D',
      function()
        require('fzf-lua').lsp_type_definitions()
      end,
      desc = 'Type [D]efinition',
    },
    {
      '<leader>ds',
      function()
        require('fzf-lua').lsp_document_symbols()
      end,
      desc = '[D]ocument [S]ymbols',
    },
    {
      '<leader>ws',
      function()
        require('fzf-lua').lsp_live_workspace_symbols()
      end,
      desc = '[W]orkspace [S]ymbols',
    },
    {
      '<leader>rn',
      function()
        vim.lsp.buf.rename()
      end,
      desc = '[R]e[n]ame',
    },
    {
      '<leader>ca',
      function()
        vim.lsp.buf.code_action()
      end,
      desc = '[C]ode [A]ction',
      mode = { 'n', 'x' },
    },
    {
      '<leader>gD',
      function()
        vim.lsp.buf.declaration()
      end,
      desc = '[G]oto [D]eclaration',
    },
  },
}
