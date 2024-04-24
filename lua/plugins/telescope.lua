local actions = require 'telescope.actions'

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<esc>'] = actions.close,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

local M = {}

M.get_ivy_mod_preview = function(opts)
  opts = opts or {}

  local theme_opts = {
    theme = 'ivymod',
    results_title = false,
    prompt_title = false,
    preview_title = false,
    sorting_strategy = 'ascending',
    borderchars = {
      prompt = { '█', ' ', ' ', ' ', '█', '█', ' ', ' ', },
      results = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
      preview = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
    },
    layout_strategy = 'bottom_pane',
    layout_config = {
      -- prompt_position = "bottom",
      height = 10,
    },
    border = true,
  }
  return vim.tbl_deep_extend('force', theme_opts, opts)
end

M.get_ivy_mod = function(opts)
  opts = opts or {}

  local theme_opts = {
    theme = 'ivymod',
    results_title = false,
    prompt_title = false,
    preview_title = false,
    sorting_strategy = 'ascending',
    previewer = false,
    borderchars = {
      prompt = { '█', ' ', ' ', ' ', '█', '█', ' ', ' ', },
      results = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
      preview = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
    },
    layout_strategy = 'bottom_pane',
    layout_config = {
      -- prompt_position = "bottom",
      height = 10,
    },
    border = true,
  }
  return vim.tbl_deep_extend('force', theme_opts, opts)
end

M.project_files = function(opts)
  opts = opts or {}
  vim.fn.system 'git rev-parse --is-inside-work-tree'
  if vim.v.shell_error == 0 then
    require('telescope.builtin').git_files(opts)
  else
    require('telescope.builtin').find_files(opts)
  end
end

return M
