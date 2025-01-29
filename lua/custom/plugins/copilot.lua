-- Set Copilot global variables immediately
vim.g.copilot_proxy = 'http://localhost:11435'
vim.g.copilot_proxy_strict_ssl = false

return {
  {
    'github/copilot.vim',
  },
}
