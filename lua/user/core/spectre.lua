local M = {
    "nvim-pack/nvim-spectre",
    build = false,
    cmd = "Spectre",
    opts = { cmd = "noswapfile vnew" },
    keys = {
        { "<leader>sr", "<cmd>lua require('spectre').open()<cr>" },
    }
}

return M