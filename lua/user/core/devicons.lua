local M = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
}
function M.config()
  local devicons = require "nvim-web-devicons"

  devicons.setup {}

  devicons.set_icon {
    lockb = {
      icon = "",
      color = "#cbcb41",
      name = "lockb",
    },
    ["tsx"] = {
      icon = "",
      color = "#519aba",
      cterm_color = "26",
      name = "Tsx",
    },
    toml = {
      icon = "",
      color = "#6e8086",
      name = "toml",
    },
    go = {
      icon = "󰟓",
      color = "#00acd7",
      name = "go",
    },
    [".npmignore"] = {
      icon = "",
      color = "#c63c42",
      name = ".npmignore",
    },
    ["tsconfig.tsbuildinfo"] = {
      icon = "",
      color = "#cbcb41",
      name = "tsconfig.tsbuildinfo",
    },
    [".swcrc"] = {
      icon = "",
      color = "#cbcb41",
      name = ".swcrc",
    },
    ["go.mod"] = {
      icon = "󰟓",
      color = "#ce3262",
      name = "go.mod",
    },
    ["go.sum"] = {
      icon = "󰟓",
      color = "#ce3262",
      name = "go.sum",
    },
  }
end

return M
