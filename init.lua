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
require 'plugins/neogit'
require 'options'
require 'keymaps'

-- Autocommands
vim.api.nvim_exec(
  [[
  augroup Format
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  augroup END
]], true)

vim.api.nvim_exec(
  [[
  autocmd TermOpen * setlocal signcolumn=no nonu nornu wrap linebreak
  autocmd FileType markdown setlocal spell spelllang=pl,en tw=80 wrap linebreak
  autocmd FileType html,css,javascript,javascriptreact,typescriptreact EmmetInstall
]],
  true
)

vim.api.nvim_exec(
  [[
  augroup CommandLineWindow
    autocmd CmdwinEnter * setlocal signcolumn=no nonu nornu
    autocmd CmdwinEnter * startinsert
    autocmd CmdwinEnter * nmap <buffer> <Esc> <CMD>xit<CR>
]],
  true
)
