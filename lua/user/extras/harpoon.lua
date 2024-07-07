local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  local harpoon = require "harpoon"

  --REQUIRED
  harpoon:setup()
  -- REQUIRED

  -- TELESCOPE as UI
  -- basic telescope configuration
  local function toggle_telescope(harpoon_files)
    local finder = function()
      local paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(paths, item.value)
      end

      return require("telescope.finders").new_table {
        results = paths,
      }
    end

    require("telescope.pickers")
      .new({}, {
        prompt_title = "Harpoon",
        finder = finder(),
        previewer = false,
        sorter = require("telescope.config").values.generic_sorter {},
        layout_config = {
          height = 0.4,
          width = 0.5,
          prompt_position = "bottom",
          preview_cutoff = 120,
        },
        initial_mode = "normal",
        attach_mappings = function(prompt_bufnr, map)
          local delete_buffer = function()
            local state = require "telescope.actions.state"
            local selected_entry = state.get_selected_entry()
            local current_picker = state.get_current_picker(prompt_bufnr)

            table.remove(harpoon_files.items, selected_entry.index)
            current_picker:refresh(finder())
          end
          map("i", "<C-d>", delete_buffer)
          map("n", "dd", delete_buffer)
          return true
        end,
      })
      :find()
  end
  -- TELESCOPE as UI

  -- harpoon mappings
  vim.keymap.set("n", "<TAB>", function()
    toggle_telescope(harpoon:list())
  end)

  local wk = require "which-key"
  wk.register({
    h = {
      name = "Harpoon",
      a = {
        function()
          harpoon:list():add()
        end,
        "Add to list",
      },
      h = {
        function()
          harpoon:list():prev()
        end,
        "Prev buffer",
      },
      l = {
        function()
          harpoon:list():next()
        end,
        "Next buffer",
      },
      f = {
        function()
          harpoon:list():select(1)
        end,
        "First buffer",
      },
      s = {
        function()
          harpoon:list():select(2)
        end,
        "Second buffer",
      },
      t = {
        function()
          harpoon:list():select(3)
        end,
        "Third buffer",
      },
    },
  }, { prefix = "<leader>" })
end

return M
