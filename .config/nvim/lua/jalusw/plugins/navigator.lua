return {
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
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")

      fzf.setup({
        "default",
        -- Fully focus on the search list: near-fullscreen centered window with
        -- the preview hidden by default (toggle with F4).
        winopts = {
          height = 0.95,
          width = 0.95,
          row = 0.5,
          col = 0.5,
          relative = "editor",
          border = "rounded",
          title_pos = "center",
          zindex = 60,
          cursorline = true,
          preview = {
            hidden = true,
            layout = "vertical",
            vertical = "down:40%",
            border = "rounded",
            wrap = false,
          },
        },
        -- High-contrast, colorscheme-agnostic highlight groups.
        hls = {
          normal = "NormalFloat",
          border = "FloatBorder",
          title = "FloatTitle",
          search = "Search",
          fzf = {
            normal = "NormalFloat",
            cursorline = "CursorLine",
            match = "Search",
            border = "FloatBorder",
            pointer = "Keyword",
            marker = "Keyword",
            prompt = "Function",
            info = "Comment",
          },
        },
        -- Accessible fzf behavior: wrap-around navigation, more visible rows,
        -- and no bold (easier to read on busy terminals).
        fzf_opts = {
          ["--cycle"] = true,
          ["--info"] = "inline-right",
          ["--layout"] = "reverse",
          ["--height"] = "100%",
          ["--highlight-line"] = true,
          ["--scroll-off"] = "5",
          ["--no-bold"] = true,
        },
        -- Keyboard-first navigation (help always available with `?`).
        keymap = {
          fzf = {
            ["ctrl-j"] = "down",
            ["ctrl-n"] = "down",
            ["ctrl-k"] = "up",
            ["ctrl-p"] = "up",
            ["ctrl-a"] = "beginning-of-line",
            ["ctrl-e"] = "end-of-line",
            ["ctrl-u"] = "unix-line-discard",
            ["ctrl-z"] = "abort",
            ["alt-a"] = "toggle-all",
            ["alt-g"] = "first",
            ["alt-G"] = "last",
            ["f3"] = "toggle-preview-wrap",
            ["f4"] = "toggle-preview",
            ["shift-up"] = "preview-page-up",
            ["shift-down"] = "preview-page-down",
          },
          builtin = {
            ["?"] = "toggle-help",
            ["<F1>"] = "toggle-help",
            ["<F2>"] = "toggle-fullscreen",
            ["<F3>"] = "toggle-preview-wrap",
            ["<F4>"] = "toggle-preview",
            ["<C-j>"] = "down",
            ["<C-n>"] = "down",
            ["<C-k>"] = "up",
            ["<C-p>"] = "up",
            ["<Esc>"] = "abort",
          },
        },
        -- Accessible open actions for file-type pickers.
        actions = {
          files = {
            ["enter"] = fzf.actions.file_edit_or_qf,
            ["ctrl-s"] = fzf.actions.file_split,
            ["ctrl-v"] = fzf.actions.file_vsplit,
            ["ctrl-t"] = fzf.actions.file_tabedit,
            ["alt-q"] = fzf.actions.file_sel_to_qf,
            ["alt-i"] = { fn = fzf.actions.toggle_ignore, reuse = true, header = false },
            ["alt-h"] = { fn = fzf.actions.toggle_hidden, reuse = true, header = false },
          },
        },
        files = {
          prompt = "Files❯ ",
          fd_opts = "--color=never --type f --hidden --follow --exclude .git",
          formatter = "path.filename_first",
        },
        grep = { prompt = "Grep❯ " },
        buffers = { prompt = "Buffers❯ " },
        help_tags = { prompt = "Help❯ " },
      })

      vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find Buffers" })
      vim.keymap.set("n", "<leader>b", "<Nop>", { desc = "Buffers" })
      vim.keymap.set("n", "<leader>bl", fzf.buffers, { desc = "List Buffers" })
      vim.keymap.set("n", "<leader>bc", "<cmd>bdelete<CR>", { desc = "Close Buffer" })
      vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Find Help" })
      vim.keymap.set("n", "<leader>ld", fzf.lsp_definitions, { desc = "LSP Definitions" })
      vim.keymap.set("n", "<leader>lr", fzf.lsp_references, { desc = "LSP References" })
      vim.keymap.set("n", "<leader>li", fzf.lsp_implementations, { desc = "LSP Implementations" })
      vim.keymap.set("n", "<leader>ls", fzf.lsp_document_symbols, { desc = "LSP Symbols" })
      vim.keymap.set("n", "<leader>lw", fzf.lsp_workspace_symbols, { desc = "LSP Workspace Symbols" })
      vim.keymap.set("n", "<leader>le", fzf.diagnostics_document, { desc = "Show Diagnostics" })
    end,
  },
}
