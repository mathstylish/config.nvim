local M = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200
    end,
}

return M