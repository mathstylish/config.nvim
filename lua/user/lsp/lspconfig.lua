local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
  },
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap

  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

  vim.keymap.set("n", "K", function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end)

  vim.keymap.set("n", "<leader>lh", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(bufnr)) -- set to true if you want enabled by default
  end, { desc = "Toggle Inlay Hints" })
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)

  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(false) -- set to true if you want enabled by default
  end

  -- highlight occurrences
  if client.supports_method "textDocument/documentHighlight" then
    vim.api.nvim_exec2(
      [[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
            ]],
      { output = false }
    )
  end
end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local status_ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok_cmp then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  end

  local status_ok_file_ops, file_operations = pcall(require, "lsp-file-operations")
  if status_ok_file_ops then
    capabilities = vim.tbl_deep_extend("force", capabilities, file_operations.default_capabilities())
  end

  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  return capabilities
end

function M.config()
  local wk = require "which-key"

  wk.register({
    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      i = { "<cmd>LspInfo<cr>", "Info" },
      j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
      k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      s = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
    },
  }, { prefix = "<leader>" })

  local lspconfig = require "lspconfig"
  local icons = require "user.util.icons"

  local servers = {
    "lua_ls",
    "eslint",
    "jsonls",
    "yamlls",
    "prismals",
    "docker_compose_language_service",
    "dockerls",
  }

  vim.diagnostic.config {
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
        [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
        [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
        [vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
      },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      header = "",
      prefix = "",
    },
  }

  -- extend default config with file operations capabilities (look at M.common_capabilities too)
  lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
    capabilities = M.common_capabilities(),
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "user.lsp.servers." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    -- if server == "lua_ls" then
    --   require("neodev").setup {}
    -- end
    --
    lspconfig[server].setup(opts)
  end
end

return M
