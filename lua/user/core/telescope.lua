local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make CC=gcc" },
    "nvim-telescope/telescope-project.nvim",
  },
}

function M.config()
  local actions = require "telescope.actions"
  require("telescope").setup {
    defaults = {
      initial_mode = "insert",
      file_ignore_patterns = { "node_modules" },
      mappings = {
        n = {
          ["q"] = "close",
          ["<C-j>"] = "preview_scrolling_down",
          ["<C-k>"] = "preview_scrolling_up",
          ["o"] = "select_default",
          ["s"] = "select_vertical",
          ["v"] = "select_horizontal",
        },
        i = {
          ["<C-c>"] = "close",
          ["<C-f>"] = "preview_scrolling_down",
          ["<C-b>"] = "preview_scrolling_up",
          ["<C-k>"] = "move_selection_previous",
          ["<C-j>"] = "move_selection_next",
          ["<C-o>"] = "select_default",
          ["<C-s>"] = "select_vertical",
          ["<C-v>"] = "select_horizontal",
        },
      },
    },
    pickers = {
      find_files = {
        no_ignore = false,
        file_ignore_patterns = {
          ".git/.*",
          "node_modules/.*",
        },
        hidden = true,
        layout_config = {
          width = 0.80,
          horizontal = {
            preview_width = 0.60,
          },
        },
      },
      live_grep = {
        additional_args = { "--hidden" },
      },
      help_tags = {
        layout_config = {
          width = 0.80,
          horizontal = {
            preview_width = 0.60,
          },
        },
      },
      colorscheme = {
        enable_preview = true,
      },
      buffers = {
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },
      diagnostics = {
        initial_mode = "normal",
      },
      lsp_references = {
        initial_mode = "normal",
      },
    },
    extensions = {
      persisted = {
        layout_config = {
          width = 0.55,
          height = 0.55,
        },
      },
    },
  }

  require("telescope").load_extension "fzf"
  -- require("telescope").load_extension "persisted"

  local keymap = require "user.util.keymap"

  keymap.add("n", "<leader>fM", "<cmd>Telescope man_pages<cr>", "[Find] [M]an Pages")
  keymap.add("n", "<leader>fb", "<cmd>Telescope buffers<cr>", "[Find] [B]uffers")
  keymap.add("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", "[Find] [C]olorschemes")
  keymap.add("n", "<leader>ff", "<cmd>Telescope find_files<cr>", "[Find] [F]iles")
  keymap.add("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", "[Find] [T]ags")
  keymap.add("n", "<leader>ft", "<cmd>Telescope live_grep<cr>", "[Find] [T]ext")
end

return M
