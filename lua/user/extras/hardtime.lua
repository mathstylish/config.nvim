local M = {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
}

function M.config()
  require("hardtime").setup {
    disable_mouse = false,
  }
end

return M
