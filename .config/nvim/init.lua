-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local dap = require("dap")
vim.fn.sign_define("DapBreakpoint", { text = "🐞" })
vim.keymap.set("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
