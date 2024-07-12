local M = {
  "olexsmir/gopher.nvim",
  ft = "go",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- "mfussenegger/nvim-dap", -- (optional) only if you use `gopher.dap`
  },
}

function M.config(_, opts)
  require("gopher").setup(opts)
end

function M.build()
  vim.cmd [[silent! GoInstallDeps]]
end

return M
