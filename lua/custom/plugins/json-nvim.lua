return {
  'jaredbarranco/json-nvim',
  branch = 'feat/heredoc-buffer-read',
  ft = 'json', -- only load for json filetype
  config = function()
    vim.keymap.set('n', '<leader>jff', '<cmd>JsonFormatFile<cr>')
    vim.keymap.set('n', '<leader>jmf', '<cmd>JsonMinifyFile<cr>')
  end,
}
