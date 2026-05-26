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

vim.api.nvim_create_autocmd("BufAdd", {
	pattern = "*",
	callback = function()
		local new_buf = tonumber(vim.fn.expand("<abuf>"))
		if vim.bo[new_buf].buftype ~= "" or not vim.fn.buflisted(new_buf) then
			return
		end

		vim.schedule(function()
			if vim.api.nvim_get_current_buf() ~= new_buf then
				return
			end

			for _, b in ipairs(vim.api.nvim_list_bufs()) do
				if b ~= new_buf and vim.bo[b].buftype == "" and vim.fn.buflisted(b) == 1 and vim.api.nvim_buf_is_valid(b) then
					pcall(function()
						vim.bo[b].modified = false
						vim.api.nvim_buf_delete(b, { force = true })
					end)
				end
			end
		end)
	end,
})

vim.env.PATH = vim.env.PATH .. ":/home/m1racleur/.opencode/bin"
