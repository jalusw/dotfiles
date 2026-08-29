return {
  {
    "2giosangmitom/nightfall.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function(_, opts)
      require("nightfall").setup(opts)
      vim.cmd.colorscheme("nightfall")
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}
  },
  {
    "folke/flash.nvim",
    keys = {
      { "<leader>j",  "",                                           desc = "Jump to" },
      { "<leader>jj", function() require("flash").jump() end,       desc = "Flash Jump", },
      { "<leader>jt", function() require("flash").treesitter() end, desc = "Flash Treesitter", },
      { "<leader>jr", function() require("flash").remote() end,     desc = "Flash Remote", },
      { "<leader>jw", function() require("flash").treesitter_search() end, desc = "Flash Treesitter Search",
      },
      { "<leader>jl", function() require("flash").jump({ continue = true }) end, desc = "Flash Repeat Last Jump",
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    ft = { "markdown" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_browser = ""
      vim.g.mkdp_echo_preview_url = 0
      vim.g.mkdp_browserfunc = ""
      vim.g.mkdp_markdown_css = ""
      vim.g.mkdp_highlight_css = ""
      vim.g.mkdp_port = ""
      vim.g.mkdp_page_title = "「${name}」"
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = "dark"
    end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreview<cr>",     desc = "Markdown Preview" },
      { "<leader>mP", "<cmd>MarkdownPreviewStop<cr>", desc = "Markdown Preview Stop" },
    },
  },
}
