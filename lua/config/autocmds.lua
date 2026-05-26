-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local outline_group = vim.api.nvim_create_augroup("custom_outline_autocmds", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = outline_group,
	callback = function()
		local filetype = vim.bo.filetype
		if filetype and filetype ~= "" and filetype ~= "text" then
			require("outline").open_outline({ focus_outline = false })
		end
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	group = outline_group,
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd("Outline")
		end
	end,
})

local opencode_bin = "/home/m1racleur/.opencode/bin"
if not vim.env.PATH:find(opencode_bin, 1, true) then
	vim.env.PATH = vim.env.PATH .. ":" .. opencode_bin
end
