local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
  b.code_actions.gitsigns,
  b.diagnostics.gitlint,
  b.diagnostics.jsonlint,
  b.formatting.json_tool,
  b.diagnostics.markdownlint,

   -- python stuff
  b.formatting.isort,
  b.formatting.black,
  b.diagnostics.flake8.with { filetypes = {"python"}},

   -- webdev stuff
  b.code_actions.eslint,
  b.diagnostics.eslint,
   -- b.formatting.deno_fmt,
  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },

  -- golang
  b.formatting.gofmt,
  b.diagnostics.golangci_lint,

   -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

   -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,
      diagnostics_format = "[#{c}] #{m} (#{s})"
   }
end

return M
