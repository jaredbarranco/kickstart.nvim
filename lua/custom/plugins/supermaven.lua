return {
  {
    'supermaven-inc/supermaven-nvim',
    lazy = false,
    config = function()
      require('supermaven-nvim').setup {}
      require('supermaven-nvim.api').stop()
      local api = require('supermaven-nvim.api')
      vim.keymap.set('n', '<leader>sm', function()
        api.toggle()
        vim.notify(string.format('Supermaven is %s', api.is_running() and 'running' or 'stopped'))
      end, { desc = '[S]uper[M]aven toggle' })
      vim.keymap.set('n', '<leader>sM', function()
        vim.notify(string.format('Supermaven is %s', api.is_running() and 'running' or 'stopped'))
      end, { desc = '[S]uper[M]aven status' })
      -- Override builtin :SupermavenStatus to actually show output
      vim.api.nvim_create_user_command('SupermavenStatus', function()
        vim.notify(string.format('Supermaven is %s', api.is_running() and 'running' or 'stopped'))
      end, {})
    end,
  },
}
