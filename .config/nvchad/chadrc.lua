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
  status = {
      colorizer = true,
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  default_plugin_config_replace = {
      nvim_treesitter = plugin_conf.treesitter,
      nvim_tree = plugin_conf.nvimtree,
  },
  install = userPlugins,
}

return M