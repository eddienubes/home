--
-- START VIM config transfer
--

-- Prepend and append to runtimepath
vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")

-- Set packpath to match runtimepath
vim.opt.packpath = vim.opt.runtimepath:get()

-- Source the old .vimrc (if needed; consider migrating this too)
vim.cmd("source ~/.vimrc")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--
-- END VIM config transfer
--

--
-- START VSCode
--
if vim.g.vscode then
	-- Workaround for vscode-neovim UI desync (issue #2117)

	-- 1. Redraw on CursorHold (idle for some time)
	local redraw_fix = vim.api.nvim_create_augroup("VSCodeRedrawFix", { clear = true })
	vim.api.nvim_create_autocmd("CursorHold", {
		group = redraw_fix,
		callback = function()
			vim.cmd("silent! mode") -- triggers a lightweight redraw
		end,
	})

	-- 2. Redraw immediately after text changes (e.g., visual delete)
	local redraw_group = vim.api.nvim_create_augroup("RedrawOnDelete", { clear = true })
	vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
		group = redraw_group,
		callback = function()
			if vim.fn.mode() == "n" then
				vim.cmd("silent! mode") -- refresh UI after delete/insert
			end
		end,
	})
end
--
-- END VSCode
--

if not vim.g.vscode then
	---
	--- START Plugins
	---

	require("config.lazy")

	--
	-- START Theme
	--

	vim.o.background = "dark"
	vim.cmd([[colorscheme tokyonight]])

	--
	-- END Theme
	--

	---
	--- END Plugins
	---
end

vim.opt.signcolumn = "yes"
