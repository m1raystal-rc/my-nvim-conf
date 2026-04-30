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
			-- 保存当前窗口
			local current_win = vim.api.nvim_get_current_win()
			vim.cmd("Outline")
			-- 切换回原来的窗口
			vim.api.nvim_set_current_win(current_win)
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
