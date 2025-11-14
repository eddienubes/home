return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- CONFIGURE servers (with settings)
			vim.lsp.config("vtsls", {
				-- settings = {
				-- 	typescript = {
				-- 		preferences = {
				-- 			importModuleSpecifier = "non-relative",
				-- 		},
				-- 	},
				-- },
			})

			-- ENABLE servers (after configuration)
			vim.lsp.enable({ "vtsls", "angularls", "lua_ls" })
			-- Keybindings
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local opts = { buffer = args.buf }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				end,
			})
		end,
	},
}
