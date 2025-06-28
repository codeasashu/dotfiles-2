-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },
  {
    "nvimtools/none-ls.nvim",
    enabled = false,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      local linters = require("lint").linters

      linters.golangcilint.args = {
        "run",
        "--output.json.path",
        "stdout",
        "--issues-exit-code",
        "0",
      }

      local linters_by_ft = {
        protobuf = { "buf", "protolint" },
        go = { "golangcilint" },
      }

      -- extend opts.linters_by_ft
      for ft, linters_ in pairs(linters_by_ft) do
        opts.linters_by_ft[ft] = opts.linters_by_ft[ft] or {}
        vim.list_extend(opts.linters_by_ft[ft], linters_)
      end
    end,
  },
}
