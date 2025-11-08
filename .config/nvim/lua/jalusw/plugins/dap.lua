return {
  "mfussenegger/nvim-dap",
  lazy = true,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },
  keys = {
    {
      "<leader>d",
      group = "Debugger",
      nowait = true,
      remap = false,
    },
    {
      "<leader>db",
      function() require("dap").toggle_breakpoint() end,
      desc = "Toggle Breakpoint"
    },
    {
      "<leader>dc",
      function() require("dap").continue() end,
      desc = "Continue"
    },
    {
      "<leader>dC",
      function() require("dap").run_to_cursor() end,
      desc = "Run to Cursor"
    },
    {
      "<leader>di",
      function() require("dap").step_into() end,
      desc = "Step Into",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
      nowait = true,
      remap = false,
    },
    {
      "<leader>du",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
      nowait = true,
      remap = false,
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.open()
      end,
      desc = "Open REPL",
      nowait = true,
      remap = false,
    },
    {
      "<leader>dq",
      function() require("dap").terminate() end,
      desc = "Terminate"
    },
  },
  config = function()
    local mason_dap = require("mason-nvim-dap")
    local dap = require("dap")
    local ui = require("dapui")
    local dap_virtual_text = require("nvim-dap-virtual-text")

    dap_virtual_text.setup()

    mason_dap.setup({
      ensure_installed = { "cppdbg", "python", "node2", "codelldb", "delve" },
      automatic_installation = true,
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })

    dap.configurations = {
      c = {
        {
          name = "Launch file",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
          MIMode = "lldb",
        },
        {
          name = "Attach to lldbserver :1234",
          type = "cppdbg",
          request = "launch",
          MIMode = "lldb",
          miDebuggerServerAddress = "localhost:1234",
          miDebuggerPath = "/usr/bin/lldb",
          cwd = "${workspaceFolder}",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
        },
      },
      python = {
        {
          name = "Launch file",
          type = "python",
          request = "launch",
          program = "${file}",
          console = "integratedTerminal",
          cwd = "${workspaceFolder}",
        },
      },
      rust = {
        {
          name = "Launch executable",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      },
      go = {
        {
          name = "Debug file",
          type = "delve",
          request = "launch",
          program = "${file}",
        },
        {
          name = "Debug package",
          type = "delve",
          request = "launch",
          program = "${workspaceFolder}",
        },
        {
          name = "Attach to process",
          type = "delve",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      },
      javascript = {
        {
          name = "Launch file",
          type = "node2",
          request = "launch",
          program = "${file}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          protocol = "inspector",
          console = "integratedTerminal",
        },
      },
    }

    -- Dap UI

    ui.setup()

    vim.fn.sign_define("DapBreakpoint", { text = "*" })

    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end
  end
}
