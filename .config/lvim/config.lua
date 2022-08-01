--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
vim.wo.colorcolumn = '80'

lvim.builtin.telescope.defaults.vimgrep_arguments = {
  "rg",
  "--color=never",
  "--no-heading",
  "--with-filename",
  "--line-number",
  "--column",
  "--smart-case",
}
lvim.builtin.telescope.pickers.sort_mru = true
lvim.builtin.telescope.pickers.buffers = {
  sort_mru = true,
  sort_lastused = true,
}
lvim.builtin.telescope.defaults.prompt_prefix = " 🔍  "
lvim.builtin.telescope.defaults.initial_mode = "insert"
lvim.builtin.telescope.defaults.selection_strategy = "reset"
lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.layout_config = {
  horizontal = {
    prompt_position = "top",
    preview_width = 0.55,
    results_width = 0.8,
  },
  vertical = {
    mirror = false,
  },
  width = 0.87,
  height = 0.80,
  preview_cutoff = 120,
}

lvim.builtin.telescope.defaults.border = {}
lvim.builtin.telescope.defaults.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
lvim.builtin.telescope.defaults.selection_caret = "  "
lvim.builtin.telescope.defaults.entry_prefix = "  "
lvim.builtin.telescope.defaults.file_sorter = require("telescope.sorters").get_fuzzy_file
lvim.builtin.telescope.defaults.path_display = { "truncate" }
lvim.builtin.telescope.defaults.file_ignore_patterns = { "node_modules" }
lvim.builtin.telescope.defaults.generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter
lvim.builtin.telescope.defaults.color_devicons = true
lvim.builtin.telescope.defaults.file_previewer = require("telescope.previewers").vim_buffer_cat.new
lvim.builtin.telescope.defaults.grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new
lvim.builtin.telescope.defaults.qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new
lvim.builtin.telescope.defaults.set_env = { ["COLORTERM"] = "truecolor" }

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "themes")
  pcall(telescope.load_extension, "terms")
end

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-x>"] = "<cmd> BufferKill <cr>"
lvim.keys.normal_mode["<C-n>"] = "<cmd> enew <cr>"
lvim.keys.normal_mode["<C-c>"] = "<cmd> %y+ <cr>"
lvim.keys.normal_mode["<TAB>"] = "<cmd> BufferLineCycleNext <cr>"
lvim.keys.normal_mode["<S-TAB>"] = "<cmd> BufferLineCyclePrev <cr>"
lvim.keys.normal_mode["<leader>m"] = "<cmd> NvimTreeToggle <CR>"
lvim.keys.normal_mode["<leader>n"] = "<cmd> set nu! <CR>"
lvim.keys.normal_mode["<leader>rn"] = "<cmd> set rnu! <CR>"
lvim.keys.normal_mode["<leader>th"] = "<cmd> Telescope colorscheme <CR>"
-- lvim.keys.normal_mode[",/"] = "<cmd> Telescope live_grep <CR>"
-- lvim.keys.normal_mode[",p"] = "<cmd> Telescope git_files<CR>"
lvim.keys.normal_mode["[c"] = "<cmd> Gitsigns prev_hunk<CR>"
lvim.keys.normal_mode["]c"] = "<cmd> Gitsigns next_hunk<CR>"
lvim.keys.normal_mode["<leader>hp"] = "<cmd> Gitsigns preview_hunk<CR>"

lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

lvim.builtin.which_key.mappings["g"] = {
  name = "Git",
  s = { "<cmd> Git <cr>", "git" },
  r = { "<cmd> Git reset hunk <cr>", "workspace" },
  b = { "<cmd> GBrowse <cr>", "workspace" },
}


vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <silent> [d <cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.cmd("nnoremap <silent> ]d <cmd>lua vim.diagnostic.goto_next()<CR>")
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.open_on_tab = false
lvim.builtin.nvimtree.setup.disable_netrw = false
lvim.builtin.nvimtree.setup.open_on_setup = false
lvim.builtin.nvimtree.setup.open_on_setup_file = false


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  }
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    name = "proselint"
  },
  {
    name = "gitsigns"
  }
}
-- Additional Plugins
lvim.plugins = {
  { "tpope/vim-dispatch" },
  { "tpope/vim-fugitive" },
  {
    "shumphrey/fugitive-gitlab.vim",
    after = "vim-fugitive",
  },
  { "vim-test/vim-test" },
  { "easymotion/vim-easymotion" },
  { "folke/tokyonight.nvim" },
  { "navarasu/onedark.nvim" },
  { "ggandor/lightspeed.nvim" },
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
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
}

require('onedark').setup {
  style = 'darker'
}
require('onedark').load()

-- require('telescope').setup {
--   defaults = {
--     selection_caret = "  ",
--     entry_prefix = "  ",
--     file_sorter = require("telescope.sorters").get_fuzzy_file,
--     file_ignore_patterns = { "node_modules" },
--     generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
--     path_display = { "truncate" },
--     winblend = 0,
--     border = {},
--     borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
--     color_devicons = true,
--     set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
--     file_previewer = require("telescope.previewers").vim_buffer_cat.new,
--     grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
--     qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
--     -- Developer configurations: Not meant for general override
--     buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
--     mappings = {
--       n = { ["q"] = require("telescope.actions").close },
--     },
--   },

--   extensions_list = { "themes", "terms" },
-- }


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
