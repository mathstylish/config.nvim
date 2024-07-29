local M = {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
}

function M.config()
  local conform = require "conform"
  local keymap = require "user.util.keymap"

  keymap.add("n", "<leader>lf", function()
    conform.format { async = true, lsp_fallback = true }
  end, "Conform [L]sp [F]ormat")

  conform.setup {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      yaml = { "yamlfix" },
      go = { "goimports_reviser", "gofumpt" },
    },
    format_after_save = { async = true, lsp_fallback = true },
  }
end

return M
