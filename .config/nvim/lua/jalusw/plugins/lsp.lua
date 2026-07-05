return {
  {
    "folke/neoconf.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local on_attach = function(client, bufnr)
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

        -- Inlay hints
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      end

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "bashls",
          "ts_ls",
          "jsonls",
          "rust_analyzer",
          "gopls",
          "clangd",
        },
        automatic_installation = true,
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
              on_attach = on_attach,
            })
          end,
        },
      })
    end,
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "neovim/nvim-lspconfig",
      {
        "saghen/blink.compat",
        opts = { default_integrations = false },
      },
    },
    opts = {
      keymap = {
        preset = "default",
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-y>"] = { "select_and_accept", "fallback" },
      },
      appearance = { use_nvim_cmp_as_default = true },
      sources = {
        default = { "lsp", "path", "buffer", "snippets" },
        per_filetype = { codecompanion = { "lsp" } },
      },
      completion = {
        documentation = { auto_show = true },
      },
    },
  },
}
