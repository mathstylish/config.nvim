local M = {
  "nvimdev/indentmini.nvim",
}

function M.config()
  require("indentmini").setup {}
  vim.cmd.highlight "IndentLine guifg=#404040"
  vim.cmd.highlight "IndentLineCurrent guifg=#d0d0d0"
end

return M
