local themes = {
  nightfox = {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup {
        options = {
          transparent = true,
        },
      }
      vim.cmd.colorscheme "carbonfox"
    end,
  },

  darkplus = {
    "lunarvim/darkplus.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "darkplus"
    end,
  },

  vscode = {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode").setup {
        transparent = true,
      }
      vim.cmd.colorscheme "vscode"
    end,
  },
}

local M = {
  themes.vscode,
}

return M
