local M = {}
local plugin_conf = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"
--
-- M.mappings = {
--   terminal = {
--       new_horizontal = "",
--       new_vertical = "",
--   }
-- }
--

M.plugins = {
  builtins = {
      "2html_plugin",
      "getscript",
      "getscriptPlugin",
      "gzip",
      "logipat",
      -- "netrw",
      "netrwPlugin",
      "netrwSettings",
      "netrwFileHandlers",
      "matchit",
      "tar",
      "tarPlugin",
      "rrhelper",
      "spellfile_plugin",
      "vimball",
      "vimballPlugin",
      "zip",
      "zipPlugin",
  },
  override = {
      ["kyazdani42/nvim-tree.lua"] = plugin_conf.nvimtree,
      ["nvim-treesitter/nvim-treesitter"] = plugin_conf.treesitter,
  },
  status = {
      colorizer = true,
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  user = userPlugins,
}

M.mappings = require "custom.mappings"

return M
