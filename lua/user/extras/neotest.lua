local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- adapters
    "rcasia/neotest-java",
    "nvim-neotest/neotest-jest",
  },
}

function M.config()
  local wk = require "which-key"
  wk.register({
    t = {
      name = "Test",
      t = { "<cmd>lua require'neotest'.run.run()<cr>", "Nearest" },
      f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "File" },
      d = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug" },
      s = { "<cmd>lua require('neotest').run.stop()<cr>", "Test" },
      a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
    },
  }, { prefix = "<leader>" })

  require("neotest").setup {
    adapters = {
      require "neotest-java",
      require "neotest-jest",
    },
  }
end

return M
