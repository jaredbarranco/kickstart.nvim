-- m4xshen/hardtime.nvim - discourage bad vim habits
vim.pack.add {
  'https://github.com/m4xshen/hardtime.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}
require('hardtime').setup {
  disabled_keys = {
    ['<Up>'] = false,
    ['<Down>'] = false,
    ['<Left>'] = false,
    ['<Right>'] = false,
  },
}
