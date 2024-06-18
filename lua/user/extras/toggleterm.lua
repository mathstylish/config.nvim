local M = {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = true,
}

function _G.set_terminal_keymaps()
  local keymap = vim.keymap
  local opts = { buffer = 0 }
  keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

function M.config()
  require("toggleterm").setup {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.3
      end
    end,
    open_mapping = [[<c-t>]],
    start_in_insert = true,
    direction = "vertical",
  }

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
end

return M
