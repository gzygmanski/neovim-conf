-- Keymaps

-- Disable keys
-- Prevent default for space (useful if space is your leader)
vim.keymap.set(
  { 'n', 'v' },
  '<Space>',
  '<Nop>',
  { silent = true }
)
vim.keymap.set('n', 'Q', '<Nop>', { silent = true })

-- Quit, write, new
vim.api.nvim_set_keymap(
  'n',
  '<leader>q',
  'len(filter(getbufinfo(), "v:val.listed == 1")) == 1 ? "<CMD>qa!<CR>" : "<CMD>BufferWipeout!<CR>"',
  { expr = true, noremap = false, silent = true }
)
vim.keymap.set(
  'n',
  '<leader><Esc>',
  '<CMD>q!<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'QQ',
  '<CMD>qa!<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>w',
  '<CMD>w!<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>ne',
  '<CMD>enew<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>nv',
  '<CMD>vnew<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>ns',
  '<CMD>new<CR>',
  { noremap = true, silent = true }
)

-- Extended movement
vim.keymap.set(
  'n',
  'k',
  "v:count == 0 ? 'gk' : 'k'",
  { expr = true, silent = true }
)
vim.keymap.set(
  'n',
  'j',
  "v:count == 0 ? 'gj' : 'j'",
  { expr = true, silent = true }
)
vim.keymap.set(
  'n',
  'J',
  '<CMD>m+<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'K',
  '<CMD>m-2<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'ga',
  '<C-^>',
  { noremap = true, silent = true }
)

-- remap jumplist action to free <Tab> key
vim.keymap.set(
  'n',
  '<C-p>',
  '<Tab>',
  { noremap = true, silent = true }
)

-- Quickfix list
vim.keymap.set(
  'n',
  '<C-c>',
  'v:lua.is_quickfix_opened() ? "<CMD>cclose<CR>" : "<CMD>ccopen<CR>"',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>co',
  '<CMD>copen<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>cc',
  '<CMD>cclose<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>cn',
  '<CMD>cnext<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>cp',
  '<CMD>cprev<CR>',
  { noremap = true, silent = true }
)

-- Clipboard
vim.keymap.set(
  'v',
  '<leader>yy',
  '"yy',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'v',
  '<leader>y',
  '"*y',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'v',
  '<leader>Y',
  '"*Y',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>p',
  '"*p',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>P',
  '"*P',
  { noremap = true, silent = true }
)

-- Pairs
require('plugins/pairs').map_pairs()
vim.keymap.set(
  'i',
  '<leader>a',
  '<Left><CMD>call search("\\\\%" . line(".") . "l\\\\()\\\\|}\\\\|]\\\\|>\\\\|\'\\\\|\\"\\\\|`\\\\)", "We")<CR><Right>',
  { noremap = false, silent = true }
)
vim.keymap.set(
  'i',
  '<BS>',
  "v:lua.require('plugins/pairs').within_empty_pair() ? '<C-o>a<C-H><C-H>' : '<C-H>'",
  { expr = true, noremap = true, silent = true }
)
vim.keymap.set(
  'i',
  '<CR>',
  "v:lua.require('plugins/pairs').within_empty_pair() ? '<CR><C-o>O<Tab>' : '<CR>'",
  { expr = true, noremap = true, silent = true }
)
vim.keymap.set(
  'i',
  '<Space>',
  "v:lua.require('plugins/pairs').within_empty_pair() ? '<Space><Space><C-o>h' : '<Space>'",
  { expr = true, noremap = true, silent = true }
)

-- Splits
vim.keymap.set(
  'n',
  '<leader>s',
  '<C-w>s',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>v',
  '<C-w>v',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'mh',
  '<C-w>H',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'mj',
  '<C-w>J',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'mk',
  '<C-w>K',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'ml',
  '<C-w>L',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'mrr',
  '<C-w>r',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'mrx',
  '<C-w>x',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<Tab>',
  '<C-w>w',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<C-H>',
  '<C-w>h',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<C-J>',
  '<C-w>j',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<C-K>',
  '<C-w>k',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<C-L>',
  '<C-w>l',
  { noremap = true, silent = true }
)

