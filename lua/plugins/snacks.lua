return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  dependencies = { 'echasnovski/mini.icons' },
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    lazygit = { enabled = true },
    scope = { enabled = true },
    dashboard = {
      enabled = true,
      examples = 'advanced',
    },
    input = { enabled = true },
    animate = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    terminal = { enabled = true },
    explorer = { enabled = true },
    picker = { enabled = true },
  },
  keys = {
    {
      '<leader>tt',
      function()
        Snacks.terminal.toggle()
      end,
      desc = '[T]oggle [T]erminal',
    },
    {
      '<leader>lg',
      function()
        Snacks.lazygit()
      end,
      desc = '[L]azy[G]it',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = '[G]it [L]og',
    },
    {
      '<leader>sf',
      function()
        Snacks.picker.files { hidden = true }
      end,
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>sc',
      function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[S]earch NeoVim [C]onfig',
    },
    {
      '<leader>sgf',
      function()
        Snacks.picker.git_files()
      end,
      desc = '[S]earch [G]it [F]iles',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep()
      end,
      desc = '[S]earch [W]ord',
    },
    {
      '<leader>ch',
      function()
        Snacks.picker.command_history()
      end,
      desc = '[C]ommand [H]istory',
    },
    {
      '<leader>cs',
      function()
        Snacks.picker.colorschemes()
      end,
      desc = '[C]olor [S]chemes',
    },
    {
      '<leader>gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = '[G]oto [D]efinition',
    },
    {
      '<leader>gr',
      function()
        Snacks.picker.lsp_references()
      end,
      desc = '[G]oto [R]eferences',
    },
    {
      '<leader>gI',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = '[G]oto [I]mplementation',
    },
    {
      '<leader>D',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'Type [D]efinition',
    },
    {
      '<leader>ws',
      function()
        Snacks.picker.lsp_workspace_symbols()
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
    },
    {
      '<leader>gD',
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = '[G]oto [D]eclaration',
    },
    {
      '<C-k>',
      function()
        vim.lsp.buf.signature_help()
      end,
      desc = 'Signature Help',
    },
  },
}
