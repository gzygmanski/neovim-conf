--
-- This function has been generated from your
--   view.mappings.list
--   view.mappings.custom_only
--   remove_keymaps
--
-- You should add this function to your configuration and set on_attach = on_attach in the nvim-tree setup call.
--
-- Although care was taken to ensure correctness and completeness, your review is required.
--
-- Please check for the following issues in auto generated content:
--   "Mappings removed" is as you expect
--   "Mappings migrated" are correct
--
-- Please see https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach for assistance in migrating.
--

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  -- Default mappings not inserted as:
  --  remove_keymaps = true
  --  OR
  --  view.mappings.custom_only = true


  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
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

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

-- local list = {
--   {key = {"e"}, cb = tree_cb("edit")}, {key = {"l"}, cb = tree_cb("edit")},
--   {key = {"<CR>"}, cb = tree_cb("cd")}, {key = "v", cb = tree_cb("vsplit")},
--   {key = "s", cb = tree_cb("split")}, {key = "t", cb = tree_cb("tabnew")},
--   {key = "<", cb = tree_cb("prev_sibling")},
--   {key = ">", cb = tree_cb("next_sibling")},
--   {key = "P", cb = tree_cb("parent_node")},
--   {key = "h", cb = tree_cb("close_node")},
--   {key = "K", cb = tree_cb("first_sibling")},
--   {key = "J", cb = tree_cb("last_sibling")},
--   {key = "I", cb = tree_cb("toggle_ignored")},
--   {key = "H", cb = tree_cb("toggle_dotfiles")},
--   {key = "R", cb = tree_cb("refresh")}, {key = "a", cb = tree_cb("create")},
--   {key = "d", cb = tree_cb("remove")}, {key = "r", cb = tree_cb("rename")},
--   {key = "<C-r>", cb = tree_cb("full_rename")},
--   {key = "x", cb = tree_cb("cut")}, {key = "c", cb = tree_cb("copy")},
--   {key = "p", cb = tree_cb("paste")}, {key = "y", cb = tree_cb("copy_name")},
--   {key = "Y", cb = tree_cb("copy_path")},
--   {key = "gy", cb = tree_cb("copy_absolute_path")},
--   {key = "[c", cb = tree_cb("prev_git_item")},
--   {key = "]c", cb = tree_cb("next_git_item")},
--   {key = "<BS>", cb = tree_cb("dir_up")}, {key = "q", cb = tree_cb("close")},
--   {key = "W", cb = tree_cb("collapse_all")},
--   {key = "?", cb = tree_cb("toggle_help")}
-- }

vim.g.nvim_tree_width_allow_resize = 1

require'nvim-tree'.setup {
  on_attach = on_attach,
  hijack_cursor = false,
  update_cwd = true,
  update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
  view = {
    width = 40,
    side = 'left',
--  mappings = {custom_only = true, list = list}
  },
  diagnostics = {
    enable = false,
    icons = {error = "", warning = "", hint = "", info = ""}
  },
  renderer = {
    root_folder_modifier = ':~',
    indent_markers = {enable = false},
    highlight_git = true,
    highlight_opened_files = 'none',
    special_files = {},
    icons = {
      show = {git = false, folder = true, file = true, folder_arrow = false},
      padding = ' ',
      git_placement = 'after',
      glyphs = {
        default = '   ',
        symlink = '   ',
        folder = {
          default = "   ",
          open = "   ",
          empty = "   ",
          empty_open = "   ",
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
  filters = {dotfiles = false},
  git = {enable = true, ignore = true},
  actions = {
    open_file = {resize_window = false},
    remove_file = {close_window = false}
  }
}

-- disable word wrap
vim.cmd('autocmd FileType LuaTree setlocal nowrap')
