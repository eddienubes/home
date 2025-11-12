return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

			telescope.setup({
				path_display = { "smart" },
				layout_config = {
					layout_strategy = "horizontal",
					horizontal = {
						width = 0.95, -- 90% of screen width
						height = 0.9,
						preview_width = 0.6,
					},
				},
				defaults = {
					-- Move prompt to top
					layout_config = {
						prompt_position = "top",
					},
					sorting_strategy = "ascending", -- results go top to bottom
				},
				pickers = {

					live_grep = {
						layout_strategy = "horizontal",
						-- Add --fixed-strings flag for literal search
						additional_args = function()
							return { "--fixed-strings", "--trim" }
						end,
						-- Show match in the middle of the result window
						layout_config = {
							horizontal = {
								preview_width = 0.5,
							},
							vertical = {
								width = 0.9,
								height = 0.9,
								preview_height = 0.5,
							},
						},
					},
					find_files = {
						path_display = "smart",
						hidden = true,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "ignore_case", -- or "ignore_case" or "respect_case"
					},
				},
			})

			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
}
