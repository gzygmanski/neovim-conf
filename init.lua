vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.g.barbar_auto_setup = false


require('plugins')

vim.cmd [[colorscheme nord]]

require('plugins/lsp')
require('plugins/null-ls')
require('plugins/nvim-tree')
require('plugins/telescope')
require('plugins/galaxyline')
require('plugins/barbar')
require('plugins/cmp')
require('plugins/diffview')
require('plugins/neogit')
require('plugins/zettelkasten')
require('options')
require('keymaps')

-- Autocommands
vim.api.nvim_exec([[
  augroup Format
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  augroup END
]], true)

vim.api.nvim_exec([[
  augroup CommandLineWindow
    autocmd CmdwinEnter * setlocal signcolumn=no nonu nornu
    autocmd CmdwinEnter * startinsert
    autocmd CmdwinEnter * nmap <buffer> <Esc> <CMD>xit<CR>
]], true)
