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

  wk.add {
    { "<leader>t", group = "Test" },
    { "<leader>tO", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Toggle Output Panel" },
    { "<leader>tS", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop" },
    { "<leader>ta", "<cmd>lua require('neotest').run.run(vim.uv.cwd())<cr>", desc = "All Files" },
    { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File" },
    { "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Last" },
    { "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", desc = "Nearest" },
    {
      "<leader>to",
      "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<cr>",
      desc = "Show Output",
    },
    { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Toggle Summary" },
  }

  require("neotest").setup {
    adapters = {
      require "neotest-java",
      require "neotest-jest" {
        jestCommand = "npm test --",
        jestConfigFile = "custom.jest.config.ts",
        env = { CI = true },
        cwd = function(path)
          return vim.fn.getcwd()
        end,
      },
    },
  }
end

return M
