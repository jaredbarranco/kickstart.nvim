local M = {}

function M.get_subword_bounds(line, col)
  if not line or line == '' then return end

  local char = line:sub(col + 1, col + 1)
  if not char or not char:match '[%w_]' then return end

  if char == '_' then return col, col end

  local n = #line
  local wc = '[%w_]'

  local start = col
  while start > 0 do
    local cur = line:sub(start + 1, start + 1)
    local prev = line:sub(start, start)

    if not cur:match(wc) then
      start = start + 1
      break
    end

    if prev == '_' or cur == '_' then break end

    if prev:match '[a-z]' and cur:match '[A-Z]' then break end

    if prev:match '[A-Z]' and cur:match '[A-Z]' and start < n then
      local next_c = line:sub(start + 2, start + 2)
      if next_c and next_c:match '[a-z]' then break end
    end

    start = start - 1
  end

  if start >= 0 then
    local at_pos = line:sub(start + 1, start + 1)
    if at_pos == '_' or not at_pos:match(wc) then start = start + 1 end
  end
  start = math.max(0, start)
  if not line:sub(start + 1, start + 1):match(wc) then return end

  local finish = col
  while finish < n - 1 do
    local cur = line:sub(finish + 1, finish + 1)
    local next_c = line:sub(finish + 2, finish + 2)

    if not cur:match(wc) then break end

    if cur == '_' or next_c == '_' then break end

    if next_c and not next_c:match(wc) then break end

    if cur:match '[a-z]' and next_c and next_c:match '[A-Z]' then break end

    if cur:match '[A-Z]' and next_c and next_c:match '[A-Z]' and finish + 2 < n then
      local after_next = line:sub(finish + 3, finish + 3)
      if after_next and after_next:match '[a-z]' then break end
    end

    finish = finish + 1
  end

  if not line:sub(finish + 1, finish + 1):match(wc) then return end

  return start, finish
end

function M.miniai_spec(ai_type)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local lnum = cursor[1]
  local col = cursor[2]
  local line = vim.fn.getline(lnum)

  local s, e = M.get_subword_bounds(line, col)
  if not s then return end

  return {
    from = { line = lnum, col = s + 1 },
    to = { line = lnum, col = e + 1 },
  }
end

function M.setup()
  -- wired into mini.ai via init.lua
end

return M
