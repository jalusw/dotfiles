return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.ai").setup()
      require("mini.align").setup()
      require("mini.basics").setup({
        options = { basic = true, extra_ui = true, win_borders = "single" },
        mappings = { basic = true, option_toggle_prefix = [[\]] },
      })
      require("mini.bracketed").setup()
      require("mini.comment").setup()
      require("mini.cursorword").setup()
      require("mini.indentscope").setup({
        draw = { delay = 50 },
        symbol = "│",
        options = { try_as_border = true },
      })
      require("mini.move").setup()
      require("mini.operators").setup()
      require("mini.pairs").setup()
      require("mini.sessions").setup()
      require("mini.tabline").setup()
      require("mini.trailspace").setup()
      require("mini.statusline").setup({
        use_icons = true,
        set_vim_settings = true,
      })

      require("mini.animate").setup({
        scroll = { enable = false },
        cursor = { enable = true },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          MiniTrailspace.trim()
        end,
      })

      vim.cmd([[hi MiniIndentscopeSymbol guifg=#666666 gui=nocombine]])
    end,
  },
}
