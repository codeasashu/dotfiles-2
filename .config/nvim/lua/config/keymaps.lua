-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
local map = vim.keymap.set

map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk_inline <cr>", { desc = "Preview Hunk" })
map("n", "<TAB>", "<cmd>BufferLineCycleNext <cr>", { desc = "Next Buffer" })
map("n", "<S-TAB>", "<cmd>BufferLineCyclePrev <cr>", { desc = "Prev Buffer" })
map("n", "<leader>m", "<cmd>Neotree toggle <cr>", { desc = "Toggle Neotree" })
map("n", "<C-n>", "<cmd>enew <cr>", { desc = "New buffer" })

vim.cmd([[
let g:fugitive_gitlab_domains = ['https://gitlab.myoperator.biz']
]])
