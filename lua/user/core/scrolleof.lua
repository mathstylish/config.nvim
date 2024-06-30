local M = {
  "Aasim-A/scrollEOF.nvim",
  event = { "CursorMoved", "WinScrolled" },
}

function M.config()
  require("scrollEOF").setup {
    pattern = "*",
    insert_mode = true,
    floating = true,
    disabled_filetypes = {},
    disabled_modes = {},
  }
end

return M
