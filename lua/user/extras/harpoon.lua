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
  local conf = require("telescope.config").values
  local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end

    require("telescope.pickers")
      .new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table {
          results = file_paths,
        },
        previewer = conf.file_previewer {},
        sorter = conf.generic_sorter {},
        initial_mode = "normal",
      })
      :find()
  end
  -- TELESCOPE as UI

  -- harpoon mappings
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
      e = {
        function()
          toggle_telescope(harpoon:list())
        end,
        "Show list",
      },
      p = {
        function()
          harpoon:list():prev()
        end,
        "Prev buffer",
      },
      n = {
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
      l = {
        function()
          harpoon:list():select(4)
        end,
        "Last buffer",
      },
    },
  }, { prefix = "<leader>" })
end

return M
