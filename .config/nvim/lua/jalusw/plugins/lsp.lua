return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls",
          "pyright",
          "bashls",
          "ts_ls",
          "jsonls"
        },
        automatic_installation = true,
      })

      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map("n", "gd", vim.lsp.buf.definition, "Go to definition")
      map("n", "gr", vim.lsp.buf.references, "Show references")
      map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
      map("n", "K", vim.lsp.buf.hover, "Hover docs")
      map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
      map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
      map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
      map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
      map("n", "<leader>e", vim.diagnostic.open_float, "Line diagnostics")
    end,
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = "neovim/nvim-lspconfig",
    opts = {
      keymap = { preset = "default" },
      appearance = { use_nvim_cmp_as_default = true },
    },
  },
}
