-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.listchars = { tab = "|-", trail = "-" }
--vim.o.guifont = "CartographCF Nerd Font:style=Rugular:h10"
-- for nvide
--vim.g.neovide_text_contrast = 0.8
--vim.g.neovide_text_gamma = 1.4
vim.o.winborder = "rounded"
vim.g.neovide_font_antialiasing = "standard"

-- Window
vim.defer_fn(function()
	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
end, 50)

-- for the dashboard color
vim.defer_fn(function()
	vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#FFB7C5" })
	vim.api.nvim_set_hl(0, "SnacksDashboardTitle", { fg = "#FFB7C5" })
end, 1)
