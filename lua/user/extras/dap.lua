local M = {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- ui plugins to make debugging simplier
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
}

function M.config()
  -- gain access to the dap plugin and its functions
  local dap = require "dap"
  -- gain access to the dap ui plugin and its functions
  local dapui = require "dapui"

  -- Setup the dap ui with default configuration
  dapui.setup()

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end

  local keymap = require "user.util.keymap"

  -- set a vim motion for <Space> + d + t to toggle a breakpoint at the line where the cursor is currently on
  keymap.add("n", "<leader>dt", dap.toggle_breakpoint, "[D]ebug [T]oggle Breakpoint")

  -- set a vim motion for <Space> + d + s to start the debugger and launch the debugging ui
  keymap.add("n", "<leader>ds", dap.continue, "[D]ebug [S]tart")

  -- set a vim motion to close the debugging ui
  keymap.add("n", "<leader>dc", dapui.close, "[D]ebug [C]lose")

  keymap.add({ "n", "v" }, "<leader>de", "<cmd>lua require('dapui').eval()<cr>", "[D]ebug [E]valuate")
end

return M
