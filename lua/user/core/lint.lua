local M = {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
}

M.linters = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
}

M.config = function()
  local lint = require "lint"
  lint.linters_by_ft = M.linters

  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("lint", { clear = true }),
    callback = function()
      lint.try_lint(nil, { ignore_errors = true })
    end,
  })
end

return M
