-- supermaven-inc/supermaven-nvim - AI autocomplete
--  Integrated with blink.cmp via `huijiro/blink-cmp-supermaven`
--  (the `supermaven` source/provider is registered in init.lua Section 8).
vim.pack.add {
  'https://github.com/supermaven-inc/supermaven-nvim',
  'https://github.com/huijiro/blink-cmp-supermaven',
}

-- blink.cmp handles suggestions/acceptance, so supermaven's own inline
-- completion and keymaps are disabled here. The `supermaven` source provider
-- (module `blink-cmp-supermaven`) is registered in init.lua Section 8 and is
-- loaded by blink.cmp itself.
require('supermaven-nvim').setup {
  disable_inline_completion = true,
  disable_keymaps = true,
}

-- Off by default; toggle on demand with <leader>sm
require('supermaven-nvim.api').stop()

local api = require 'supermaven-nvim.api'
vim.keymap.set('n', '<leader>sm', function()
  api.toggle()
  vim.notify(string.format('Supermaven is %s', api.is_running() and 'running' or 'stopped'))
end, { desc = '[S]uper[M]aven toggle' })
vim.keymap.set(
  'n',
  '<leader>sM',
  function() vim.notify(string.format('Supermaven is %s', api.is_running() and 'running' or 'stopped')) end,
  { desc = '[S]uper[M]aven status' }
)
-- Override builtin :SupermavenStatus to actually show output
vim.api.nvim_create_user_command(
  'SupermavenStatus',
  function() vim.notify(string.format('Supermaven is %s', api.is_running() and 'running' or 'stopped')) end,
  {}
)
