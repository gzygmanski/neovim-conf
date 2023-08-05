vim.g.barbar_auto_setup = false -- Lua

require 'barbar'.setup {
  animation = false,
  auto_hide = false,
  icons = {
    filetype = { enabled = false, custom_colors = false },
    separator = {
      left = '',
      right = '',
    },
    inactive = {
      separator = {
        left = '',
        right = '',
      },
    },
    modified = {
      button = '樂'
    },
    button = false
  },
  closable = true,
  clickable = false,
  semantic_letters = true,
  maximum_padding = 2
  -- maximum_padding = math.huge,
}

local M = {}

M.map_gotobuffernr = function()
  for i = 1, 9 do
    vim.keymap.set("n", "g" .. i, "<CMD>BufferGoto" .. i .. "<CR>", { noremap = true, silent = true })
  end
end

return M
