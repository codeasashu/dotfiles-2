require "custom.mappings"

vim.g["test#python#runner"] = "pytest"
vim.g["test#strategy"] = {
  nearest = 'floaterm',
  file = 'floaterm',
  suite = 'basic'
}
vim.wo.colorcolumn = '80'
