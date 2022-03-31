local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"
--
--   lspconfig.tsserver.setup({
--     on_attach = function(client, bufnr)
--         client.resolved_capabilities.document_formatting = false
--         client.resolved_capabilities.document_range_formatting = false
--         local ts_utils = require("nvim-lsp-ts-utils")
--         ts_utils.setup({})
--         ts_utils.setup_client(client)
--         -- buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
--         -- buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
--         -- buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
--         on_attach(client, bufnr)
--     end,
-- })

  -- lspservers with default config
  local servers = {"pyright", "tsserver", "eslint", "bashls", 'dockerls', 'jsonls', 'phpactor', 'yamlls'}

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
    }
  end
end

return M
