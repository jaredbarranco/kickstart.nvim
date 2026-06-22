return {
  'Gentleman-Programming/veil.nvim',
  event = 'VeryLazy',
  config = function()
    require('veil').setup {
      extra_patterns = {
        'KAFKA_PASS',
        'DB_PASS',
        'SAP_TM_PASS',
        '_PASS',
      },
    }
  end,
}
