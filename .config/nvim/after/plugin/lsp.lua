---
-- LSP configuration
---
local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

local lsp_attach = function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

---
-- Autocompletion setup
---
local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	snippet = {
		expand = function(args)
			-- You need Neovim v0.10 to use vim.snippet
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
})

require("mason").setup({})
require("mason-lspconfig").setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = { "lua_ls" },
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
		html = function()
			lspconfig.html.setup({
				filetypes = { "html", "ejs" },
			})
		end,
	},
})

vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>') 
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { noremap = true })
vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { noremap = true })
vim.keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<cr>", { noremap = true })
