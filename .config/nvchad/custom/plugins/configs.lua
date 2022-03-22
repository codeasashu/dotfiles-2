local M = {}

-- overriding default plugin configs!
M.treesitter = {
   ensure_installed = {
      "lua",
      "vim",
      "python",
      "html",
      "css",
      "javascript",
      "json",
      "toml",
      "markdown",
      "c",
      "bash",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
}

return M
