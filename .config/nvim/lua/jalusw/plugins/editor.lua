return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
      },
    },
  },
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    opts = {
      delay = 200,
      large_file_cutoff = 5000,
      large_file_overrides = { providers = { "lsp" } },
    },
    config = function()
      vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
}
