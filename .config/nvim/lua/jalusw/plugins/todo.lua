return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
      keywords = {
        FIX = { icon = "󱐋", color = "error" },
        TODO = { icon = "", color = "info" },
        HACK = { icon = "", color = "warning" },
        WARN = { icon = "", color = "warning" },
        PERF = { icon = "", color = "warning" },
        NOTE = { icon = "", color = "hint" },
      },
    },
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>ft", "<cmd>TodoTrouble<CR>", desc = "Todo (Trouble)" },
    },
  },
}
