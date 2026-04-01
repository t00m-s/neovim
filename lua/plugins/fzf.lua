vim.pack.add { { src = 'https://github.com/ibhagwan/fzf-lua' } }
require('fzf-lua').setup { 'fzf-native' }
require('fzf-lua').register_ui_select()
