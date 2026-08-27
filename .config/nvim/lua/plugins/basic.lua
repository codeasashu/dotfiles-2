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
  {
    'stevearc/conform.nvim',
    opts = {
       formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "ruff" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
        },
    }
  },
--     {
--   "coder/claudecode.nvim",
--   dependencies = { "folke/snacks.nvim" },
--   config = true,
--   -- `cmd` lets lazy.nvim create command stubs that load the plugin on first use,
--   -- so `:ClaudeCode` and friends work on a fresh start. Without it, a keys-only
--   -- spec defers loading until a <leader>a* mapping is pressed and the commands
--   -- would not exist yet.
--   cmd = {
--     "ClaudeCode",
--     "ClaudeCodeFocus",
--     "ClaudeCodeSelectModel",
--     "ClaudeCodeAdd",
--     "ClaudeCodeSend",
--     "ClaudeCodeTreeAdd",
--     "ClaudeCodeStatus",
--     "ClaudeCodeStart",
--     "ClaudeCodeStop",
--     "ClaudeCodeOpen",
--     "ClaudeCodeClose",
--     "ClaudeCodeDiffAccept",
--     "ClaudeCodeDiffDeny",
--     "ClaudeCodeCloseAllDiffs",
--   },
--   keys = {
--     { "<leader>a", nil, desc = "AI/Claude Code" },
--     { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
--     { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
--     { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
--     { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
--     { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
--     { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
--     { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
--     {
--       "<leader>as",
--       "<cmd>ClaudeCodeTreeAdd<cr>",
--       desc = "Add file",
--       ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
--     },
--     -- Diff management
--     { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
--     { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
--   },
-- }
}
