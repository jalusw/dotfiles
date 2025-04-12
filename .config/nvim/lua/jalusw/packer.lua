vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "debugloop/telescope-undo.nvim" },
    },
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  use({
    "nvim-treesitter/playground",
    requires = { "nvim-treesitter/nvim-treesitter" },
  })

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    requires = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
      { "nvim-telescope/telescope-dap.nvim" },
    },
  })

  use({
    "mfussenegger/nvim-dap",
    requires = {
      { "leoluz/nvim-dap-go" },
      { "williamboman/mason.nvim" },
      { "theHamsta/nvim-dap-virtual-text" },
      { "rcarriga/nvim-dap-ui" },
    },
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
  })

  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
  use({ "mxsdev/nvim-dap-vscode-js" })
  use({
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  })
  use({
    "cbochs/grapple.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  use({
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  use({
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })

  use({
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  })

  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })

  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  })

  use("nvim-telescope/telescope-symbols.nvim")

  use("rose-pine/neovim")

  use("lewis6991/gitsigns.nvim")
  use("stevearc/conform.nvim")
  use("hedyhli/outline.nvim")
  use("tpope/vim-fugitive")
  use("tpope/vim-surround")
  use("folke/trouble.nvim")
  use("folke/flash.nvim")
  use("kevinhwang91/nvim-bqf")
  use("leoluz/nvim-dap-go")
end)
