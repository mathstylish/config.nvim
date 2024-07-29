local M = {
  "nvim-pack/nvim-spectre",
  build = false,
  cmd = "Spectre",
  opts = { cmd = "noswapfile vnew" },
  keys = {
    { "<leader>fr", "<cmd>lua require('spectre').open()<cr>", desc = "[F]ind [R]eplace" },
  },
}

return M
