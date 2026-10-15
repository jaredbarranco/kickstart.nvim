-- Almo7aya/openingh.nvim - open or copy the host (GitHub/GitLab/Bitbucket) URL
--  for the current file or repo. Setting `openingh_copy_to_register` allows the
--  plugin's commands to take a register (e.g. `:OpenInGHFile +`) so they copy the
--  URL instead of opening a browser.
vim.g.openingh_copy_to_register = true
vim.pack.add { 'https://github.com/Almo7aya/openingh.nvim' }

-- Copy the host URL of the current file to the system clipboard.
vim.api.nvim_create_user_command('CopyGitUrl', function()
  vim.cmd 'OpenInGHFile +'
end, { desc = 'Copy the host URL of the current file' })

vim.keymap.set('n', '<leader>gy', '<cmd>CopyGitUrl<CR>', { desc = '[G]it: copy current file URL to clipboard' })
