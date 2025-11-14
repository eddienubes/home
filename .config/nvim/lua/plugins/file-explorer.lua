return {
	{
		"JezerM/oil-lsp-diagnostics.nvim",
		dependencies = { "stevearc/oil.nvim" },
		opts = {},
	},
	{
		"refractalize/oil-git-status.nvim",
		dependencies = {
			"stevearc/oil.nvim",
		},
		config = true,
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons" } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		config = function()
			local oil = require("oil")
			oil.setup({
				default_file_explorer = true,
				delete_to_trash = true,
				float = {
					border = "rounded",
				},
				view_options = {
					show_hidden = true,
				},
				win_options = {
					signcolumn = "yes:2",
				},
			})

			local last_opened_dir = nil

			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "oil://*",
				callback = function()
					last_opened_dir = oil.get_current_dir()
				end,
			})

			vim.keymap.set({ "n", "v" }, "<leader>e", function()
				if last_opened_dir and vim.fn.isdirectory(last_opened_dir) then
					oil.open_float(last_opened_dir)
				else
					oil.open_float()
				end
			end, { desc = "Open File Explorer" })
		end,
	},
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	-- 	},
	-- 	lazy = false, -- neo-tree will lazily load itself
	-- 	config = function()
	-- 		require("neo-tree").setup({
	-- 			clipboard = {
	-- 				sync = "global",
	-- 				popup_border_style = "winborder",
	-- 				enable_git_status = true,
	-- 				enable_diagnostics = true,
	-- 				modified = {
	-- 					symbol = "+",
	-- 				},
	-- 			},
	-- 			window = {
	-- 				position = "float",
	-- 			},
	-- 		})
	--
	-- 		vim.keymap.set({ "n", "v" }, "<leader>e", "<cmd>Neotree<cr>")
	-- 	end,
	-- },
	-- {
	-- 	"A7Lavinraj/fyler.nvim",
	-- 	dependencies = { "nvim-mini/mini.icons" },
	-- 	branch = "stable",
	-- 	config = function()
	-- 		local fyler = require("fyler")
	-- 		fyler.setup({
	-- 			delete_to_trash = true,
	-- 			icon = {
	-- 				directory_expanded = ")(",
	-- 			},
	-- 		})
	--
	-- 		vim.keymap.set({ "n", "v" }, "<leader>e", function()
	-- 			fyler.toggle({
	-- 				dir = vim.loop.cwd(),
	-- 				kind = "float",
	-- 			})
	-- 		end)
	-- 	end,
	-- },
}
