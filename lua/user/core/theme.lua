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

  bamboo = {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bamboo").setup {}
      require("bamboo").load()
    end,
  },

  gruvbox = {
    "f4z3r/gruvbox-material.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox-material").setup {
        contrast = "hard",
        background = {
          transparent = false,
        },
      }
    end,
  },
}

local M = {
  themes.gruvbox,
}

return M
