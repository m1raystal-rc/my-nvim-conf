return {
	{
		"nvim-mini/mini.map",
		version = false,
		config = function()
			require("mini.map").setup({})

			-- 自动显示
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "*",
				callback = function()
					if vim.bo.buftype == "" and vim.fn.filereadable(vim.api.nvim_buf_get_name(0)) == 1 then
						require("mini.map").open()
					end
				end,
			})

			-- 快捷键
			vim.keymap.set("n", "<leader>mo", function()
				require("mini.map").toggle()
			end, { desc = "Toggle minimap" })
		end,
	},
}
