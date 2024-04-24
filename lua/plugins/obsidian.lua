require("obsidian").setup({
  ui = {
    enable = false, -- remove conceallevel warning
  },
  workspaces = {
    {
      name = "noteshiss",
      path = "~/vaults/noteshiss",
    },
    {
      name = "no-vault",
      path = function()
        -- alternatively use the CWD:
        -- return assert(vim.fn.getcwd())
        return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
      end,
      overrides = {
        notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
        new_notes_location = "current_dir",
        templates = {
          subdir = vim.NIL,
        },
        disable_frontmatter = true,
      },
    },
  },
  -- Optional, customize how note IDs are generated given an optional title.
  ---@param title string|?
  ---@return string
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,

  -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
  -- URL it will be ignored but you can customize this behavior here.
  ---@param url string
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    vim.fn.jobstart({ "open", url }) -- Mac OS
    -- vim.fn.jobstart({"xdg-open", url})  -- linux
  end,
})
