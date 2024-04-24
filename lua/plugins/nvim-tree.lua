local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', 'e', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<CR>', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
  vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
  vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
  vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
  vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
  vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
  vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
  vim.keymap.set('n', '<BS>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
  vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

vim.g.nvim_tree_width_allow_resize = 1

require('nvim-tree').setup {
  on_attach = on_attach,
  hijack_cursor = false,
  update_cwd = true,
  update_focused_file = { enable = true, update_cwd = true, ignore_list = {} },
  view = {
    signcolumn = "no",
    width = 50,
    side = 'left',
    relativenumber = true,
    --  mappings = {custom_only = true, list = list}
  },
  diagnostics = {
    enable = false,
    icons = { error = "", warning = "", hint = "", info = "" }
  },
  renderer = {
    root_folder_modifier = ':~',
    indent_markers = { enable = false },
    highlight_git = true,
    highlight_opened_files = 'none',
    special_files = {},
    icons = {
      show = { git = false, folder = true, file = true, folder_arrow = false },
      padding = ' ',
      git_placement = 'after',
      glyphs = {
        default = '   ',
        symlink = '   ',
        folder = {
          default = "  󰧚 ",
          open = "  󰧖 ",
          empty = "  󰧛 ",
          empty_open = "  󰧗 ",
          symlink = "   ",
          symlink_open = "   "
        },
        git = {
          unstaged = "-",
          staged = "+",
          unmerged = "!",
          renamed = "r",
          untracked = "?",
          deleted = "x",
          ignored = ""
        }
      }
    }
  },
  filters = { dotfiles = false },
  git = { enable = true, ignore = true },
  actions = {
    open_file = { resize_window = false },
    remove_file = { close_window = false }
  }
}

-- disable word wrap
vim.cmd('autocmd FileType LuaTree setlocal nowrap')
