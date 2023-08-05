local neogit = require('neogit')

neogit.setup {
  kind = 'split',
  disable_signs = false,
  signs = {
    section = {" ", " "},
    item = {" ", " "},
    hunk = {"", ""}
  },
  integrations = { diffview = true },
  -- disable_context_highlighting = true
}
