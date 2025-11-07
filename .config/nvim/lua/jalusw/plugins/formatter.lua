return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        sh = { "shfmt" },
      },
      format_on_save = function(bufnr)
        if vim.bo[bufnr].filetype == "markdown" then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    },
  },
}
