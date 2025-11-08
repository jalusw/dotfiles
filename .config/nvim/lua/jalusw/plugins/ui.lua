return {
  {
    "MunifTanjim/nui.nvim",
    lazy = true
  },
  {
    "folke/trouble.nvim",
    opts = {}
  },
  {
    "folke/noice.nvim",
    dependencies = { "rcarriga/nvim-notify" },
    opts = {},
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode"
  },
  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.35,
        color = { "Normal", "#ffffff" },
        term_bg = "#000000",
        inactive = false,
      },
      context = 10,
      treesitter = true,
      expand = {
        "function",
        "method",
        "table",
        "if_statement",
      },
      exclude = {},
    }
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "buffers",
        numbers = "none",
        close_command = "bdelete %d",
        right_mouse_command = "bdelete! %d",
        indicator = { style = "none" },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "x",
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        diagnostics = true,
        color_icons = true,
        separator_style = "thin",
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "oil",
            text = "File Explorer",
            text_align = "left",
            highlight = "Directory",
          },
        },
      },
      highlights = {
        fill = { bg = "none" },
        background = { fg = "#666666", bg = "none" },
        buffer_selected = { fg = "#ffffff", bold = true, italic = false },
        separator = { fg = "#444444", bg = "none" },
        separator_selected = { fg = "#444444", bg = "none" },
        modified = { fg = "#aaaaaa", bg = "none" },
        modified_selected = { fg = "#ffffff", bg = "none" },
      },
    },
    keys = {
      { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
      { "<S-q>", "<cmd>bd<CR>",                  desc = "Close Buffer" },
    }
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
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost",
    opts = {
      provider_selector = function(_, _, _)
        return { "treesitter", "indent" }
      end,
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
      local language_servers = vim.lsp.get_clients()
      for _, ls in ipairs(language_servers) do
        require('lspconfig')[ls].setup({
          capabilities = capabilities
        })
      end
      require('ufo').setup()
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    end,
  },
  {
    "stevearc/aerial.nvim",
    opts = {
      layout = { max_width = { 40, 0.2 }, min_width = 20 },
      show_guides = true,
      filter_kind = false,
    },
    keys = {
      { "<leader>o", "<cmd>AerialToggle!<CR>", desc = "Toggle outline" },
    },
  },
  {
    "fgheng/winbar.nvim",
    config = function()
      require("winbar").setup({
        enabled = true,
        show_file_path = true,
        show_symbols = true,
        colors = {
          path = "",
          file_name = "",
          symbols = "",
        },
        icons = {
          file_icon_default = "",
          seperator = ">",
          editor_state = "●",
          lock_icon = "",
        },
        exclude_filetype = {
          "help",
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "NvimTree",
          "Trouble",
          "alpha",
          "lir",
          "Outline",
          "spectre_panel",
          "toggleterm",
          "qf",
        },
      })
    end,
  },
}
