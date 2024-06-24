local M = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
}

function M.config()
  local mason = require "mason"
  local mason_lspconfig = require "mason-lspconfig"
  local mason_tool_installed = require "mason-tool-installer"
  local icons = require "user.util.icons"

  mason.setup {
    ui = {
      icons = {
        package_installed = icons.ui.Check,
        package_pending = icons.ui.BoldArrowRight,
        package_uninstalled = icons.ui.BoldClose,
      },
    },
  }

  mason_lspconfig.setup {
    ensure_installed = {
      "lua_ls",
      "tsserver",
      "eslint",
      "jsonls",
      "yamlls",
      "jdtls",
    },

    -- auto-install configured servers (with lspconfig)
    automatic_installation = true, -- not the same as ensure_installed
  }

  mason_tool_installed.setup {
    ensure_installed = {
      "stylua",
      "prettier",
      "prettierd",
      "yamlfix",
      "java-debug-adapter",
      "java-test",
    },
  }
end

return M
