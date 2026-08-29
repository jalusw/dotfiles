return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "bash",
          "c",
          "cpp",
          "css",
          "dockerfile",
          "go",
          "gomod",
          "html",
          "java",
          "javascript",
          "json",
          "make",
          "markdown",
          "markdown_inline",
          "python",
          "ruby",
          "rust",
          "sql",
          "tsx",
          "typescript",
          "yaml",
          "toml",
        },
        auto_install = true,
      })
    end,
  },
}
