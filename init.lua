vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.g.barbar_auto_setup = false

-- Emmet
vim.g.user_emmet_leader_key = ','
vim.g.user_emmet_mode = 'inv'
vim.g.user_emmet_install_global = 0
vim.g.jsx_ext_required = 0
vim.g.user_emmet_settings = {
  javascriptreact = { extends = 'jsx' },
  typescriptreact = { extends = 'tsx' }
}

require 'plugins'

vim.cmd [[colorscheme nord]]

require 'plugins/lsp'
require 'plugins/null-ls'
require 'plugins/nvim-tree'
require 'plugins/telescope'
require 'plugins/galaxyline'
require 'plugins/barbar'
require 'plugins/cmp'
require 'plugins/diffview'
require 'plugins/obsidian'
require 'options'
require 'keymaps'
require 'luasnip.loaders.from_vscode'.load({
  paths = {
    "./snippets"
  },
})

-- Autocommands
vim.api.nvim_exec2(
  [[
  augroup FormatOptions
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  augroup END
]], { output = true })

vim.api.nvim_exec2(
  [[
  autocmd TermOpen * setlocal signcolumn=no nonu nornu wrap linebreak
  autocmd FileType markdown setlocal spell spelllang=pl,en tw=80 linebreak conceallevel=0
  autocmd FileType html,css,javascript,javascriptreact,typescriptreact EmmetInstall
]], { output = true })

vim.api.nvim_exec2(
  [[
  augroup CommandLineWindow
    autocmd CmdwinEnter * setlocal signcolumn=no nonu nornu
    autocmd CmdwinEnter * startinsert
    autocmd CmdwinEnter * nmap <buffer> <Esc> <CMD>xit<CR>
]], { output = true })

-- vim.api.nvim_exec2(
--   [[
--   augroup Neogit
--     autocmd CmdwinEnter NeogitStatus,NeogitPopup setlocal foldlevel=1000
-- ]], { output = true })
