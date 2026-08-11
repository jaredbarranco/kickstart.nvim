local M = {}

-- Esc key termcode utility
local function esc() return vim.api.nvim_replace_termcodes('<Esc>', true, true, true) end

-- Macro 1: Insert `console.log(': ', P)`
function M.set_console_log_macro()
  -- local macro = 'yo' .. "console.log('" .. esc() .. "Pi: '," .. esc() .. 'P)' .. esc() .. string.rep('<BS>', 80) .. esc() .. 'I' .. esc()
  local macro = "yoconsole.log('" .. esc() .. "pA: ', " .. esc() .. 'pA);' .. esc() .. 'I' .. esc()
  vim.fn.setreg('l', macro)
end

-- Setup macros for JS/TS/MJS files
function M.setup_js_macros() M.set_console_log_macro() end

-- Map a filetype to a key suffix under <leader>ft
local ft_shortcuts = {
  j = 'json',
  x = 'x12',
  y = 'yaml',
  l = 'lua',
  p = 'python',
  m = 'markdown',
  t = 'typescript',
  s = 'javascript',
  h = 'html',
  c = 'css',
}

function M.set_filetype_and_format(ft)
  vim.bo.filetype = ft
  if ft == 'x12' then
    vim.cmd [[%s/\n//g]]
    vim.cmd [[%s/\~/\~\r/g]]
    vim.cmd [[normal! gg]]
    vim.cmd [[nohlsearch]]
  else
    vim.cmd.Format()
  end
end

-- Global setup: attach autocommands
function M.setup()
  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'mjs' },
    callback = function() M.setup_js_macros() end,
  })

  -- Set filetype + format — <leader>ft{key}
  for key, ft in pairs(ft_shortcuts) do
    vim.keymap.set('n', '<leader>ft' .. key, function() M.set_filetype_and_format(ft) end, { desc = 'Set ft=' .. ft .. ' & Format' })
  end
end

return M
