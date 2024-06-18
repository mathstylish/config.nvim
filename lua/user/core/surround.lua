local M = {
  "kylechui/nvim-surround",
  event = "VeryLazy",
}

function M.config()
  require("nvim-surround").setup {
    keymaps = { -- vim-surround style keymaps
      insert = "<C-g>s",
      insert_line = "<C-g>S",
      normal = "s",
      visual = "s",
      delete = "ds",
      change = "cs",
      normal_line = "S",
      normal_cur_line = "SS",
      visual_line = "gS",
    },
  }
  vim.cmd [[ nmap <leader>' _saw' ]]
  vim.cmd [[ nmap <leader>" _saw" ]]
  vim.cmd [[ nmap <leader>{ _saw{ ]]
  vim.cmd [[ nmap <leader>[ _saw[ ]]
  vim.cmd [[ nmap <leader>( _saw( ]]

  vim.cmd [[ vmap <leader>' s' ]]
  vim.cmd [[ vmap <leader>" s" ]]
  vim.cmd [[ vmap <leader>{ s{ ]]
  vim.cmd [[ vmap <leader>[ s[ ]]
  vim.cmd [[ vmap <leader>( s( ]]
end

return M
