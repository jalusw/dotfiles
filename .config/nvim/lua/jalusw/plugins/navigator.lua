return {
  {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Grapple", "GrapplePopup" },
    keys = function()
      local grapple = require("grapple")
      return {
        { "<leader><tab>", grapple.open_tags,                            desc = "Tag file" },
        { "<leader>tt",    grapple.toggle,                               desc = "Toggle tag for current file" },
        { "<leader>tr",    grapple.untag,                                desc = "Remove tag" },
        { "<leader>tx",    grapple.reset,                                desc = "List tags (popup)" },
        { "<leader>t1",    function() grapple.select({ index = 1 }) end, desc = "Go to tag 1" },
        { "<leader>t2",    function() grapple.select({ index = 2 }) end, desc = "Go to tag 2" },
        { "<leader>t3",    function() grapple.select({ index = 3 }) end, desc = "Go to tag 3" },
        { "<leader>t4",    function() grapple.select({ index = 4 }) end, desc = "Go to tag 4" },
        { "<leader>tn",    grapple.cycle_forward,                        desc = "Next tag" },
        { "<leader>tp",    grapple.cycle_backward,                       desc = "Previous tag" },
      }
    end,
    opts = {
      scope = "git",
      icons = true,
    },
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")

      fzf.setup({
        "default",
        winopts = {
          height = 0.85,
          width = 0.80,
          row = 0.35,
          preview = { layout = "horizontal" },
        },
        files = {
          prompt = "Files❯ ",
          fd_opts = "--color=never --type f --hidden --follow --exclude .git",
        },
      })

      vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find Buffers" })
      vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Find Help" })
      vim.keymap.set("n", "<leader>ld", fzf.lsp_definitions, { desc = "LSP Definitions" })
      vim.keymap.set("n", "<leader>lr", fzf.lsp_references, { desc = "LSP References" })
      vim.keymap.set("n", "<leader>li", fzf.lsp_implementations, { desc = "LSP Implementations" })
      vim.keymap.set("n", "<leader>ls", fzf.lsp_document_symbols, { desc = "LSP Symbols" })
      vim.keymap.set("n", "<leader>lw", fzf.lsp_workspace_symbols, { desc = "LSP Workspace Symbols" })
      vim.keymap.set("n", "<leader>le", fzf.diagnostics_document, { desc = "Show Diagnostics" })
    end,
  },
}
