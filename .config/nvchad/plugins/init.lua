-- /lua/custom/plugins/init.lua
return {
  {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
   {
     "tpope/vim-dispatch"
   },
   {
     "tpope/vim-fugitive"
   },
   {
     "voldikss/vim-floaterm"
   },
   {
     "shumphrey/fugitive-gitlab.vim",
   },
   {
     "jose-elias-alvarez/nvim-lsp-ts-utils"
   },
   {
     "vim-test/vim-test", 
   },
   {
     "easymotion/vim-easymotion"
   },
   {
      "Pocco81/TrueZen.nvim",
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