-- Resizing
vim.keymap.set(
  'n',
  'me',
  '<CMD>NvimTreeClose<CR><C-w>=',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'mm',
  '<CMD>NvimTreeClose<CR><C-w>_<C-w>=',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'mrh',
  '<CMD>vertical res -20<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'mrj',
  '<CMD>res +10<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'mrk',
  '<CMD>res -10<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'mrl',
  '<CMD>vertical res +20<CR>',
  { noremap = true, silent = true }
)

-- Buffers
require('plugins/barbar').map_gotobuffernr()
vim.keymap.set(
  'n',
  '<S-h>',
  '<CMD>BufferPrev<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<S-l>',
  '<CMD>BufferNext<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>aq',
  '<CMD>BufferCloseAllButCurrent!<CR>',
  { noremap = true, silent = true }
)

-- Terminal
vim.keymap.set(
  'n',
  'te',
  '<CMD>term<CR><CMD>BufferMoveStart<CR>'
)
vim.keymap.set(
  'n',
  'tv',
  '<CMD>vsplit +term<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'ts',
  '<CMD>split +term<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  't',
  '<Esc><Esc>',
  '<C-\\><C-n>',
  { noremap = true, silent = true }
)

-- NvimTree
vim.keymap.set(
  'n',
  '<C-n>',
  '<CMD>NvimTreeToggle<CR>',
  { noremap = true, silent = true }
)

-- Telescope
vim.keymap.set(
  'n',
  '<C-f>',
  "<CMD>lua require'plugins/telescope'.project_files(require'plugins/telescope'.get_ivy_mod({}))<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'g0',
  "<CMD>lua require'telescope.builtin'.buffers(require'plugins/telescope'.get_ivy_mod({}))<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>gr',
  "<CMD>lua require'telescope.builtin'.live_grep(require'plugins/telescope'.get_ivy_mod({}))<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<C-Space>',
  "<CMD>lua require'telescope.builtin'.current_buffer_fuzzy_find(require'plugins/telescope'.get_ivy_mod({}))<CR>",
  { noremap = true, silent = true }
)

-- LSP
vim.keymap.set(
  'n',
  'gd',
  '<CMD>lua vim.lsp.buf.definition()<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'gD',
  '<CMD>lua vim.lsp.buf.declaration()<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'gr',
  '<CMD>lua vim.lsp.buf.references()<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'gn',
  '<CMD>lua vim.diagnostic.goto_next()<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'gp',
  '<CMD>lua vim.diagnostic.goto_prev()<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'gl',
  '<CMD>lua vim.diagnostic.open_float()<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'gq',
  '<CMD>lua vim.diagnostic.setqflist()<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'gh',
  '<CMD>lua vim.lsp.buf.hover()<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>rn',
  '<CMD>lua vim.lsp.buf.rename()<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>ca',
  '<CMD>lua vim.lsp.buf.code_action()<CR>',
  { noremap = true, silent = true }
)


-- Git
vim.keymap.set(
  'n',
  'gs',
  '<CMD>Neogit kind=split<CR>',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  'do',
  ':DiffviewOpen<CR>',
  { noremap = true, silent = false }
)
vim.keymap.set(
  'n',
  '<leader>do',
  ':DiffviewOpen ',
  { noremap = true, silent = false }
)
vim.keymap.set(
  'n',
  'dq',
  '<CMD>DiffviewClose<CR>',
  { noremap = true, silent = true }
)

-- Obsidian
vim.keymap.set(
  'n',
  '<leader>on',
  '<CMD>ObsidianNew<CR>',
  { noremap = true, silent = true }
)
