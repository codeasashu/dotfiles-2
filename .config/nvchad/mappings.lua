local M = {}

M.disabled = {
   n = {
      ["<S-b>"] = "",
   },
}

M.truzen = {
   n = {
      ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "   truzen ataraxis" },
      ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "   truzen minimal" },
      ["<leader>tf"] = { "<cmd> TZFocus <CR>", "   truzen focus" },
   },
}

M.treesitter = {
   n = {
      ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "  find media" },
   },
}

M.fugitive = {
  n = {
    ["<leader>gs"] = { "<cmd> Git <CR>",  "git signs"},
    -- ["<leader>j"] = { "<cmd> Git <CR",  "git signs"},
  }
}

M.telescope = {
  n = {
    ["<leader>te"] = { "<cmd> Telescope <CR>",  "open telescope"},
    ["<leader>j"] = { "<cmd> Telescope jumplist<CR>",  "jump list"},
    [",/"] = { "<cmd> Telescope live_grep<CR>",  "live grep"},
    [",p"] = { "<cmd> Telescope find_files<CR>",  "find files"},
  }
}

M.nvimtree = {
  n = {
    ["<leader>m"] = { "<cmd> NvimTreeToggle <CR>",  "open telescope"},
  }
}

M.gitsigns = {
  n = {
    ["]c"] = { "<cmd> Gitsigns next_hunk <CR>",  "next git hunk" },
    ["[c"] = { "<cmd>  Gitsigns prev_hunk <CR>",  "prev git hunk" },
    ["<leader>hp"] = { "<cmd>  Gitsigns preview_hunk <CR>",  "preview git hunk" },
  }
}
-- telescope
-- map("n", "<leader>te", ":Telescope <CR>")
-- map("n", "<leader>m", ":NvimTreeToggle <CR>")
-- map("n", "<leader>h", ":FloatermToggle <CR>")

-- gitsigns
-- map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
-- map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
-- map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')

-- fugitive
-- map('n', '<leader>gs', ':Git <CR>')
-- map('n', '<leader>j', ':Telescope jumplist <CR>')
-- map('n', ',/', ':Telescope live_grep <CR>')
-- map('n', ',p', ':Telescope find_files <CR>')

-- tests
-- map('n', '<leader>tt', ":TestFile <CR>")
-- map('n', '<leader>tn', ":TestNearest <CR>")
-- map('n', '<leader>tl', ":TestLast <CR>")
-- map('n', '<leader>tv', ":TestVisit <CR>")
--
--

return M
