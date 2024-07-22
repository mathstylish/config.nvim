local M = {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
}

function M.config()
  local conform = require "conform"
  local wk = require "which-key"

  wk.add {
    {
      "<leader>lf",
      function()
        conform.format { async = true, lsp_fallback = true }
      end,
      desc = "Conform Format",
    },
  }

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
