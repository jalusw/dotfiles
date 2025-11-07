return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "vim",
          "bash",
          "python",
          "javascript",
          "typescript",
          "html",
          "css",
          "json",
          "markdown",
          "c",
        },
        auto_install = true,
      })
    end,
  },
}
