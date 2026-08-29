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
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local map = vim.keymap.set

      -- Navigation
      map("n", "gd", vim.lsp.buf.definition, { desc = "LSP: definition" })
      map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: declaration" })
      map("n", "gr", vim.lsp.buf.references, { desc = "LSP: references" })
      map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP: implementation" })
      map("n", "gK", vim.lsp.buf.signature_help, { desc = "LSP: signature help" })
      map("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: signature help" })
      map("n", "K", vim.lsp.buf.hover, { desc = "LSP: hover" })

      -- Refactor / code action
      map("n", "<leader>rn", function() return ":IncRename " .. vim.fn.expand("<cword>") end,
        { expr = true, desc = "LSP: rename" })

      -- Diagnostics
      map("n", "[d", vim.diagnostic.goto_prev,
        { desc = "Diagnostic: prev" })
      map("n", "]d", vim.diagnostic.goto_next,
        { desc = "Diagnostic: next" })
      map("n", "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
        { desc = "Diagnostic: prev error" })
      map("n", "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end,
        { desc = "Diagnostic: next error" })
      map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostic: float" })
      map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostic: loclist" })
      map("n", "<leader>dq", vim.diagnostic.setqflist, { desc = "Diagnostic: quickfix" })

      -- LSP management
      map("n", "<leader>lR", function()
        vim.cmd.LspRestart()
      end, { desc = "LSP: restart" })
      map("n", "<leader>li", function()
        vim.cmd.LspInfo()
      end, { desc = "LSP: info" })

      -- LSP pickers (via snacks, for ops not covered by fzf-lua)
      map("n", "<leader>lt", function()
        require("snacks").picker.lsp_type_definitions()
      end, { desc = "LSP: type definitions" })
      map("n", "<leader>lS", function()
        require("snacks").picker.lsp_workspace_symbols()
      end, { desc = "LSP: workspace symbols" })

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
              on_attach = function(client, bufnr)
                if client.server_capabilities.inlayHintProvider then
                  vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
                if client.server_capabilities.documentFormattingProvider then
                  map("n", "<leader>lf", function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                  end, { buffer = bufnr, desc = "LSP: format buffer" })
                end
              end,
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
