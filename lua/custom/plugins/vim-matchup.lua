-- andymass/vim-matchup - matching pairs / % extension
--  NOTE: the previous `matchup = { ... }` block inside the nvim-treesitter spec is
--  not applicable to the new vim.pack-era nvim-treesitter; vim-matchup picks up
--  its treesitter integration automatically.
vim.g.matchup_matchparen_offscreen = { method = 'popup' }
vim.pack.add { 'https://github.com/andymass/vim-matchup' }
