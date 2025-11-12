return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				delete_to_trash = true,
				float = {
					border = "rounded",
				},
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set({ "n", "v" }, "<leader>e", "<cmd>Oil --float<cr>", { desc = "Open File Explorer" })
		end,
	},
}
