return {
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- vim.g.db_ui_show_help = 0
    vim.g.db_ui_win_position = "right"
    vim.g.db_ui_use_nerd_fonts = 1

    vim.g.db_ui_save_location = "~/.local/share/db_ui"
    -- vim.g.db_ui_tmp_query_location = '~/code/queries'

    vim.g.db_ui_hide_schemas = { "pg_toast_temp.*" }
    local dev_db_pass = vim.fn.system("grep DEV_DB_PASSWORD $HOME/.ssh/db_password | cut -d'=' -f2"):gsub("\n", "")
    local stage_db_pass = vim.fn.system("grep STAGE_DB_PASSWORD $HOME/.ssh/db_password | cut -d'=' -f2"):gsub("\n", "")
    -- local prod_db_pass = vim.fn.system("grep PROD_DB_PASSWORD $HOME/.ssh/db_password | cut -d'=' -f2"):gsub("\n", "")
    vim.g.dbs = {
      -- dev = vim.fn.escape(os.getenv("DEV_DB_URL"), "'"),
      -- staging = vim.fn.escape(vim.fn.system("grep STAGE_DB $HOME/.ssh/db_passwords | cut -d'=' -f2"), "'"),
      -- prod = vim.fn.escape(vim.fn.system("grep PROD_DB $HOME/.ssh/db_passwords | cut -d'=' -f2"), "'"),
      dev = string.format(
        "mysql://ashutoshusr:%s@myop-dev-mysql8-cluster.cluster-cwytract4huq.ap-south-1.rds.amazonaws.com/myoperator_test",
        vim.fn.escape(dev_db_pass, "'")
      ),
      staging = string.format(
        "mysql://stageashutoshusr:%s@stage.cluster-czbb37b3ovej.ap-south-1.rds.amazonaws.com/myoperator",
        stage_db_pass
      ),
    }
  end,
}
