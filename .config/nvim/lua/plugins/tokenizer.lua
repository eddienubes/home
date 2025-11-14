return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		setup = function()
			local sitter = require("nvim-treesitter.configs")

			sitter.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"markdown",
					"markdown_inline",
					"tsx",
					"typescript",
					"javascript",
					"html",
					"json",
					"json5",
					"make",
					"python",
					"toml",
                    "xml",
                    "vue",
                    "zig",
                    "angular",
                    "latex",
                    "pug",
                    "sql",
                    "terraform",
                    "yaml",
                    "mermaid",
                    "bash"
				},
			})
		end,
	},
}
