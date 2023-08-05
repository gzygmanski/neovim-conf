local M = {}

-- No autopairs
local d_pairs = {"()", "{}", "[]", "<>", "''", "\"\"", "``"}

local is_empty_pair = function (str)
  for _, value in ipairs(d_pairs) do if str == value then return 1 end end
  return 0
end

M.map_pairs = function ()
  for _, value in ipairs(d_pairs) do
    local opening = string.sub(value, 1, 1)
    local closing = string.sub(value, 2, 2)
    vim.keymap.set("i", string.rep(opening, 2), value .. "<left>", {noremap = true, silent = true})
    vim.keymap.set("i", opening .. "<CR>", opening .. "<CR>" .. closing .. "<Esc>ko", {noremap = true, silent = true})
  end
end

M.within_empty_pair = function ()
  local current = vim.fn.strpart(vim.fn.getline("."), vim.fn.col(".") - 2, 2)
  return is_empty_pair(current)
end

return M
