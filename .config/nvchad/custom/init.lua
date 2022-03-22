require "custom.mappings"

vim.g["test#python#runner"] = "pytest"
vim.g["test#strategy"] = {
  nearest = 'neovim',
  file = 'neovim',
  suite = 'basic'
}
