local wk = require "which-key"

wk.add {
  { "<leader>G", group = "Gopher" },
  { "<leader>j", "<cmd>GoTagAdd json<cr>", desc = "TagAdd json" },
  { "<leader>y", "<cmd>GoTagAdd yaml<cr>", desc = "TagAdd yaml" },
  { "<leader>m", "<cmd>GoMod tidy<cr>", desc = "Tidy" },
  { "<leader>g", "<cmd>GoGet <cr>", desc = "Get <package-name>" },
  { "<leader>t", "<cmd>GoTestsAll<cr>", desc = "Generate all tests" },
  { "<leader>e", "<cmd>GoIfErr<cr>", desc = "Generate if err clause" },
}
