local M = {}

function M.add(mode, key, result, desc)
  vim.keymap.set(mode, key, result, { noremap = true, silent = true, desc = desc })
end

return M
