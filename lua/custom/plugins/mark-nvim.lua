-- roerohan/mark.nvim - terminal markdown preview (live render, no browser)
--  NOTE: requires the Bun runtime, and the TypeScript renderer build
--  (`cd typescript && bun install && bun run build`) is handled by the
--  `PackChanged` autocommand in `init.lua` (Section 3).
vim.pack.add { 'https://github.com/roerohan/mark.nvim' }

-- `setup()` registers :MarkPreview, :MarkPreviewToggle, etc. and the default
-- <leader>mp toggle mapping. auto_start is off so the preview opens only on demand.
require('mark').setup { auto_start = false }
