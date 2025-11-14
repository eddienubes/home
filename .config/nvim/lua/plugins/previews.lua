return {
	{
		"folke/snacks.nvim",
		config = function()
			local snacks = require("snacks")
			snacks.setup({
				image = {
					enabled = false,
					-- force = true,
					convert = {
						notify = true,
						-- magick = {
						-- 	-- Try higher resolution for WezTerm (4K-ish)
						-- 	default = {
						-- 		"{src}[0]",
						-- 		"-resize",
						-- 		"4096x4096>", -- Scale down huge images to 4K max
						-- 		"-quality",
						-- 		"90",
						-- 	},
						-- },
					},
					doc = {
						-- enabled = true,
						-- inline = true,
						-- float = true,
						-- max_width = 120,
						-- max_height = 80,
					},
					debug = {
						request = true,
						convert = true,
						placement = true,
					},
				},
			})
		end,
	},
}
