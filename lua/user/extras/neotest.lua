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
      f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "File" },
      a = { "<cmd>lua require('neotest').run.run(vim.uv.cwd())<cr>", "All Files" },
      n = { "<cmd>lua require('neotest').run.run()<cr>", "Nearest" },
      l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Last" },
      s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Toggle Summary" },
      o = { "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<cr>", "Show Output" },
      O = { "<cmd>lua require('neotest').output_panel.toggle()<cr>", "Toggle Output Panel" },
      S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
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
