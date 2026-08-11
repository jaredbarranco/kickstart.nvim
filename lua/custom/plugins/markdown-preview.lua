-- iamcco/markdown-preview.nvim - live markdown preview
--  NOTE: build step (`cd app && npm install`) is handled by the `PackChanged`
--  autocommand in `init.lua` (Section 3).
vim.g.mkdp_filetypes = { 'markdown' }
vim.pack.add { 'https://github.com/iamcco/markdown-preview.nvim' }
