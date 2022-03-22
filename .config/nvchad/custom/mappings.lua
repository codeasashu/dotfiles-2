local map = require("core.utils").map

-- telescope
map("n", "<leader>te", ":Telescope <CR>")
map("n", "<leader>m", ":NvimTreeToggle <CR>")

-- truezen
map("n", "<leader>ta", ":TZAtaraxis <CR>")
map("n", "<leader>tm", ":TZMinimalist <CR>")
map("n", "<leader>tf", ":TZFocus <CR>")

-- gitsigns
map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')

-- fugitive
map('n', '<leader>gs', ':Git <CR>')
map('n', '<leader>j', ':Telescope jumplist <CR>')
map('n', ',/', ':Telescope live_grep <CR>')
map('n', ',p', ':Telescope find_files <CR>')

-- tests
map('n', '<leader>tt', ":TestFile <CR>")
map('n', '<leader>tn', ":TestNearest <CR>")
map('n', '<leader>tl', ":TestLast <CR>")
map('n', '<leader>tv', ":TestVisit <CR>")
