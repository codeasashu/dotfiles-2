-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.py" },
--   callback = function()
--     vim.lsp.buf.code_action({
--       context = { only = { "source.organizeImports" } },
--       apply = true,
--     })
--     vim.wait(100)
--   end,
-- })

vim.lsp.set_log_level("info")
