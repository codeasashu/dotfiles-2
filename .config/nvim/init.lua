-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local dap = require("dap")
vim.fn.sign_define("DapBreakpoint", { text = "🐞" })
