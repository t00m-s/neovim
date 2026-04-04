-- ~/.config/nvim/lua/plugins/blink.lua
vim.pack.add {
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range '^1',
  },
  { src = 'https://github.com/saghen/blink.compat' },
}

require('blink.cmp').setup {
  keymap = {
    preset = 'super-tab',
    ['<Tab>'] = {
      'select_next',
      'snippet_forward',
      'fallback',
    },
    ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
  },
  signature = { enabled = true },
  appearance = {
    nerd_font_variant = 'mono',
  },

  completion = {
    documentation = { auto_show = false },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'obsidian' },
  },

  obsidian = { name = 'obsidian', module = 'blink.compat.source' },
  fuzzy = {
    implementation = 'prefer_rust_with_warning',
  },
}
