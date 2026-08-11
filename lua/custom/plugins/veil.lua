-- Gentleman-Programming/veil.nvim - hide secrets in buffers
vim.pack.add { 'https://github.com/Gentleman-Programming/veil.nvim' }
require('veil').setup {
  extra_patterns = {
    'KAFKA_PASS',
    'DB_PASS',
    'SAP_TM_PASS',
    '_PASS',
  },
}
