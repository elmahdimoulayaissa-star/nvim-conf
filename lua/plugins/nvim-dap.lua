return{
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim", -- installs codelldb via mason
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb" },
      automatic_installation = true,
    })

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.cpp = {
      {
        name = "Launch (build first)",
        type = "codelldb",
        request = "launch",
        program = function()
          -- runs your build (make/cmake) before asking what binary to debug
          vim.fn.system("make") -- swap for your actual build command
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp

    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
  end,
  keys = {
  --  { "<F5>",  function() require("dap").continue() end,          desc = "DAP Continue" },
    { "<F9>",  function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<F10>", function() require("dap").step_over() end,         desc = "Step Over" },
    { "<F11>", function() require("dap").step_into() end,         desc = "Step Into" },
  },
}
