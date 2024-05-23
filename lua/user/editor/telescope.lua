local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make CC=gcc" },
        "nvim-telescope/telescope-project.nvim"
    },
}

function M.config()
    require("telescope").setup {
        defaults = {
            initial_mode = "insert",
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
                        preview_width = 0.60
                    }
                }
            },
            live_grep = {
                additional_args = { "--hidden" }
            },
            help_tags = {
                layout_config = {
                    width = 0.80,
                    horizontal = {
                        preview_width = 0.60
                    }
                }
            },
            colorscheme = {
                enable_preview = true
            }
        }
    }

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("project")

    local wk = require "which-key"

    wk.register({
        f = {
            name = "Find",
            f = { "<cmd>Telescope find_files<cr>", "Files" },
            t = { "<cmd>Telescope live_grep<cr>", "Text" },
            h = { "<cmd>Telescope help_tags<cr>", "Help" },
            d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
            M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
            p = { "<cmd>lua require('telescope').extensions.project.project()<cr>", "Projects" },
            c = { "<cmd>Telescope colorscheme<cr>", "Colorschemes" },
        }
    }, { prefix = "<leader>" })
end

return M