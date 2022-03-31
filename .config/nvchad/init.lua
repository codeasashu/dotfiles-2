require "custom.mappings"

vim.g["test#python#runner"] = "pytest"
vim.g["test#strategy"] = {
  nearest = 'dispatch',
  file = 'dispatch',
  suite = 'basic'
}
vim.wo.colorcolumn = '80'
