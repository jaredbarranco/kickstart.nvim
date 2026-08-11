-- jaredbarranco/json-nvim - JSON format/minify utilities
vim.pack.add { { src = 'https://github.com/jaredbarranco/json-nvim', version = 'master' } }
vim.keymap.set('n', '<leader>jff', '<cmd>JsonFormatFile<cr>')
vim.keymap.set('n', '<leader>jmf', '<cmd>JsonMinifyFile<cr>')
