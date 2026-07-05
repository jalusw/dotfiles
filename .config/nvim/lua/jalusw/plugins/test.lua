return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
    },
    event = "VeryLazy",
    opts = {
      adapters = {
        require("neotest-python")({ dap = { justTest = false } }),
        require("neotest-go"),
      },
      status = { virtual_text = true },
      output = { open_on_run = true },
    },
    keys = {
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file" },
      { "<leader>tf", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run all tests" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run last test" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Show output" },
    },
  },
}
