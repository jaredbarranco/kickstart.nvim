-- chrisgrieser/nvim-spider - better w/e/b motion (camelCase aware)
vim.pack.add { 'https://github.com/chrisgrieser/nvim-spider' }
for _, key in ipairs { 'w', 'e', 'b' } do
  vim.keymap.set({ 'n', 'o', 'x' }, key, ("<cmd>lua require('spider').motion('%s')<CR>"):format(key))
end
