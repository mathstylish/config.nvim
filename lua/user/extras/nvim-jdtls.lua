local M = {
  "mfussenegger/nvim-jdtls",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  ft = { "java" },
}

function M.config()
  require "user.extras.lsp.jdtls"
end

return M
