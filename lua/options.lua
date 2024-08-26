local function setOptions(options)
  for key, val in pairs(options) do
    if val == true then
      vim.api.nvim_command('set ' .. key)
    elseif val == false then
      vim.api.nvim_command('set no' .. key)
    else
      vim.api.nvim_command('set ' .. key .. '=' .. val)
    end
  end
end


local options = {
  autoindent = true,
  autoread = true,
  backspace = 'indent,eol,start',
  breakindent = true,
  clipboard = 'unnamedplus',
  compatible = false,
  completeopt = 'menuone,noselect',
  cursorline = true,
  dir = '/tmp',
  expandtab = true,
  fillchars = 'vert:│,eob:\\ ,diff:·',
  hidden = true,
  hlsearch = false,
  ignorecase = true,
  inccommand = 'split',
  incsearch = true,
  laststatus = 2,
  linebreak = false,
  list = true,
  listchars = 'eol:¬',
  noruler = true,
  nu = true,
  rnu = true,
  scrolloff = 8,
  shiftwidth = 2,
  showmatch = true,
  sidescrolloff = 5,
  signcolumn = 'yes',
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  swapfile = true,
  tabstop = 2,
  termguicolors = true,
  timeout = true,
  timeoutlen = 300,
  undofile = true,
  updatetime = 250,
  wrap = false,
  mouse = 'c',
}

setOptions(options)
