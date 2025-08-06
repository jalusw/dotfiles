return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
        search = {
            enabled = false,
        },
        char = {
            enabled = false,
        },
        },
    },
    keys = {
        { "<leader>sf", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "<leader>st", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
}