local wk = require "which-key"

wk.register({
  G = {
    name = "Gopher",
    j = { "<cmd>GoTagAdd json<cr>", "TagAdd json" },
    y = { "<cmd>GoTagAdd yaml<cr>", "TagAdd yaml" },
    m = { "<cmd>GoMod tidy<cr>", "Tidy" },
    g = { "<cmd>GoGet <cr>", "Get <package-name>" },
    t = { "<cmd>GoTestsAll<cr>", "Generate all tests" },
    e = { "<cmd>GoIfErr<cr>", "Generate if err clause" },
  },
}, { prefix = "<leader>" })
