-- /lua/custom/plugins/init.lua
return {
  ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
  },
  ["tpope/vim-dispatch"] = {},
  ["tpope/vim-fugitive"] = {},
  ["shumphrey/fugitive-gitlab.vim"] = {
    after = "vim-fugitive",
  },
  ["jose-elias-alvarez/nvim-lsp-ts-utils"] = {},
  ["vim-test/vim-test"] = {},
  ["easymotion/vim-easymotion"] = {},
  ["Pocco81/TrueZen.nvim"] = {
      cmd = {
         "TZAtaraxis",
         "TZMinimalist",
         "TZFocus",
      },
      config = function()
         require "custom.plugins.truezen"
      end,
  },
}
