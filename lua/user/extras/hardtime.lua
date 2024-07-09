local M = {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "rcarriga/nvim-notify" },
}

function M.config()
  vim.notify = require "notify"
  require("hardtime").setup {
    disable_mouse = false,
    -- disabled_keys = {
    --   ["<Left>"] = { "n" },
    --   ["<Right>"] = { "n" },
    -- },
  }
end

return M
