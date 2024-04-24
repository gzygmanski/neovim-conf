local servers = {
  lua_ls = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = { enable = false },
      diagnostics = { globals = { 'vim' } },
    },
  },
}

local capabilities =
    vim.lsp.protocol.make_client_capabilities()
capabilities =
    require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

-- LSP settings.
-- This function gets run when an LSP connects to a particular buffer.
-- local on_attach = function(_, bufnr)
--   -- Create a command `:Format` local to the LSP buffer
--   vim.api.nvim_buf_create_user_command(
--     bufnr,
--     'Format',
--     function(_)
--       vim.lsp.buf.format()
--     end,
--     { desc = 'Format current buffer with LSP' }
--   )
-- end

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = servers[server_name],
    }
  end,
}

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      signs = { severity_limit = 'Info' },
      virtual_text = {
        source = false,
        prefix = '󰧟',
        spacing = 1,
        severity_limit = 'Info',
      },
      underline = false,
      update_in_insert = false,
    })

local signs = {
  Error = '󰧟 ',
  Warn = '󰧟 ',
  Hint = '󰧟 ',
  Info = '󰧟 ',
}

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(
    hl,
    { text = icon, texthl = hl, numhl = hl }
  )
end
