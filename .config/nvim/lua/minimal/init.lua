-- Minimal Neovim Configuration
-- Core IDE: LSP, Autocompletion, Navigation (Grapple, FZF), Git

-- Basic Options
vim.o.filetype = "on"
vim.o.number = true
vim.o.relativenumber = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Essential dependencies
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  -- Theme: Rose Pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
        },
      })
      vim.cmd.colorscheme("rose-pine")
    end,
  },

  -- Treesitter (needed for LSP)
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

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "bashls",
          "ts_ls",
          "jsonls"
        },
        automatic_installation = true,
      })

      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { desc = desc })
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
    end,
  },

  -- Autocompletion
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = "neovim/nvim-lspconfig",
    opts = {
      keymap = { preset = "default" },
      appearance = { use_nvim_cmp_as_default = true },
    },
  },

  -- Navigation: Grapple
  {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Grapple", "GrapplePopup" },
    keys = function()
      local grapple = require("grapple")
      return {
        { "<leader><tab>", grapple.open_tags,                            desc = "Tag file" },
        { "<leader>tt",    grapple.toggle,                               desc = "Toggle tag for current file" },
        { "<leader>tr",    grapple.untag,                                desc = "Remove tag" },
        { "<leader>tx",    grapple.reset,                                desc = "List tags (popup)" },
        { "<leader>t1",    function() grapple.select({ index = 1 }) end, desc = "Go to tag 1" },
        { "<leader>t2",    function() grapple.select({ index = 2 }) end, desc = "Go to tag 2" },
        { "<leader>t3",    function() grapple.select({ index = 3 }) end, desc = "Go to tag 3" },
        { "<leader>t4",    function() grapple.select({ index = 4 }) end, desc = "Go to tag 4" },
        { "<leader>tn",    grapple.cycle_forward,                        desc = "Next tag" },
        { "<leader>tp",    grapple.cycle_backward,                       desc = "Previous tag" },
      }
    end,
    opts = {
      scope = "git",
      icons = true,
    },
  },

  -- Navigation: FZF
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")

      fzf.setup({
        "default",
        winopts = {
          height = 0.85,
          width = 0.80,
          row = 0.35,
          preview = { layout = "horizontal" },
        },
        files = {
          prompt = "Files❯ ",
          fd_opts = "--color=never --type f --hidden --follow --exclude .git",
        },
      })

      vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find Buffers" })
      vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Find Help" })
      vim.keymap.set("n", "<leader>ld", fzf.lsp_definitions, { desc = "LSP Definitions" })
      vim.keymap.set("n", "<leader>lr", fzf.lsp_references, { desc = "LSP References" })
      vim.keymap.set("n", "<leader>li", fzf.lsp_implementations, { desc = "LSP Implementations" })
      vim.keymap.set("n", "<leader>ls", fzf.lsp_document_symbols, { desc = "LSP Symbols" })
      vim.keymap.set("n", "<leader>lw", fzf.lsp_workspace_symbols, { desc = "LSP Workspace Symbols" })
      vim.keymap.set("n", "<leader>le", fzf.diagnostics_document, { desc = "Show Diagnostics" })
    end,
  },

  -- File Explorer: Oil
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = true,
      view_options = { show_hidden = true },
      columns = { "icon", "permission" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
  },

  -- Git
  {
    "tpope/vim-fugitive",
  },
})
