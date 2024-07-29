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
  local keymap = require "user.util.keymap"

  keymap.add("n", "<leader>tO", "<cmd>lua require('neotest').output_panel.toggle()<cr>", "[T]est Toggle [O]utput Panel")
  keymap.add("n", "<leader>tS", "<cmd>lua require('neotest').run.stop()<cr>", "[T]est [Stop]")
  keymap.add("n", "<leader>ta", "<cmd>lua require('neotest').run.run(vim.uv.cwd())<cr>", "[T]est [A]ll Files")
  keymap.add("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "[T]est [F]ile")
  keymap.add("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", "[T]est [L]ast")
  keymap.add("n", "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", "[T]est [N]earest")
  keymap.add(
    "n",
    "<leader>to",
    "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<cr>",
    "[T]est Show [O]utput"
  )
  keymap.add("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", "[T]est Toggle [S]ummary")

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
