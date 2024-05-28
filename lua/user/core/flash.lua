local M = {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            search = {
                enabled = true
            }
        }
    }
}

M.keys = {
    {
      "<leader><leader>",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
    },
}

function M.init()
    vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#FF0000", bg = "NONE" })
end

return M